using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Threading;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;
using HDMS.Models.Utilities;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using HDMS.Models.Tsp;

namespace HDMS.Controllers
{
    public class DeliveryPlansController : StaffDefaultController
    {

        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /DeliveryPlans/

        public ViewResult Index()
        {
            var deliveryPlans = new List<DeliveryPlan>();
            var statuses = new List<int>();
            statuses.Add((int)DeliveryPlanStatus.New);
            statuses.Add((int)DeliveryPlanStatus.Assigned);

            try
            {
                if (!string.IsNullOrEmpty(Request["status"]))
                {
                    var statusStrs = Request["status"].Split(',');
                    if (statusStrs.Count() > 0)
                    {
                        statuses = new List<int>();
                        foreach (var statusStr in statusStrs)
                        {
                            switch (statusStr.ToLower())
                            {
                                case "new": statuses.Add((int)DeliveryPlanStatus.New);
                                    break;
                                case "assigned": statuses.Add((int)DeliveryPlanStatus.Assigned);
                                    break;
                                case "finished": statuses.Add((int)DeliveryPlanStatus.Finished);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            deliveryPlans = context.DeliveryPlans.Where(dp => statuses.Contains(dp.DeliveryPlanStatus)).ToList();

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                deliveryPlans = deliveryPlans.Where(dp => dp.CreatedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                deliveryPlans = deliveryPlans.Where(dp => dp.CreatedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(deliveryPlans);
        }

        //
        // GET: /DeliveryPlans/Details/5

        public ViewResult Details(int id)
        {
            DeliveryPlan deliveryplan = context.DeliveryPlans.Find(id);
            if (deliveryplan != null)
            {
                try
                {
                    var deliveryStaffUsers = Roles.GetUsersInRole("Delivery Staff");
                    var deliveryStaffs = from m in context.aspnet_Membership
                                         join u in context.aspnet_Users on m.UserId equals u.UserId
                                         join ui in context.UserInfoes on m.UserId equals ui.UserId
                                         where m.IsApproved && deliveryStaffUsers.Contains(u.UserName)
                                         select new { m.UserId, ui.FullName, u.UserName };
                    if (deliveryplan.AssignedDeliveryStaffId == null)
                    {
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName");
                    }
                    else
                    {
                        var assignedStaff = (from m in context.aspnet_Membership
                                             join u in context.aspnet_Users on m.UserId equals u.UserId
                                             join ui in context.UserInfoes on m.UserId equals ui.UserId
                                             where m.UserId == deliveryplan.AssignedDeliveryStaffId
                                             select new { m.UserId, ui.FullName, u.UserName }
                                            ).FirstOrDefault();
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName",
                                                                        assignedStaff);
                        ViewBag.AssignTo =
                            AccountHelper.GetName(assignedStaff.UserId);
                    }

                    var orderList = new List<Order>();
                    if(deliveryplan.DeliveryOrder != null)
                    {
                        var ids = deliveryplan.DeliveryOrder.Split(',');
                        foreach (var orderId in ids)
                        {
                            orderList.Add(context.Orders.Find(int.Parse(orderId)));
                        }
                    }
                    else
                    {
                        orderList = deliveryplan.Orders.ToList();
                    }

                    ViewBag.Hub = context.Hubs.Find(1);
                    ViewBag.OrderList = orderList;

                    return View(deliveryplan);
                }
                catch (Exception e)
                {
                    return View("Error");
                }
            }
            throw new HttpException(404, "Not found!");
        }

        //public ViewResult DetailsForPrinting(int id)
        //{
        //    DeliveryPlan deliveryplan = context.DeliveryPlans.Find(id);
        //    if (deliveryplan != null)
        //    {
        //        try
        //        {
        //            var assignedStaff = (from ds in context.DeliveryStaffs
        //                                    join u in context.aspnet_Users on ds.UserId equals u.UserId
        //                                    join ui in context.UserInfoes on ds.UserId equals ui.UserId
        //                                    select new { ds.DeliveryStaffId, ui.FullName, u.UserName }
        //                                ).FirstOrDefault();
                        
        //            ViewBag.AssignTo =
        //                AccountHelper.GetName(context.DeliveryStaffs.Find(assignedStaff.DeliveryStaffId).UserId);
                    
        //            var orderList = new List<Order>();
        //            if (deliveryplan.DeliveryOrder != null)
        //            {
        //                var ids = deliveryplan.DeliveryOrder.Split(',');
        //                foreach (var orderId in ids)
        //                {
        //                    orderList.Add(context.Orders.Find(orderId));
        //                }
        //            }
        //            else
        //            {
        //                orderList = deliveryplan.Orders.ToList();
        //            }

        //            ViewBag.Hub = context.Hubs.Find(1);
        //            ViewBag.OrderList = orderList;

        //            return View(deliveryplan);
        //        }
        //        catch (Exception e)
        //        {
        //            return View("Error");
        //        }
        //    }
        //    throw new HttpException(404, "Not found!");
        //}

        public ActionResult PdfDetails(int id)
        {
            DeliveryPlan deliveryplan = context.DeliveryPlans.Find(id);
            if (deliveryplan != null)
            {
                try
                {
                    var assignedStaff = (from m in context.aspnet_Membership
                                         join u in context.aspnet_Users on m.UserId equals u.UserId
                                         join ui in context.UserInfoes on m.UserId equals ui.UserId
                                         where m.UserId == deliveryplan.AssignedDeliveryStaffId
                                         select new { m.UserId, ui.FullName, u.UserName }
                                            ).FirstOrDefault();
                    if(assignedStaff != null) ViewBag.AssignTo = AccountHelper.GetName(assignedStaff.UserId);

                    var orderList = new List<Order>();
                    if (deliveryplan.DeliveryOrder != null)
                    {
                        var ids = deliveryplan.DeliveryOrder.Split(',');
                        foreach (var orderId in ids)
                        {
                            orderList.Add(context.Orders.Find(int.Parse(orderId)));
                        }
                    }
                    else
                    {
                        orderList = deliveryplan.Orders.ToList();
                    }

                    ViewBag.Hub = context.Hubs.Find(1);
                    ViewBag.OrderList = orderList;

                    string appPath = Request.ApplicationPath;
                    string physicalPath = Request.MapPath(appPath);

                    

                    // Create a Document object
                    var document = new Document(PageSize.A4.Rotate());

                    // Create a new PdfWriter object, specifying the output stream
                    var output = new MemoryStream();
                    var writer = PdfWriter.GetInstance(document, output);

                    // Open the Document for writing
                    document.Open();

                    FontFactory.RegisterDirectories();
                    var styleSheet = new StyleSheet();
                    styleSheet.LoadTagStyle(HtmlTags.BODY, HtmlTags.FACE, "Arial Unicode MS");
                    styleSheet.LoadTagStyle(HtmlTags.BODY, HtmlTags.FONTSIZE, "10");
                    styleSheet.LoadTagStyle(HtmlTags.BODY, HtmlTags.SIZE, "1");
                    styleSheet.LoadTagStyle(HtmlTags.BODY, HtmlTags.ENCODING, BaseFont.IDENTITY_H);
                    // Render the view html to a string.
                    string contents = MVCHelper.RenderPartialViewToString(this, "DetailsForPrinting", deliveryplan);

                    // Step 4: Parse the HTML string into a collection of elements...
                    var parsedHtmlElements = HTMLWorker.ParseToList(new StringReader(contents), styleSheet);

                    // Enumerate the elements, adding each one to the Document...
                    foreach (var htmlElement in parsedHtmlElements)
                    {
                        document.Add(htmlElement as IElement);
                    }

                    Image mapImg = null;
                    try
                    {
                        mapImg = Image.GetInstance(new Uri(physicalPath + "MapShots/DeliveryPlan-" + id + ".png"));
                        mapImg.ScaleToFit(PageSize.A4.Height - 72, PageSize.A4.Width - 72);
                    }
                    catch (Exception)
                    {
                        var scriptPath = "'" + physicalPath + "PhantomjsScripts\\DeliveryPlanMapShot.js' ";
                        var planDetailsPath = "http://" + Request.Url.Authority + "/DeliveryPlans/Details/" + id;
                        var outputMapPath = "'" + physicalPath + @"MapShots\DeliveryPlan-" + id + ".png'";
                        var args = scriptPath + " " + planDetailsPath + " " + outputMapPath;

                        Process.Start(@"casperjs", args);

                        var timePassed = 0;
                        while (timePassed < 40000)
                        {
                            try
                            {
                                timePassed += 500;
                                mapImg = Image.GetInstance(new Uri(physicalPath + "MapShots/DeliveryPlan-" + id + ".png"));
                                mapImg.ScaleToFit(PageSize.A4.Height - 72, PageSize.A4.Width - 72);

                                break;
                            }
                            catch (Exception)
                            {
                                Thread.Sleep(500);
                            }
                        }
                    }

                    document.Add(Chunk.NEXTPAGE);

                    Font arial = FontFactory.GetFont("Arial", BaseFont.IDENTITY_H, 13f);
                    var mapHeader = new Paragraph("Phiên giao hàng số #" + id, arial);
                    mapHeader.Alignment = Element.ALIGN_CENTER;
                    document.Add(mapHeader);
                    document.Add(mapImg);
                    document.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", string.Format("inline;filename=Deliver_Plan-{0}.pdf", id));
                    Response.BinaryWrite(output.ToArray());
                   
                    return null;
                }
                catch (Exception e)
                {
                    return View("Error");
                }
            }
            throw new HttpException(404, "Not found!");
        }

        

        //
        // GET: /DeliveryPlans/Create

        public ActionResult Create()
        {
            var usingMap = true;
            if (!string.IsNullOrEmpty(Request["usingMap"]))
            {
                if (Request["usingMap"].ToLower() == "no" || Request["usingMap"].ToLower() == "false") usingMap = false;
            }
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.Hub = context.Hubs.FirstOrDefault();
            if (usingMap) return View("CreateUsingMap");
            return View();
        }

        //
        // POST: /DeliveryPlans/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate()
        {
            try
            {
                var deliveryPlan = new DeliveryPlan();
                var orderIdStrs = Request["selectedOrderIds"].Split(',');
                var orderIds = new int[orderIdStrs.Length];
                for (int i = 0; i < orderIdStrs.Length; i++)
                {
                    orderIds[i] = int.Parse(orderIdStrs[i]);
                }
                if (deliveryPlan.Create(context, orderIds))
                {
                    return Json(new { success = true, deliveryPlanId = deliveryPlan.DeliveryPlanId });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }

            return Json(new { success = false });
        }


        //
        // POST: /DeliveryPlans/Edit/5

        //[HttpPost]
        //public ActionResult Edit(int id)
        //{
        //    DeliveryPlan deliveryplan = context.DeliveryPlans.Single(x => x.DeliveryPlanId == id);

        //    return View(deliveryplan);
        //}

        //
        // POST: /DeliveryPlans/ConfirmEdit/5

        //[HttpPost]
        //public ActionResult ConfirmEdit(DeliveryPlan deliveryplan)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        context.Entry(deliveryplan).State = EntityState.Modified;
        //        context.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View("Edit", deliveryplan);
        //}

        //
        // GET: /DeliveryPlans/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    DeliveryPlan deliveryplan = context.DeliveryPlans.Single(x => x.DeliveryPlanId == id);
        //    return View(deliveryplan);
        //}

        //
        // POST: /DeliveryPlans/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    DeliveryPlan deliveryplan = context.DeliveryPlans.Single(x => x.DeliveryPlanId == id);
        //    context.DeliveryPlans.Remove(deliveryplan);
        //    context.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //[HttpPost]
        //public ActionResult GetStatusByCheckBox()
        //{
        //    var requests = new List<DeliveryPlan>();
        //    if (!string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        //    {
        //        var strStatusValue = Request["selectedStatusIds"].Split(',');
        //        var statusValues = new int[strStatusValue.Length];
        //        for (int i = 0; i < strStatusValue.Length; i++)
        //        {
        //            statusValues[i] = int.Parse(strStatusValue[i]);
        //        }
        //        requests = context.DeliveryPlans.Where(r => statusValues.Contains(r.DeliveryPlanStatus)).ToList();

        //        var startDate = new DateTime();
        //        var endDate = new DateTime();
        //        if (!string.IsNullOrWhiteSpace(Request["startDate"]) && !string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.DeliveryPlans.Where(r => statusValues.Contains(r.DeliveryPlanStatus) && r.CreatedDate >= startDate && r.CreatedDate <= endDate).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["startDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            requests = context.DeliveryPlans.Where(r => statusValues.Contains(r.DeliveryPlanStatus) && r.CreatedDate >= startDate).ToList();

        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.DeliveryPlans.Where(r => statusValues.Contains(r.DeliveryPlanStatus) && r.CreatedDate <= endDate).ToList();

        //        }
        //    }
        //    return View("DeliveryPlansTable", requests);
        //}

        //[HttpPost]
        //public ActionResult GetStatusByCheckBox()
        //{
        //    if (string.IsNullOrWhiteSpace(Request["sttCheckbox"]))
        //    {
        //        var request = context.DeliveryPlans.Where(r => r.DeliveryPlanStatus == -1).ToList();
        //        return View(request);
        //    }
        //    else
        //    {
        //        if (string.IsNullOrWhiteSpace(Request["startDate"]) && string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            var strValues = Request["sttCheckbox"].Split(',');
        //            var values = new int[strValues.Length];
        //            for (int i = 0; i < strValues.Length; i++)
        //            {
        //                values[i] = int.Parse(strValues[i]);
        //            }
        //            var requests = context.DeliveryPlans.Where(r => values.Contains(r.DeliveryPlanStatus)).ToList();
        //            return View(requests);
        //        }
        //        else
        //        {
        //            if (string.IsNullOrWhiteSpace(Request["startDate"]))
        //            {
        //                var strEndDate = DateTime.Parse(Request["endDate"]);
        //                var strValues = Request["sttCheckbox"].Split(',');
        //                var values = new int[strValues.Length];
        //                for (int i = 0; i < strValues.Length; i++)
        //                {
        //                    values[i] = int.Parse(strValues[i]);
        //                }
        //                var requests = context.DeliveryPlans.Where(r => values.Contains(r.DeliveryPlanStatus))
        //                    .Where(r => r.EndDate <= strEndDate).ToList();

        //                return View(requests);
        //            }
        //            else
        //            {
        //                if (string.IsNullOrWhiteSpace(Request["endDate"]))
        //                {
        //                    var strStartDate = DateTime.Parse(Request["startDate"]);
        //                    var strValues = Request["sttCheckbox"].Split(',');
        //                    var values = new int[strValues.Length];
        //                    for (int i = 0; i < strValues.Length; i++)
        //                    {
        //                        values[i] = int.Parse(strValues[i]);
        //                    }
        //                    var requests = context.DeliveryPlans.Where(r => values.Contains(r.DeliveryPlanStatus))
        //                        .Where(r => r.StartDate >= strStartDate).ToList();

        //                    return View(requests);
        //                }
        //                else
        //                {
        //                    var strStartDate = DateTime.Parse(Request["startDate"]);
        //                    var strEndDate = DateTime.Parse(Request["endDate"]);
        //                    var strValues = Request["sttCheckbox"].Split(',');
        //                    var values = new int[strValues.Length];
        //                    for (int i = 0; i < strValues.Length; i++)
        //                    {
        //                        values[i] = int.Parse(strValues[i]);
        //                    }
        //                    var requests = context.DeliveryPlans.Where(r => values.Contains(r.DeliveryPlanStatus))
        //                        .Where(r => r.StartDate >= strStartDate && r.EndDate <= strEndDate).ToList();

        //                    return View(requests);
        //                }
        //            }
        //        }
        //    }
        //}

        [HttpPost]
        public ActionResult Assign(int deliveryPlanId, Guid staffUserId)
        {
            try
            {
                var deliveryPlan = context.DeliveryPlans.Find(deliveryPlanId);
                var staff = Membership.GetUser(staffUserId);
                if (!staff.IsApproved) return Json(new { success = false });
                if (deliveryPlan != null && staff != null)
                {
                    deliveryPlan.AssignedDeliveryStaffId = staffUserId;
                    deliveryPlan.UpdateStatus(DeliveryPlanStatus.Assigned);
                    context.SaveChanges();
                    return Json(new { success = true, staffName = AccountHelper.GetName(staffUserId) });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        //[HttpPost]
        //public ActionResult UpdateStatus(int deliveryPlanId, int newStatus)
        //{
        //    try
        //    {
        //        var deliveryPlan = context.DeliveryPlans.Find(deliveryPlanId);
        //        deliveryPlan.UpdateStatus((DeliveryPlanStatus)newStatus);
        //        context.SaveChanges();
        //        return Json(new { success = true });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false });
        //    }
        //}


        [HttpPost]
        public ActionResult GetUnplannedOrdersByCityProvince(int id, int[] selectedOrderIds)
        {
            try
            {
                if (selectedOrderIds == null) selectedOrderIds = new int[0];
                var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                            && o.OrderStatus == (int)OrderStatus.Collected
                                                            && o.District.CityProvinceId == id
                                                            && !selectedOrderIds.Contains(o.OrderId)
                                                            ).OrderBy(o => o.DueDate).ToList();
                var orderViewModels = new List<OrderViewModel>();
                foreach (var order in orders)
                {
                    orderViewModels.Add(new OrderViewModel(order));
                }
                return Json(new { success = true, orders = orderViewModels });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        [HttpPost]
        public ActionResult GetUnplannedOrdersByDistrict(int id, int[] selectedOrderIds)
        {
            if (selectedOrderIds == null) selectedOrderIds = new int[0];
            var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                        && o.OrderStatus == (int)OrderStatus.Collected
                                                        && o.ReceiverAddressDistrictId == id
                                                        && !selectedOrderIds.Contains(o.OrderId)
                                                        ).OrderBy(o => o.DueDate).ToList();
            var orderViewModels = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                orderViewModels.Add(new OrderViewModel(order));
            }
            return Json(new { success = true, orders = orderViewModels });
        }

        [HttpPost]
        public ActionResult GetUnplannedOrdersByWard(int id, int[] selectedOrderIds)
        {
            if (selectedOrderIds == null) selectedOrderIds = new int[0];
            var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                        && o.OrderStatus == (int)OrderStatus.Collected
                                                        && o.ReceiverAddressWardId == id
                                                        && !selectedOrderIds.Contains(o.OrderId)
                                                        ).OrderBy(o => o.DueDate).ToList();
            var orderViewModels = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                orderViewModels.Add(new OrderViewModel(order));
            }
            return Json(new { success = true, orders = orderViewModels });
        }

        [HttpPost]
        public ActionResult MarkAsFinished(int id, bool removeUnfinishedOrders)
        {
            try
            {
                var deliveryPlan = context.DeliveryPlans.Find(id);
                if (deliveryPlan.MarkAsFinished(context, removeUnfinishedOrders))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                var deliveryPlan = context.DeliveryPlans.Find(id);
                if (deliveryPlan.Cancel(context))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult RecalculateRoute(int id)
        {
            try
            {
                string appPath = Request.ApplicationPath;
                string physicalPath = Request.MapPath(appPath);
                var mapImgPath = physicalPath + "MapShots/DeliveryPlan-" + id + ".png";
                if (System.IO.File.Exists(mapImgPath))
                {
                    System.IO.File.Delete(mapImgPath);
                }

                var deliveryPlan = context.DeliveryPlans.Find(id);
                deliveryPlan.CalculateRoute(context);
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }
    }
}
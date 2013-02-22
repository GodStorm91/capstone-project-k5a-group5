using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;
using HDMS.Models.Statuses;
using System.Web.Security;
using System.Data;
using HDMS.Models.ViewModels;

namespace HDMS.Areas.Customer.Controllers
{
    public class ItemManagementController : Controller
    {
        private HDMSEntities context = new HDMSEntities();
        public ViewResult Index()
        {
            var itemmanagement = new List<ItemManagement>();
            var statuses = new List<int>();
            statuses.Add((int)ItemManagementStatus.Active);
            statuses.Add((int)ItemManagementStatus.Deactive);

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
                                case "active": statuses.Add((int)ItemManagementStatus.Active);
                                    break;
                                case "deactive": statuses.Add((int)ItemManagementStatus.Deactive);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            itemmanagement = context.ItemManagements.Where(i => i.VendorID == userInfo.CustomerId
                                            && statuses.Contains((int)i.Status)).ToList();
            ViewBag.Customer = userInfo.Customer.CompanyName;

            ViewBag.SelectedStatuses = statuses;

            return View(itemmanagement);
        }

        //
        // GET: /CustomerSideItemManagement/Create

        public ActionResult Create()
        {
            var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            return View();
        }

        //
        // POST: /CustomerSideItemManagemet/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(ItemManagement item, HttpPostedFileBase image)
        {
            try
            {
                var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                ViewBag.Customer = userInfo.Customer.CompanyName;
                if (ModelState.IsValid)
                {
                    if (image != null)
                    {
                        item.ImageMime = image.ContentType;
                        item.ImageData = new byte[image.ContentLength];
                        image.InputStream.Read(item.ImageData, 0, image.ContentLength);
                    }
                    item.Status = 1;
                    item.VendorID = userInfo.CustomerId;
                    context.ItemManagements.Add(item);
                    context.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

            }
            return RedirectToAction("Index");
        }

        //
        // GET: /CustomerSideOrder/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            //var item = context.ItemManagements.Find(id);
            //if (item.VendorID != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            //ViewBag.Customer = userInfo.Customer.CompanyName;
            //return View(item);

            ItemManagement itemManagement = context.ItemManagements.Find(id);
            return View(itemManagement);
        }

        //
        // POST: /CustomerSideOrder/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(ItemManagement item, HttpPostedFileBase image)
        {
            try
            {
                var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                ViewBag.Customer = userInfo.Customer.CompanyName;
                if (ModelState.IsValid)
                {
                    if (image != null)
                    {
                        item.ImageMime = image.ContentType;
                        item.ImageData = new byte[image.ContentLength];
                        image.InputStream.Read(item.ImageData, 0, image.ContentLength);
                    }
                    item.VendorID = userInfo.CustomerId;
                    context.Entry(item).State = EntityState.Modified;
                    context.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {

            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var itemManagement = context.ItemManagements.Find(id);
                context.ItemManagements.Remove(itemManagement);
                context.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        public FileContentResult GetImage(int itemID)
        {
            ItemManagement item = context.ItemManagements.FirstOrDefault(i => i.ItemID == itemID);
            if (item != null)
            {
                return File(item.ImageData, item.ImageMime);
            }
            else
            {
                return null;
            }

        }

        //
        // GET: /CustomerSideOrder/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    Order order = context.Orders.Single(x => x.OrderId == id);
        //    return View(order);
        //}

        //
        // POST: /CustomerSideOrder/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    try
        //    {
        //        Order order = context.Orders.Find(id);
        //        if (order.Delete(context))
        //        {
        //            return Json(new { success = true });
        //        }
        //        return Json(new { success = false });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false });
        //    }
        //}

        //[HttpPost]
        //public ActionResult RequestListByStatus()
        //{
        //    var requests = new List<Order>();
        //    if (!string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        //    {
        //        MembershipUser currentUser = Membership.GetUser(User.Identity.Name);
        //        UserInfo info = context.UserInfoes.Single(x => x.UserId == (Guid)currentUser.ProviderUserKey);
        //        //HDMS.Models.Customer customer = context.Customers.Single(x => x.CustomerId == info.CustomerId);
        //        //var request = context.Requests.Where(x => x.CustomerId == info.CustomerId).ToList();


        //        var strStatusValue = Request["selectedStatusIds"].Split(',');
        //        var statusValues = new int[strStatusValue.Length];
        //        for (int i = 0; i < strStatusValue.Length; i++)
        //        {
        //            statusValues[i] = int.Parse(strStatusValue[i]);
        //        }
        //        requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.CustomerId == info.CustomerId).ToList();

        //        var startDate = new DateTime();
        //        var endDate = new DateTime();
        //        if (!string.IsNullOrWhiteSpace(Request["startDate"]) && !string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate >= startDate && r.Request.RequestedDate <= endDate && r.Request.CustomerId == info.CustomerId).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["startDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate >= startDate && r.Request.CustomerId == info.CustomerId).ToList();

        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate <= endDate && r.Request.CustomerId == info.CustomerId).ToList();

        //        }
        //    }
        //    return View("OrdersTable", requests);
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        context.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //[HttpPost]
        //public ActionResult Cancel(int id)
        //{
        //    try
        //    {
        //        var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
        //        var order = context.Orders.Find(id);
        //        if (order.Request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
        //        ViewBag.Customer = userInfo.Customer.CompanyName;

        //        if (order.CustomerCancel(context))
        //        {
        //            return Json(new { success = true });
        //        }
        //        return Json(new { success = false });
        //    }
        //    catch (Exception)
        //    {
        //        return Json(new { success = false });
        //    }
        //}


    }
}
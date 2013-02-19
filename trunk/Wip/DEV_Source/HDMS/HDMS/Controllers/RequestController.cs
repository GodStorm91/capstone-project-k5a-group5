using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Controllers
{
    public class RequestController : StaffDefaultController
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /Requests/

        public ViewResult Index()
        {
            var requests = new List<Request>();
            var statuses = new List<int>();
            statuses.Add((int)RequestStatus.New);
            statuses.Add((int)RequestStatus.Approved);
            statuses.Add((int)RequestStatus.PlannedForCollecting);
            statuses.Add((int)RequestStatus.Collected);
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
                                case "draft": statuses.Add((int)RequestStatus.Draft);
                                    break;
                                case "new": statuses.Add((int)RequestStatus.New);
                                    break;
                                case "approved": statuses.Add((int)RequestStatus.Approved);
                                    break;
                                case "planned": statuses.Add((int)RequestStatus.PlannedForCollecting);
                                    break;
                                case "collected": statuses.Add((int)RequestStatus.Collected);
                                    break;
                                case "finished": statuses.Add((int)RequestStatus.Finished);
                                    break;
                                case "canceled": statuses.Add((int)RequestStatus.Canceled);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            requests = context.Requests.Where(r => statuses.Contains(r.RequestStatus)).ToList();

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                requests = requests.Where(r => r.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                requests = requests.Where(r => r.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;
            return View(requests);
        }

        //
        // GET: /Requests/Details/5

        public ViewResult Details(int id)
        {
            Request request = context.Requests.Find(id);
            if (request != null)
            {
                return View(request);
            }
            throw new HttpException(404, "Not found!");
        }

        //
        // POST: /Requests/Create

        [HttpPost]
        public ActionResult Create()
        {
            ViewBag.PossibleCustomers = context.Customers.Where(c => c.IsActive);
            ViewBag.PossibleCollectionAddresses = new SelectList(new List<CustomerAddress>());
            return View();
        }

        //
        // POST: /Requests/Create

        [HttpPost]
        public ActionResult ConfirmCreate(int CustomerId, int CollectionAddressId, string Note, HttpPostedFileBase excelFile)
        {
            try
            {
                var request = new Request
                                  {
                                      CustomerId = CustomerId,
                                      CollectionAddressId = CollectionAddressId,
                                      Note = Note
                                  };
                if (request.Create(context))
                {
                    if (excelFile != null)
                    {
                        string savedFileName = "~/Excel/" + excelFile.FileName;
                        excelFile.SaveAs(Server.MapPath(savedFileName));

                        var connectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", Server.MapPath(savedFileName));
                        OleDbConnection objConn = new OleDbConnection(connectionString);
                        objConn.Open();
                        var dt = objConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                        String[] excelSheets = new String[dt.Rows.Count];
                        int x = 0;

                        foreach (DataRow row in dt.Rows)
                        {
                            excelSheets[x] = row["TABLE_NAME"].ToString();
                            x++;
                        }

                        for (int j = 0; j < excelSheets.Length; j++)
                        {
                            if (excelSheets[j].Contains("Order"))
                            {
                                var adapter = new OleDbDataAdapter("SELECT * FROM " + "[" + excelSheets[j] + "]", connectionString);
                                var ds = new DataSet();
                                adapter.Fill(ds, "results");
                                DataTable data = new DataTable();
                                data = ds.Tables["results"];

                                var orders = new List<Order>();
                                var items = new List<Item>();

                                Order order = new Order();

                                for (int i = 0; i < data.Rows.Count; i++)
                                {
                                    var receiverName = data.Rows[i].Field<string>("Receiver Name");
                                    var receiverPhone = data.Rows[i].Field<string>("Receiver Phone");
                                    var receiverAddress = data.Rows[i].Field<string>("Receiver Address");
                                    var drOption = data.Rows[i].Field<string>("Delivery Option");
                                    var orPaymentType = data.Rows[i].Field<string>("Order Payment Type");
                                    var cityName = data.Rows[i].Field<string>("City");
                                    var districtName = data.Rows[i].Field<string>("District");
                                    var wardName = data.Rows[i].Field<string>("Ward");
                                    var amount = data.Rows[i].Field<string>("Amount");

                                    if (i == 0)
                                    {
                                        if (string.IsNullOrEmpty(receiverName) == false && string.IsNullOrEmpty(receiverPhone) == false
                                            && string.IsNullOrEmpty(receiverAddress) == false && string.IsNullOrEmpty(amount) == false 
                                            && string.IsNullOrEmpty(drOption) == false && string.IsNullOrEmpty(orPaymentType) == false
                                            && string.IsNullOrEmpty(districtName) == false && string.IsNullOrEmpty(cityName) == false
                                            && string.IsNullOrEmpty(wardName) == false)
                                        {
                                            var deliveryOption = context.DeliveryOptions.Single(dr => dr.Name == drOption);
                                            var orderPaymentType = context.OrderPaymentTypes.Single(op => op.Name == orPaymentType);
                                            var district = context.Districts.Single(di => di.Name == districtName);
                                            var ward = context.Wards.Single(w => w.Name == wardName && w.DistrictId == district.DistrictId);

                                            order.RequestId = request.RequestId;
                                            order.DeliveryOptionId = deliveryOption.DeliveryOptionId;
                                            order.OrderPaymentTypeId = orderPaymentType.OrderPaymentTypeId;
                                            order.ReceiverName = receiverName;
                                            order.ReceiverPhone = receiverPhone;
                                            order.ReceiverAddress = receiverAddress;
                                            order.ReceiverAddressDistrictId = district.DistrictId;
                                            order.ReceiverAddressWardId = ward.WardId;
                                            order.AmountToBeCollectedFromReceiver = int.Parse(amount);
                                            order.Note = data.Rows[i].Field<string>("Note");

                                            orders.Add(order);
                                            context.Orders.Add(order);
                                        }else
                                        {
                                            return View("CreateUnsuccessful");
                                        }
                                    }
                                    
                                    if(i == 4)
                                    {
                                        for (int k = 4; k < data.Rows.Count; k++)
                                        {
                                            var name = data.Rows[k].Field<string>("Receiver Name");
                                            var quantity = data.Rows[k].Field<string>("Receiver Phone");
                                            var isFragile = data.Rows[k].Field<string>("City");
                                            var hasHighValue = data.Rows[k].Field<string>("District");
                                            var size = data.Rows[k].Field<string>("Ward");
                                            var weight = data.Rows[k].Field<string>("Receiver Address");

                                            if (string.IsNullOrEmpty(name) == false && string.IsNullOrEmpty(quantity) == false
                                                && string.IsNullOrEmpty(isFragile) == false && string.IsNullOrEmpty(hasHighValue) == false
                                                && string.IsNullOrEmpty(size) == false && string.IsNullOrEmpty(weight) == false)
                                            {
                                                Item item = new Item();

                                                item.OrderId = order.OrderId;
                                                item.Name = name;
                                                item.Quantity = int.Parse(quantity);
                                                if (isFragile == "True")
                                                {
                                                    item.IsFragile = true;
                                                }
                                                else
                                                {
                                                    item.IsFragile = false;
                                                }
                                                if (hasHighValue == "True")
                                                {
                                                    item.HasHighValue = true;
                                                }
                                                else
                                                {
                                                    item.HasHighValue = false;
                                                }
                                                item.Size = size;
                                                item.Weight = weight;
                                                item.Note = data.Rows[k].Field<string>("Amount");

                                                items.Add(item);
                                                context.Items.Add(item);
                                                context.SaveChanges();
                                            }
                                            else
                                            {
                                                return View("CreateUnsuccessful");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return RedirectToAction("AddOrders", new { id = request.RequestId });
                }
                return View("CreateUnsuccessful");
            }
            catch (Exception)
            {
                return View("CreateUnsuccessful");
            }

        }



        //
        // GET: /Requests/Edit/5

        //public ActionResult Edit(int id)
        //{
        //    Request request = context.Requests.Find(id);
        //    ViewBag.PossibleCustomers = context.Customers;
        //    return View(request);
        //}

        //
        // POST: /Requests/Edit/5

        //[HttpPost]
        //public ActionResult Edit(Request request)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        context.Entry(request).State = EntityState.Modified;
        //        context.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.PossibleCustomers = context.Customers;
        //    return View(request);
        //}

        //
        // GET: /Requests/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    Request request = context.Requests.Single(x => x.RequestId == id);
        //    return View(request);
        //}

        //
        // POST: /Requests/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Request request = context.Requests.Single(x => x.RequestId == id);
        //    context.Requests.Remove(request);
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
        //public ActionResult GetRequestsOfCityProvince(int id)
        //{
        //    var requests = context.Requests.Where(cr => cr.CustomerAddress.District.CityProvinceId == id);
        //    if (requests != null)
        //    {
        //        var jsonRequests = new List<JsonRequest>();
        //        foreach (var request in requests)
        //        {
        //            var jsonRequest = new JsonRequest
        //                                  {
        //                                      RequestId = request.RequestId,
        //                                      RequestedDate = request.RequestedDate,
        //                                      CustomerDisplayName = request.Customer.DisplayName,
        //                                      CollectionAddress = request.CollectionAddress
        //                                  };
        //            jsonRequests.Add(jsonRequest);
        //        }
        //        return Json(new { success = true, jsonRequests });
        //    }
        //    return Json(new { success = false });
        //}

        //private class JsonRequest
        //{
        //    public int RequestId { get; set; }
        //    public string CustomerDisplayName { get; set; }
        //    public string CollectionAddress { get; set; }
        //    public Nullable<System.DateTime> RequestedDate { get; set; }
        //}

        //[HttpPost]
        //public ActionResult RequestListByStatus()
        //{
        //    var requests = new List<Request>();
        //    if (!string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        //    {
        //        var strStatusValue = Request["selectedStatusIds"].Split(',');
        //        var statusValues = new int[strStatusValue.Length];
        //        for (int i = 0; i < strStatusValue.Length; i++)
        //        {
        //            statusValues[i] = int.Parse(strStatusValue[i]);
        //        }
        //        requests = context.Requests.Where(r => statusValues.Contains(r.RequestStatus)).ToList();

        //        var startDate = new DateTime();
        //        var endDate = new DateTime();
        //        if (!string.IsNullOrWhiteSpace(Request["startDate"]) && !string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Requests.Where(r => statusValues.Contains(r.RequestStatus) && r.RequestedDate >= startDate && r.RequestedDate <= endDate).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["startDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            requests = context.Requests.Where(r => statusValues.Contains(r.RequestStatus) && r.RequestedDate >= startDate).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Requests.Where(r => statusValues.Contains(r.RequestStatus) && r.RequestedDate <= endDate).ToList();
        //        }
        //    }
        //    return View("RequestTable", requests);
        //}

        public ActionResult AddOrders(int id)
        {
            Request request = context.Requests.Find(id);
            if (request != null)
            {
                if (request.Status != RequestStatus.Draft) return RedirectToAction("Index");
                return View(request);
            }
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult Submit(int id)
        {
            try
            {
                var request = context.Requests.Find(id);
                if (request.Confirm(context)) return Json(new { success = true, requestId = request.RequestId });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        //[HttpPost]
        //public ActionResult UpdateStatus(int requestId, int newStatus)
        //{
        //    try
        //    {
        //        var request = context.Requests.Find(requestId);
        //        request.UpdateStatus((RequestStatus)newStatus);
        //        context.SaveChanges();
        //        return Json(new { success = true });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false });
        //    }
        //}

        [HttpPost]
        public ActionResult RemoveFromCollectionPlan(int id)
        {
            try
            {
                var request = context.Requests.Find(id);
                if (request.RemoveFromCollectionPlan(context))
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
        public ActionResult GetTotalFee(int id)
        {
            var request = context.Requests.Find(id);
            return Json(new { success = true, totalFee = request.TotalFee });
        }

        public ActionResult ApproveOrders(int id)
        {
            var request = context.Requests.Find(id);
            if (request.Status != RequestStatus.New) return RedirectToAction("Index");
            var unapprovedOrders = request.ValidOrders.Where(o => o.OrderStatus != (int)OrderStatus.Approved).ToList();
            ViewBag.RequestApprovable = unapprovedOrders.Count == 0 ? true : false;
            return View(request);
        }

        [HttpPost]
        public ActionResult Approve(int id)
        {
            var request = context.Requests.Find(id);
            if (request.Status != RequestStatus.New) return Json(new { success = false });
            if (request.Approve(context))
            {
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        [HttpPost]
        public ActionResult Reject(int id)
        {
            try
            {
                var request = context.Requests.Find(id);
                if (request.Reject(context))
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
                var request = context.Requests.Find(id);
                if (request.Cancel(context))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult MarkAsCollected()
        {
            try
            {
                var requestIdStrs = Request["collectedRequest"].Split(',');
                var requestIds = new int[requestIdStrs.Length];
                for (int i = 0; i < requestIdStrs.Length; i++)
                {
                    requestIds[i] = int.Parse(requestIdStrs[i]);
                }
                var requests = context.Requests.Where(r => requestIds.Contains(r.RequestId)).ToList();
                if (Models.Request.MarkAsCollected(context, requests))
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
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
        {
            try
            {
                var request = context.Requests.Find(id);
                if (request.CustomerAddress.UpdateLocation(context, latitude, longitude)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }
    }
}
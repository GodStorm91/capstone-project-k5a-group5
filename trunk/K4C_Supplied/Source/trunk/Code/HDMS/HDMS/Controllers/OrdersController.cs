using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models.Utilities;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Controllers
{

    public class OrdersController : StaffDefaultController
    {
        private HDMSEntities context = new HDMSEntities();

        public ViewResult Index()
        {
            var orders = new List<Order>();
            var statuses = new List<int>();
            statuses.Add((int)OrderStatus.New);
            statuses.Add((int)OrderStatus.Approved);
            statuses.Add((int)OrderStatus.PlannedForCollecting);
            statuses.Add((int)OrderStatus.Collected);
            statuses.Add((int)OrderStatus.ToBeReturned);
            statuses.Add((int)OrderStatus.PlannedForDelivering);

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
                                case "draft": statuses.Add((int)OrderStatus.Draft);
                                    break;
                                case "new": statuses.Add((int)OrderStatus.New);
                                    break;
                                case "approved": statuses.Add((int)OrderStatus.Approved);
                                    break;
                                case "plannedforcollecting": statuses.Add((int)OrderStatus.PlannedForCollecting);
                                    break;
                                case "collected": statuses.Add((int)OrderStatus.Collected);
                                    break;
                                case "tobereturned": statuses.Add((int)OrderStatus.ToBeReturned);
                                    break;
                                case "plannedfordelivering": statuses.Add((int)OrderStatus.PlannedForDelivering);
                                    break;
                                case "delivered": statuses.Add((int)OrderStatus.Delivered);
                                    break;
                                case "returned": statuses.Add((int)OrderStatus.Returned);
                                    break;
                                case "canceled": statuses.Add((int)OrderStatus.Canceled);
                                    break;
                                case "rejected": statuses.Add((int)OrderStatus.Rejected);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            orders = context.Orders.Where(o => statuses.Contains(o.OrderStatus)).ToList();

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                orders = orders.Where(o => o.Request.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                orders = orders.Where(o => o.Request.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(orders);
        }

        //
        // GET: /CustomerSideOrder/Details/5

        public ViewResult Details(int id)
        {
            Order order = context.Orders.Find(id);

            ViewBag.Items = order.Items.ToList();

            return View(order);
        }

        //
        // GET: /CustomerSideOrder/Create

        public ActionResult Create(int requestId)
        {
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name");
            ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name");
            ViewBag.RequestId = requestId;
            return View();
        }

        //
        // POST: /CustomerSideOrder/Create

        [HttpPost]
        public ActionResult ConfirmCreate(Order order)
        {
            try
            {
                var request = context.Requests.Find(order.RequestId);
                if (order.AddToRequest(context,request))
                {
                    var myContext = new HDMSEntities();
                    order = myContext.Orders.Find(order.OrderId);
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
                }

                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        //
        // GET: /CustomerSideOrder/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            Order order = context.Orders.Single(x => x.OrderId == id);
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", order.District.CityProvinceId);
            ViewBag.PossibleDistricts = new SelectList(order.District.CityProvince.Districts.Where(d => d.IsActive), "DistrictId", "Name", order.ReceiverAddressDistrictId);
            ViewBag.PossibleWards = new SelectList(order.District.Wards.Where(w => w.IsActive), "WardId", "Name", order.ReceiverAddressWardId);
            ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name", order.DeliveryOptionId);
            ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name", order.OrderPaymentTypeId);
            return View(order);
        }

        //
        // POST: /CustomerSideOrder/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(Order order)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    GoogleMapsHelper.UpdateMapLocation(context, order, false);
                    order.Status = OrderStatus.Draft;
                    context.Entry(order).State = EntityState.Modified;
                    context.SaveChanges();
                    var myContext = new HDMSEntities();
                    order = myContext.Orders.Find(order.OrderId);
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
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
        ////{
        ////    if (string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        ////    {
        ////        var order = context.Orders.Where(r => r.OrderStatus == -1).ToList();
        ////        return View(order);
        ////    }
        ////    else
        //{
        //    var requests = new List<Order>();
        //    if (!string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        //    {
        //        var strStatusValue = Request["selectedStatusIds"].Split(',');
        //        var statusValues = new int[strStatusValue.Length];
        //        for (int i = 0; i < strStatusValue.Length; i++)
        //        {
        //            statusValues[i] = int.Parse(strStatusValue[i]);
        //        }
        //        requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus)).ToList();

        //        var startDate = new DateTime();
        //        var endDate = new DateTime();
        //        if (!string.IsNullOrWhiteSpace(Request["startDate"]) && !string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate >= startDate && r.Request.RequestedDate <= endDate).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["startDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate >= startDate).ToList();

        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.Orders.Where(r => statusValues.Contains(r.OrderStatus) && r.Request.RequestedDate <= endDate).ToList();

        //        }
        //    }
        //    return View("OrdersTable", requests);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                if (order.Cancel(context))
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

        //[HttpPost]
        //public ActionResult UpdateStatus(int OrderId, int newStatus)
        //{
        //    try
        //    {
        //        var order = context.Orders.Find(OrderId);
        //        order.UpdateStatus((OrderStatus)newStatus);
        //        context.SaveChanges();
        //        return Json(new { success = true });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false });
        //    }
        //}

        //public ActionResult Browse()
        //{
        //    return View(context.Orders.ToList());
        //}

        //[HttpPost]
        //public ActionResult SetFeeAndDueDate(int id)
        //{
        //    var order = context.Orders.Find(id);
        //    if (order != null)
        //    {
        //        return View(order);
        //    }
        //    throw new HttpException(404, "Not found!");
        //}

        [HttpPost]
        public ActionResult Approve()
        {
            try
            {
                if (string.IsNullOrWhiteSpace(Request["OrderId"]) || string.IsNullOrWhiteSpace(Request["DueDate"]) 
                    || string.IsNullOrWhiteSpace(Request["Fee"]))
                {
                    return Json(new { success = false });
                }
                var order = context.Orders.Find(int.Parse(Request["OrderId"]));
                var dueDate = DateTime.ParseExact(Request["DueDate"], "dd/MM/yyyy", null);
                var fee = int.Parse(Request["Fee"]);
                if(order.Approve(context, dueDate, fee))
                {
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult Reject(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                if (order.Reject(context))
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
        public ActionResult Disapprove(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                if (order.Disapprove(context)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult MarkAsDelivered()
        {
            try
            {
                var orderIdStrs = Request["deliveredOrder"].Split(',');
                var orderIds = new int[orderIdStrs.Length];
                for (int i = 0; i < orderIdStrs.Length; i++)
                {
                    orderIds[i] = int.Parse(orderIdStrs[i]);
                }
                var orders = context.Orders.Where(o => orderIds.Contains(o.OrderId)).ToList();
                if (Order.MarkAsDelivered(context, orders))
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
        public ActionResult MarkAsReturned(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                if (order.MarkAsReturned(context)) return Json(new { success = true });
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
                var order = context.Orders.Find(id);
                if(order.UpdateLocation(context,latitude,longitude)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult RemoveFromDeliveryPlan(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                if (order.RemoveFromDeliveryPlan(context))
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
    }
}
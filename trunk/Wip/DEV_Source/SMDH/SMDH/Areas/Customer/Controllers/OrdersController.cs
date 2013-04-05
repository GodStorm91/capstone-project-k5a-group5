﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SMDH.Models;
using SMDH.Models.Statuses;
using SMDH.Models.Concrete;
using SMDH.Models.ViewModels;

namespace SMDH.Areas.Customer.Controllers
{
    public class OrdersController : CustomerDefaultController
    {
        private SMDHDataContext context = new SMDHDataContext();

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
                                case "delivering": statuses.Add((int)OrderStatus.Delivering);
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

            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            orders = context.Orders.Where(o => o.Request.CustomerId == userInfo.CustomerId
                                            && statuses.Contains(o.OrderStatus)).ToList();
            //orders = context.Orders.Where(o => o.Request.CustomerId == 1//userInfo.CustomerId
            //                                && statuses.Contains(o.OrderStatus)).ToList();
            ViewBag.Customer = "Test company";//userInfo.Customer.CompanyName;

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"].Trim(), "ddMMyyyy", null);
                orders = orders.Where(o => o.Request.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"].Trim(), "ddMMyyyy", null);
                orders = orders.Where(o => o.Request.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", endDate);
            }

            ViewBag.SelectedStatuses = statuses;

            return View(orders);
        }

        //
        // GET: /CustomerSideOrder/Details/5

        public ViewResult Details(int id)
        {
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            //var order = context.Orders.Find(id);
            var order = context.Orders.Single(o=> o.OrderId == id);
            if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            ViewBag.Customer = "Test Company";//userInfo.Customer.CompanyName;
            ViewBag.Items = context.Items.Where(i => i.OrderId == id).ToList();

            return View(order);
        }

        //
        // GET: /CustomerSideOrder/Create

        public ActionResult Create(int requestId)
        {
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            //var request = context.Requests.Find(requestId);
            var request = context.Requests.Single( o=> o.RequestId == requestId);
            if (request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            ViewBag.Customer = "Test Company";//userInfo.Customer.CompanyName;
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name");
            ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(op => op.IsActive).ToList(), "OrderPaymentTypeId", "Name");
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
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var request = context.Requests.Single(r => r.RequestId == order.RequestId);
                EFOrdersRepository orderRepo = new EFOrdersRepository();
                if (request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = userInfo.Customer.CompanyName;
                
                if (orderRepo.AddToRequest(request, order))
                {
                    var myContext = new SMDHDataContext();
                    order = myContext.Orders.Single( o => o.OrderId == order.OrderId);
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
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            //var order = context.Orders.Find(id);
            var order = context.Orders.Single(o=>o.OrderId == 1);
            if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            ViewBag.Customer = userInfo.Customer.CompanyName;
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
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var request = context.Requests.Single(r => r.RequestId == order.RequestId);
                if (request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = userInfo.Customer.CompanyName;
                if (ModelState.IsValid)
                {
                    //context.Entry(order).State = EntityState.Modified;
                    //context.SaveChanges();
                    context.SubmitChanges();
                    var myContext = new SMDHDataContext();
                    order = myContext.Orders.Single(o => o.OrderId == order.OrderId);
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
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var order = context.Orders.Single(o=> o.OrderId == id);
                if (order.Request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = userInfo.Customer.CompanyName;
                EFOrdersRepository orderRepo = new EFOrdersRepository();

                if (orderRepo.CustomerCancel(order))
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


        //public ActionResult Browse()
        //{
        //    return View(context.Orders.ToList());
        //}

    }
}

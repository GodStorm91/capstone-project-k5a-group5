﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SMDH.Models;
using SMDH.Models.Statuses;

namespace SMDH.Areas.Hub.Controllers
{

    public partial class DashboardController : HubDefaultController
    {
        SMDHDataContext context = new SMDHDataContext();

        public virtual ActionResult Index()
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            ////var requests = context.Requests.Where(r => r.CustomerId == userInfo.CustomerId).ToList();
            //----------------------------------------
            List<Order> orders = context.Orders.Where(o => o.HubId== 1).ToList();

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
            
            //var numberOfRequestsList = new List<int>();
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).Count());
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.New
            //                                            || r.RequestStatus == (int)RequestStatus.Approved
            //                                            || r.RequestStatus == (int)RequestStatus.PlannedForCollecting).Count());
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());

            //ViewBag.NumberOfRequests = numberOfRequestsList;
            List<Order> listorders = context.Orders.Where(o => o.HubId == 1).ToList();
            var numberOfOrdersList = new List<int>
                {
                    listorders.Count(o => o.OrderStatus == (int) HubStatus.SendingToHub),
                    listorders.Count(o => o.OrderStatus == (int) HubStatus.InHub),
                    listorders.Count(o => o.OrderStatus == (int) HubStatus.Delivered),
                    listorders.Count(o => o.OrderStatus == (int) HubStatus.WaitingForReturn),
                    listorders.Count(o => o.OrderStatus == (int) HubStatus.Return)
                };

            ViewBag.NumberOfOrders = numberOfOrdersList;

            return View(orders);
        }

        public ActionResult ChangeStatus(List<int> selectedObjects)
        {
            if (selectedObjects != null)
            {
                IEnumerable<Order> listObject = context.Orders.Where(x => selectedObjects.Contains(x.OrderId));

                if (listObject.Any())
                {
                    if (listObject.Any(x => x.Status == OrderStatus.DeliveringToHub))
                    {
                        foreach (var item in listObject)
                        {
                            item.Status = OrderStatus.Delivering;
                        }

                        context.SubmitChanges();

                        return Redirect("/Hub/Orders?&status=deliveringToHub");
                    }
                    if (listObject.Any(x => x.Status == OrderStatus.WaitingForReturn))
                    {
                        foreach (var item in listObject)
                        {
                            item.Status = OrderStatus.Returned;
                        }

                        context.SubmitChanges();

                        return Redirect("/Hub/Orders?&status=waitingForReturn");
                    }
                }
            }

            return Redirect("/Hub/");
        }


        public ActionResult getalldatasendingToHub()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)HubStatus.SendingToHub && o.HubId == 1
                         select new
                         {
                            orderid = o.OrderId,
                            itemno = o.Items.Count,
                            amount = o.AmountToBeCollectedFromReceiver,
                            duedate = o.DueDate
                         }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { "<input type=\"checkbox\" class=\"checksth\" id=\"" + r.orderid.ToString() + "\" />", r.orderid.ToString(), r.itemno.ToString(), r.amount.ToString(), r.duedate.ToString(), "<a class=\"btn btn-mini btn-success myLink\" onclick='checkStatusinHub(" + r.orderid + ")'\">ChangeStatus</a>" });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldatainhub()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)HubStatus.InHub && o.HubId == 1
                          select new
                          {
                              orderid = o.OrderId,
                              itemno = o.Items.Count,
                              amount = o.AmountToBeCollectedFromReceiver,
                              duedate = o.DueDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { r.orderid.ToString(), r.itemno.ToString(), r.amount.ToString(), r.duedate.ToString() });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataDelivered()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)HubStatus.Delivered && o.HubId == 1
                          select new
                          {
                              orderid = o.OrderId,
                              itemno = o.Items.Count,
                              duedate = o.DueDate,
                              deliverydate = o.DeliveryDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { r.orderid.ToString(), r.itemno.ToString(), r.duedate.ToString(), r.deliverydate.ToString() });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataWaitingForReturn()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)HubStatus.WaitingForReturn && o.HubId == 1
                          select new
                          {
                              orderid = o.OrderId,
                              itemno = o.Items.Count,
                              duedate = o.DueDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { "<input type=\"checkbox\" class=\"checkwtr\" id=\"" + r.orderid.ToString() + "\" />", r.orderid.ToString(), r.itemno.ToString(), r.duedate.ToString(), "<a class=\"btn btn-mini btn-success myLink\" onclick='checkStatuswaiting(" + r.orderid + ")'\">ChangeStatus</a>" });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataReturn()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)HubStatus.Return && o.HubId == 1
                          select new
                          {
                              orderid = o.OrderId,
                              itemno = o.Items.Count,
                              collecteddate = o.CollectedDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { r.orderid.ToString(), r.itemno.ToString(), r.collecteddate.ToString()});
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult changestatustoInhub(int orderid)
        {
            try
            {
                var order = context.Orders.FirstOrDefault(o => o.OrderId == orderid);
                if (order == null)
                {
                    return Redirect("/Hubs/Dashboard");
                }
                order.OrderStatus = (int)HubStatus.InHub;
                context.SubmitChanges();
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
                
            }
            catch
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
                throw;
            }
        }

        public ActionResult changestatustoReturn(int orderid)
        {
            try
            {
                var order = context.Orders.FirstOrDefault(o => o.OrderId == orderid);
                if (order == null)
                {
                    return Redirect("/Hubs/Dashboard");
                }
                order.OrderStatus = (int)HubStatus.Return;
                context.SubmitChanges();
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
                throw;
            }
        }
    }
}
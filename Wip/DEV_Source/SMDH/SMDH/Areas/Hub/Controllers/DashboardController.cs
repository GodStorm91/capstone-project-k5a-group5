using System;
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
            int status = 0;

            try
            {
                if (!string.IsNullOrEmpty(Request["status"]))
                {
                    var statusStr = Request["status"];
                    switch (statusStr.ToLower())
                            {
                                case "deliveringtohub": status = (int)OrderStatus.DeliveringToHub;
                                    break;
                                case "delivering": status= (int)OrderStatus.Delivering;
                                    break;
                                case "delivered": status= (int)OrderStatus.Delivered;
                                    break;
                                case "waitingforreturn": status = (int)OrderStatus.WaitingForReturn;
                                    break;
                            }
                }
            }
            catch (Exception e)
            {
            }
            //----------------------------------------
            List<Order> orders = context.Orders.Where(o => o.OrderStatus == status && o.HubId== 1).ToList();

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
                    listorders.Count(o => o.OrderStatus == (int) OrderStatus.DeliveringToHub),
                    listorders.Count(o => o.OrderStatus == (int) OrderStatus.Delivering),
                    listorders.Count(o => o.OrderStatus == (int) OrderStatus.Delivered),
                    listorders.Count(o => o.OrderStatus == (int) OrderStatus.WaitingForReturn)
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


        public ActionResult getalldataDeliveringToHub()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)OrderStatus.DeliveringToHub && o.HubId == 1
                         select new
                         {
                            o.OrderId,
                            o.Items.Count,
                            o.Fee,
                            o.DeliveryDate
                         }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] {"<input type=\"checkbox\" />",r.OrderId.ToString(),r.Count.ToString(),r.Fee.ToString(),r.DeliveryDate.ToString(),"<a class=\"btn action view\" href=\"Orders/Details/@Model.ElementAt(@i).OrderId\"><img src=\"/img/icons/notepad.png\" alt=\"Detail\" title=\"View\" width=\"12px\"></a>"});
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataDelivering()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)OrderStatus.Delivering && o.HubId == 1
                          select new
                          {
                              o.OrderId,
                              o.Items.Count,
                              o.Fee,
                              o.DeliveryDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { "<input type=\"checkbox\" />", r.OrderId.ToString(), r.Count.ToString(), r.Fee.ToString(), r.DeliveryDate.ToString(), "<a class=\"btn action view\" href=\"Orders/Details/@Model.ElementAt(@i).OrderId\"><img src=\"/img/icons/notepad.png\" alt=\"Detail\" title=\"View\" width=\"12px\"></a>" });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataDelivered()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)OrderStatus.Delivered && o.HubId == 1
                          select new
                          {
                              o.OrderId,
                              o.Items.Count,
                              o.Fee,
                              o.DeliveryDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { "<input type=\"checkbox\" />", r.OrderId.ToString(), r.Count.ToString(), r.Fee.ToString(), r.DeliveryDate.ToString(), "<a class=\"btn action view\" href=\"Orders/Details/@Model.ElementAt(@i).OrderId\"><img src=\"/img/icons/notepad.png\" alt=\"Detail\" title=\"View\" width=\"12px\"></a>" });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }

        public ActionResult getalldataWaitingForReturn()
        {
            var orders = new List<Array>();
            var result = (from o in context.Orders
                          where o.OrderStatus == (int)OrderStatus.WaitingForReturn && o.HubId == 1
                          select new
                          {
                              o.OrderId,
                              o.Items.Count,
                              o.Fee,
                              o.DeliveryDate
                          }).Distinct().ToList();
            foreach (var r in result)
            {
                orders.Add(new String[] { "<input type=\"checkbox\" />", r.OrderId.ToString(), r.Count.ToString(), r.Fee.ToString(), r.DeliveryDate.ToString(), "<a class=\"btn action view\" href=\"Orders/Details/@Model.ElementAt(@i).OrderId\"><img src=\"/img/icons/notepad.png\" alt=\"Detail\" title=\"View\" width=\"12px\"></a>" });
            }

            return Json(new { sEcho = 10, iTotalRecords = result.Count, iTotalDisplayRecords = result.Count, aaData = orders }, JsonRequestBehavior.AllowGet);     
        }
    }
}

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
            List<Order> orders = context.Orders.Where(o=>o.HubId== 1 ).ToList();
            
            //var numberOfRequestsList = new List<int>();
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).Count());
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.New
            //                                            || r.RequestStatus == (int)RequestStatus.Approved
            //                                            || r.RequestStatus == (int)RequestStatus.PlannedForCollecting).Count());
            //numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());

            //ViewBag.NumberOfRequests = numberOfRequestsList;

            var numberOfOrdersList = new List<int>
                {
                    orders.Count(o => o.OrderStatus == (int) OrderStatus.DeliveringToHub),
                    orders.Count(o => o.OrderStatus == (int) OrderStatus.Delivering),
                    orders.Count(o => o.OrderStatus == (int) OrderStatus.Delivered),
                    orders.Count(o => o.OrderStatus == (int) OrderStatus.WaitingForReturn)
                };

            ViewBag.NumberOfOrders = numberOfOrdersList;

            return View();
        }
    }
}

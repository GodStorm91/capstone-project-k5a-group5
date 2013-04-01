using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Statuses;
using SMDH.Models;
using System.Web.Security;

namespace SMDH.Controllers
{
    public class NotificationsController : Controller
    {
        SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /Notifications/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CheckNotification()
        {
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var requests = context.Requests.Where(r => r.CustomerId == userInfo.CustomerId).ToList();
            var orders = context.Orders.Where(o => o.Request.CustomerId == userInfo.CustomerId).ToList();
            //var requests = context.Requests.Where(r => r.CustomerId == 1).ToList();
            //var orders = context.Orders.Where(o => o.Request.CustomerId == 1).ToList();

            var numberOfRequestsList = new List<int>();
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.New).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Pricing).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Canceled).Count());            

            var numberOfOrdersList = new List<int>();
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Draft).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Approved).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Rejected).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForCollecting).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Delivering).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ToBeReturned).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Returned).Count());
            
            return Json(new {requests= numberOfRequestsList, orders= numberOfOrdersList});

        }

    }
}

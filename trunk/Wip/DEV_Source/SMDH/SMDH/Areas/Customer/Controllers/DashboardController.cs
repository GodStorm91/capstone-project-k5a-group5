using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Concrete;
using SMDH.Models.Statuses;
using System.Web.Security;

namespace SMDH.Areas.Customer.Controllers
{
    public partial class DashboardController : CustomerDefaultController
    {
        SMDHDataContext context = new SMDHDataContext();

        public virtual ActionResult Index()
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

            ViewBag.NumberOfRequests = numberOfRequestsList;

            var numberOfOrdersList = new List<int>();
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Draft).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Approved).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ReturnedReducePrice || 
                o.OrderStatus == (int)OrderStatus.Expired).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForCollecting).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Delivering).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ToBeReturned).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Returned).Count());
            ViewBag.NumberOfOrders = numberOfOrdersList;

            return View();
        }
    }
}
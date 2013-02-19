using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Controllers
{
    public class DashboardController : StaffDefaultController
    {
        HDMSEntities context = new HDMSEntities();
        //
        // GET: /Dashboard/

        public ActionResult Index()
        {
            var numberOfRequestsList = new List<int>();
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.New).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.PlannedForCollecting).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Finished).Count());
            numberOfRequestsList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Canceled).Count());

            ViewBag.NumberOfRequests = numberOfRequestsList;

            var numberOfOrdersList = new List<int>();
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Draft).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.New).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Approved).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Rejected).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForCollecting).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Collected).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.ToBeReturned).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForDelivering).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Delivered).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Returned).Count());
            numberOfOrdersList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Canceled).Count());

            ViewBag.NumberOfOrders = numberOfOrdersList;

            return View();
        }

    }
}

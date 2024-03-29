﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Areas.Customer.Controllers
{

    public partial class DashboardController : CustomerDefaultController
    {
        HDMSEntities context = new HDMSEntities();

        public virtual ActionResult Index()
        {
            var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var requests = context.Requests.Where(r => r.CustomerId == userInfo.CustomerId).ToList();
            var orders = context.Orders.Where(o => o.Request.CustomerId == userInfo.CustomerId).ToList();

            var numberOfRequestsList = new List<int>();
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.New 
                                                        || r.RequestStatus == (int)RequestStatus.Approved
                                                        || r.RequestStatus == (int)RequestStatus.PlannedForCollecting).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());

            ViewBag.NumberOfRequests = numberOfRequestsList;

            var numberOfOrdersList = new List<int>();
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Draft).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Rejected).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.New
                                                    || o.OrderStatus == (int)OrderStatus.Approved
                                                    || o.OrderStatus == (int)OrderStatus.PlannedForCollecting).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Collected 
                                                    || o.OrderStatus == (int)OrderStatus.PlannedForDelivering).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ToBeReturned).Count());

            ViewBag.NumberOfOrders = numberOfOrdersList;

            return View();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Areas.Hub.Controllers
{
    public class OrdersController : Controller
    {
        private HDMSEntities context = new HDMSEntities();

        public ActionResult Index()
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

            var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            orders = context.Orders.Where(o => o.HubId == userInfo.HubId
                                            && statuses.Contains(o.OrderStatus)).ToList();
            

        }

    }
}

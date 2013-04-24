using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Statuses;
using SMDH.Models;
using System.Web.Security;
using System.Collections.Concurrent;
using System.Threading;
using System.Web.Script.Serialization;
using System.Text;

namespace SMDH.Controllers
{
    public class NotificationsController : Controller
    {
        private static BlockingCollection<string> _data = new BlockingCollection<string>();
        SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /Notifications/
        static NotificationsController()
        {
            _data.Add("started");
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CheckNotification()
        {
            var result = string.Empty;
            var sb = new StringBuilder();
            //if (_data.TryTake(out result, TimeSpan.FromMilliseconds(1000)))
            //{
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var requests = context.Requests.Where(r => r.CustomerId == userInfo.CustomerId).ToList();
            var orders = context.Orders.Where(o => o.CustomerId == userInfo.CustomerId).ToList();
            var numberOfRequestsList = new List<int>();
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.New).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Pricing).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Collected).Count());
            numberOfRequestsList.Add(requests.Where(r => r.RequestStatus == (int)RequestStatus.Canceled).Count());

            var numberOfOrdersList = new List<int>();
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Draft).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.RePricingApproveRequest).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ReturnedReducePrice ||
                o.OrderStatus == (int)OrderStatus.Expired).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForCollecting).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.Delivering).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ToBeReturned).Count());
            numberOfOrdersList.Add(orders.Where(o => o.OrderStatus == (int)OrderStatus.ConfirmReturned).Count());

            var configlist = new List<string>();
            //orders 
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableDraft"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableReturnedReducedPrice"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableRepricingApproveRequest"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["flag"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["immediately"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["interval"].ToString());

            //request
            configlist.Add(HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["flag"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["immediately"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["interval"].ToString());
            configlist.Add(HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["minPrice"].ToString());


            JavaScriptSerializer ser = new JavaScriptSerializer();
            var serializedObject = ser.Serialize(new { orders = numberOfOrdersList, requests = numberOfRequestsList, config = configlist });
            sb.AppendFormat("data: {0}\n\n", serializedObject);
            //}

            //var requests = context.Requests.Where(r => r.CustomerId == 1).ToList();
            //var orders = context.Orders.Where(o => o.Request.CustomerId == 1).ToList();

            return Content(sb.ToString(), "text/event-stream");


            //return Json(new { requests = numberOfRequestsList, orders = numberOfOrdersList });

        }

        public ActionResult CheckTiktakNotifications()
        {
            var sb = new StringBuilder();
            var resultList = new List<int>();
            resultList.Add(context.Orders.Where(o => (o.OrderStatus == (int)OrderStatus.CustomerExtend) || (o.OrderStatus == (int)OrderStatus.ReDeliverRequest) ||
                (o.OrderStatus == (int)OrderStatus.Returned)
                ).Count());
            resultList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.RePricing || r.RequestStatus == (int)RequestStatus.New).Count());
            resultList.Add(context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved).Count());
            resultList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Collected).Count());
            resultList.Add(context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.WaitingForReturn).Count());
            JavaScriptSerializer ser = new JavaScriptSerializer();
            var serializedObject = ser.Serialize(resultList);
            sb.AppendFormat("data: {0}\n\n", serializedObject);

            return Content(sb.ToString(), "text/event-stream");

        }



    }
}

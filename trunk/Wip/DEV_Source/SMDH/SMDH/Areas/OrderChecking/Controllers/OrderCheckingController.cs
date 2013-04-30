using SMDH.Models;
using SMDH.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace SMDH.Areas.OrderChecking.Controllers
{
    public class OrderCheckingController : Controller
    {
        //
        // GET: /Hub/OrderChecking/
        SMDHDataContext context = new SMDHDataContext();
        public ActionResult ViewInformationOrder(string id = "")
        {

            ViewBag.PhoneNumber = id;
            return View();
        }

        public ActionResult GetOrdersByPhone(string phoneNumber)
        {
            var orders = context.Orders.Where(o => o.ReceiverPhone == phoneNumber);
            List<OrderViewModel> result = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                result.Add(new OrderViewModel(order));
            }

            return Json(result);

        }

        public ActionResult ViewOrderDetails(string txtPasscode)
        {
            var order = context.Orders.Single(o => o.Passcode == txtPasscode);
            ViewBag.Customer = context.Customers.Single(c => c.CustomerId == order.CustomerId).DisplayName;
            ViewBag.Items = context.Items.Where(i => i.OrderId == order.OrderId).ToList();
            OrderViewModel orderView = new OrderViewModel(order);
            return View(orderView);
        }

    }
}

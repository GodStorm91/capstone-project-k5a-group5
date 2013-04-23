using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Areas.Customer.Controllers
{
    public class ConfigurationController : Controller
    {
        //
        // GET: /Customer/Configuration/

        public ActionResult Index()
        {
            //orders 
            ViewBag.allowDraft = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableDraft"];
            ViewBag.enableReturnedReducedPrice = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableReturnedReducedPrice"];
            ViewBag.enableRepricingApproveRequest = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableRepricingApproveRequest"];
            ViewBag.orderFlag = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["flag"];
            ViewBag.orderImmediately = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["immediately"];
            ViewBag.orderInterval = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["interval"];

            //request
            ViewBag.requestFlag = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["flag"];
            ViewBag.requestImmediately = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["immediately"];
            ViewBag.requestInterval = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["interval"];
            ViewBag.minPrice = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["minPrice"];

            return View();
        }

        public ActionResult ConfirmSave(bool allowDraft = false, bool allowReturnedReducedPrice =false,
            bool allowRepricingApproveRequest = false, bool isOrderImmediately = false, int isOrderAfterMinutes = 0,
            bool autoApproveRequest = false, int maxRequestPrice = 0, int isRequestAfterMinutes = 0, bool isRequestImmediately = false)
        {
            try
            {
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableDraft"] = allowDraft;
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableReturnedReducedPrice"] = allowReturnedReducedPrice;
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableRepricingApproveRequest"] = allowRepricingApproveRequest;
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["flag"] = allowDraft || allowRepricingApproveRequest || allowReturnedReducedPrice;
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["immediately"] = isOrderImmediately;
                HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["interval"] = isOrderImmediately ? -1 : isOrderAfterMinutes;

                HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["flag"] = autoApproveRequest;
                HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["immediately"] = isRequestImmediately;
                HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["interval"] = isRequestAfterMinutes;
                HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["minPrice"] = maxRequestPrice;

                //return Json(new { data = true });
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
                throw;
            }      
        }
        
    }
}

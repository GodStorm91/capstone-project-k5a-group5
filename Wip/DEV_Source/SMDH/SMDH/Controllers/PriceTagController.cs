using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Utilities;

namespace SMDH.Controllers
{
    [Authorize]
    public class PriceTagController : Controller
    {
        private SMDHDataContext context = new SMDHDataContext();

        public ActionResult Index()
        {
            var priceTags = context.PriceTags.Where(pt => pt.PriceTagId != null);
            return View(priceTags);
        }

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult ConfirmCreate(PriceTag pt)
        {
            try
            {                
                context.PriceTags.InsertOnSubmit(pt);
                context.SubmitChanges();               

                return RedirectToAction("Index", "PriceTag");
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        public ActionResult GetPriceByPriceTagId(int id)
        {
            var priceTag = context.PriceTags.Single(pc => pc.PriceTagId == id);
            return Json(new { price = priceTag.Price });
        }

    }
}

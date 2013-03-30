using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Concrete;
using SMDH.Models.Statuses;
using SMDH.Models.ViewModels;

namespace SMDH.Controllers
{
    public class PriceCategoriesController : Controller
    {
        //
        // GET: /PriceCategories/
        private SMDHDataContext context = new SMDHDataContext();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetPriceCategoriesFromOrder(int orderId)
        {
            var priceCategories = context.PriceCategories.Where(pc => pc.OrderId == orderId);
            List<PriceCategoryViewModel> result = new List<PriceCategoryViewModel>();
            for (int i = 0; i < priceCategories.Count(); i++)
            {
                result.Add(new PriceCategoryViewModel(priceCategories.ElementAt(i)));
            }
            return Json(new { data = result });
            
        }

        public ActionResult Create()
        {
            //return view here
            return View();
        }

        public ActionResult ConfirmCreate(PriceCategory pc)
        {
            try
            {
                pc.EditDate = DateTime.Now;
                //pc.Staff Staff Id goes here
                context.PriceCategories.InsertOnSubmit(pc);                
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                var pc = context.PriceCategories.Where(p => p.PriceCategoryId == id);
                return View(pc);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public ActionResult ConfirmEdit(PriceCategory pc)
        {
            try
            {
                var myPC = context.PriceCategories.Where(p => p.PriceCategoryId == pc.PriceCategoryId);
                //code update goes here
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}

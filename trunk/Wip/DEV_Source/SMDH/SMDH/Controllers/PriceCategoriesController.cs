using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            foreach (var pc in priceCategories)
            {
                result.Add(new PriceCategoryViewModel(pc));
            }
            return Json(new { data = result });
            
        }

        public ActionResult Create()
        {
            //return view here
            
            return View();
        }

        public ActionResult AddPriceCategory(int orderId)
        {
            PriceCategory pc = new PriceCategory();
            pc.OrderId = orderId;
            var order = context.Orders.Single(o => o.OrderId == orderId);
            ViewBag.Order = order;
            ViewBag.PriceTags = new SelectList(context.PriceTags.ToArray(), "PriceTagId", "PriceTagContent");
            return View(pc);

        }

        public ActionResult ConfirmCreate(PriceCategory pc)
        {
            try
            {
                pc.EditDate = DateTime.Now;
                //pc.Staff Staff Id goes here
                var userInfo = context.UserInfos.Single(r => r.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                pc.UserId = userInfo.UserId;
                var priceTagInfo = context.PriceTags.Single(pt => pt.PriceTagId == pc.PriceTagId);
                pc.PriceContent = priceTagInfo.PriceTagContent;
                pc.Price = priceTagInfo.Price;
                context.PriceCategories.InsertOnSubmit(pc);                
                context.SubmitChanges();
                var order = context.Orders.Single(o => o.OrderId == pc.OrderId);

                return RedirectToAction("ApproveOrders", "Requests", new { id = order.Request.RequestId });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }


        public ActionResult ConfirmCreateAjax(int priceTagId, int orderId)
        {
            try
            {
                var pc = new PriceCategory();
                pc.OrderId = orderId;
                pc.PriceTagId = priceTagId;

                var priceTagInfo = context.PriceTags.Single(pt => pt.PriceTagId == pc.PriceTagId);
                pc.PriceContent = priceTagInfo.PriceTagContent;
                pc.Price = priceTagInfo.Price;
                pc.EditDate = DateTime.Now;
                //pc.Staff Staff Id goes here
                var userInfo = context.UserInfos.Single(r => r.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                pc.UserId = userInfo.UserId;
                context.PriceCategories.InsertOnSubmit(pc);
                context.SubmitChanges();

                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });                
            }
        }

        public ActionResult Edit(int id)
        {
            try
            {
                var pc = context.PriceCategories.Single(p => p.PriceCategoryId == id);
                ViewBag.PriceTags = new SelectList(context.PriceTags.ToArray(), "PriceTagId", "PriceTagContent");
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
                using (var myContext = new SMDHDataContext())
                {
                    var myPc = myContext.PriceCategories.Single(p => p.PriceCategoryId == pc.PriceCategoryId);
                    myPc.EditDate = DateTime.Now;
                    var priceTagInfo = context.PriceTags.Single(pt => pt.PriceTagId == pc.PriceTagId);
                    myPc.Price = priceTagInfo.Price;                    
                    myPc.PriceContent = priceTagInfo.PriceTagContent;
                    //pc.Staff Staff Id goes here
                    var userInfo = context.UserInfos.Single(r => r.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                    myPc.UserId = userInfo.UserId;
                    myContext.SubmitChanges();
                    var order = myContext.Orders.Single(o => o.OrderId == pc.OrderId);                    
                    return RedirectToAction("ApproveOrders","Requests",new {id = order.Request.RequestId});
                }
                
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public ActionResult GetPriceCategoriesFromOrderId(int id)
        {
            try
            {
                var pcs = context.PriceCategories.Where(pc => pc.OrderId == id);
                List<PriceCategoryViewModel> result = new List<PriceCategoryViewModel>();
                foreach (var pc in pcs)
                {
                    result.Add(new PriceCategoryViewModel(pc));
                }

                return Json( result );

            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}

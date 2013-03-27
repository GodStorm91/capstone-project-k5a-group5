using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SMDH.Models;
using SMDH.Models.Statuses;
using SMDH.Models.ViewModels;
using SMDH.Models.Concrete;

namespace SMDH.Areas.Customer.Controllers
{
    public class ItemsController : CustomerDefaultController
    {
        private SMDHDataContext context = new SMDHDataContext();

        //
        // GET: /Items/

        //public ViewResult Index()
        //{
        //    var items = context.Items.Include(i => i.Order);
        //    return View(items.ToList());
        //}

        //
        // GET: /Items/Details/5

        //public ViewResult Details(int id)
        //{
        //    Item item = context.Items.Find(id);
        //    return View(item);
        //}

        //
        // POST: /Items/Create

        [HttpPost]
        public ActionResult Create(int orderId)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var order = context.Orders.Single(o=> o.OrderId == orderId);
            //if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            //ViewBag.Customer = userInfo.Customer.CompanyName;
            ViewBag.Customer = "Test ";
            ViewBag.OrderId = orderId;
            return View();
        }

        //
        // POST: /Items/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(Item item)
        {
            try
            {
                //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var order = context.Orders.Single(i => i.OrderId == item.OrderId);
                //if (order.Request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                EFProductsRepository productRepo = new EFProductsRepository();

                //Create new product to save this 
                Product pro = new Product();
                pro.Name = item.Name;
                pro.ProductPrice = item.Price / item.Quantity;
                pro.CustomerId = 1;
                productRepo.Create(pro);
                item.ProductId = pro.ProductId;
                //ViewBag.Customer = userInfo.Customer.CompanyName;
                ViewBag.Customer = "Test comp";
                
                if (ModelState.IsValid)
                {
                    context.Items.InsertOnSubmit(item);
                    context.SubmitChanges();
                    var myContext = new SMDHDataContext();
                    item = myContext.Items.Single(i => i.ItemId == item.ItemId);
                    var itemDetails = new ItemViewModel
                    {
                        ItemId = item.ItemId,
                        OrderId = item.OrderId,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Size = item.Size,
                        Weight = item.Weight,
                        IsFragile = item.IsFragile,
                        HasHighValue = item.HasHighValue,
                        Note = item.Note
                    };
                    return Json(new { success = true, item = itemDetails });
                }

                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        //
        // GET: /Items/Edit/5

        public ActionResult Edit(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var item = context.Items.Single(i => i.ItemId == id);
            //if (item.Order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            ViewBag.Customer = "Test";//userInfo.Customer.CompanyName;
            return View(item);
        }

        //
        // POST: /Items/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(Item item)
        {
            try
            {
                //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var order = context.Orders.Single(o=> o.OrderId == item.OrderId);
                //if (order.Request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = "Test";//userInfo.Customer.CompanyName;
                if (ModelState.IsValid)
                {
                    //context.Entry(item).State = EntityState.Modified;
                    context.SubmitChanges();
                    var myContext = new SMDHDataContext();
                    item = myContext.Items.Single(i=> i.ItemId == item.ItemId);
                    var itemDetails = new ItemViewModel
                    {
                        ItemId = item.ItemId,
                        OrderId = item.OrderId,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Size = item.Size,
                        Weight = item.Weight,
                        IsFragile = item.IsFragile,
                        HasHighValue = item.HasHighValue,
                        Note = item.Note
                    };
                    return Json(new { success = true, item = itemDetails });
                }

                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        //
        // GET: /Items/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    Item item = context.Items.Find(id);
        //    return View(item);
        //}

        //
        // POST: /Items/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{            
        //    Item item = context.Items.Find(id);
        //    context.Items.Remove(item);
        //    context.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            context.Dispose();
            base.Dispose(disposing);
        }

        //[HttpPost]
        //public ActionResult Cancel(int itemId)
        //{
        //    try
        //    {
        //        var item = context.Items.Find(itemId);
        //        if (item.Status == ItemStatus.New || item.Status == ItemStatus.Verified)
        //        {
        //            item.Status = ItemStatus.Canceled;
        //            context.SaveChanges();
        //        }
        //        return Json(new { success = true });
        //    }
        //    catch (Exception)
        //    {
        //        return Json(new { success = false });
        //    }
        //}

        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var item = context.Items.Single( i=> i.ItemId == id);
                //if (item.Order.Request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = "Test";//userInfo.Customer.CompanyName;

                context.Items.DeleteOnSubmit(item);
                context.SubmitChanges();
                return Json(new { success = true });              
                
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}
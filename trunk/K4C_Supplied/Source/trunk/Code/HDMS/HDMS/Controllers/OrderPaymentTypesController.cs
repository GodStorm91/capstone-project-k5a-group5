using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Controllers
{   
    public class OrderPaymentTypesController : Controller
    {
        private HDMSEntities db = new HDMSEntities();

        //
        // GET: /OrderPaymentTypes/

        public ViewResult Index()
        {
            //return View(db.OrderPaymentTypes.ToList());
            var result = db.OrderPaymentTypes.Where(o => o.IsActive);
            return View(result);
        }

        //
        // GET: /OrderPaymentTypes/Details/5

        //public ViewResult Details(int id)
        //{
        //    OrderPaymentType orderpaymenttype = db.OrderPaymentTypes.Find(id);
        //    return View(orderpaymenttype);
        //}

        //
        // POST: /OrderPaymentTypes/Create

        [HttpPost]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /OrderPaymentTypes/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(OrderPaymentType orderpaymenttype)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    orderpaymenttype.IsActive = true;
                    db.OrderPaymentTypes.Add(orderpaymenttype);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                
            }

            return RedirectToAction("Index");
        }
        
        //
        // POST: /OrderPaymentTypes/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            OrderPaymentType orderpaymenttype = db.OrderPaymentTypes.Find(id);
            return View(orderpaymenttype);
        }

        //
        // POST: /OrderPaymentTypes/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(OrderPaymentType orderpaymenttype)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(orderpaymenttype).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                
            }
            return RedirectToAction("Index");
        }

        //
        // GET: /OrderPaymentTypes/Delete/5
 
        //public ActionResult Delete(int id)
        //{
        //    OrderPaymentType orderpaymenttype = db.OrderPaymentTypes.Find(id);
        //    return View(orderpaymenttype);
        //}

        //
        // POST: /OrderPaymentTypes/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    OrderPaymentType orderpaymenttype = db.OrderPaymentTypes.Find(id);
        //    //db.OrderPaymentTypes.Remove(orderpaymenttype);
        //    orderpaymenttype.IsActive = false;
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        //
        // POST: /Contact/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{
        //    OrderPaymentType orderPaymentType = db.OrderPaymentTypes.Find(id);
        //    orderPaymentType.IsActive = !orderPaymentType.IsActive;
        //    db.SaveChanges();
        //    return Json(new { isActive = orderPaymentType.IsActive });
        //}

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var orderpaymenttype = db.OrderPaymentTypes.Find(id);
                orderpaymenttype.IsActive = false;
                db.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}
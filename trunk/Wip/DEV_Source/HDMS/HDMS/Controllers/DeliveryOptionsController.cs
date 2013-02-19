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
    public class DeliveryOptionsController : StaffDefaultController
    {
        private HDMSEntities db = new HDMSEntities();

        //
        // GET: /DeliveryOptions/

        public ViewResult Index()
        {
            //return View(db.DeliveryOptions.ToList());
            var result = db.DeliveryOptions.Where(d => d.IsActive);
            return View(result);
        }

        //
        // GET: /DeliveryOptions/Details/5

        //public ViewResult Details(int id)
        //{
        //    DeliveryOption deliveryoption = db.DeliveryOptions.Find(id);
        //    return View(deliveryoption);
        //}

        //
        // POST: /DeliveryOptions/Create

        [HttpPost]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /DeliveryOptions/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(DeliveryOption deliveryoption)
        {
            if (ModelState.IsValid)
            {
                deliveryoption.IsActive = true;
                db.DeliveryOptions.Add(deliveryoption);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View("Create", deliveryoption);
        }
        
        //
        // POST: /DeliveryOptions/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            DeliveryOption deliveryoption = db.DeliveryOptions.Find(id);
            return View(deliveryoption);
        }

        //
        // POST: /DeliveryOptions/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(DeliveryOption deliveryoption)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deliveryoption).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View("Edit", deliveryoption);
        }

        //
        // GET: /DeliveryOptions/Delete/5
 
        //public ActionResult Delete(int id)
        //{
        //    DeliveryOption deliveryoption = db.DeliveryOptions.Find(id);
        //    return View(deliveryoption);
        //}

        //
        // POST: /DeliveryOptions/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    DeliveryOption deliveryoption = db.DeliveryOptions.Find(id);
        //    //db.DeliveryOptions.Remove(deliveryoption);
        //    deliveryoption.IsActive = false;
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        //
        // POST: /CityProvince/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{
        //    DeliveryOption deliveryoption = db.DeliveryOptions.Find(id);
        //    deliveryoption.IsActive = !deliveryoption.IsActive;
        //    db.SaveChanges();
        //    return Json(new { isActive = deliveryoption.IsActive });
        //}

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var deliveryoption = db.DeliveryOptions.Find(id);
                deliveryoption.IsActive = false;
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
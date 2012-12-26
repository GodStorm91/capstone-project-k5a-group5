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
    public class CityProvinceController : StaffDefaultController
    {
        private HDMSEntities db = new HDMSEntities();

        //
        // GET: /CityProvince/

        public ViewResult Index()
        {
            var result = db.CityProvinces.Where(c => c.IsActive);
            return View(result);
        }

        //
        // GET: /CityProvince/Details/5

        public ViewResult Details(int id)
        {
            CityProvince cityprovince = db.CityProvinces.Find(id);
            return View(cityprovince);
        }

        //
        // POST: /CityProvince/Create

        [HttpPost]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /CityProvince/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(CityProvince cityprovince)
        {
            if (ModelState.IsValid)
            {
                cityprovince.IsActive = true;
                if (cityprovince.DisplayOrder <= 0) cityprovince.DisplayOrder = 1;
                if (cityprovince.DisplayOrder > db.CityProvinces.Count()) cityprovince.DisplayOrder = db.CityProvinces.Count();
                db.CityProvinces.Add(cityprovince);
                db.SaveChanges();
                if (cityprovince.DisplayOrder != null) DisplayOrder(cityprovince.DisplayOrder, cityprovince.CityProvinceId);
                return RedirectToAction("Index");  
            }

            return View("Create",cityprovince);
        }
        
        //
        // POST: /CityProvince/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            CityProvince cityprovince = db.CityProvinces.Find(id);
            return View(cityprovince);
        }

        //
        // POST: /CityProvince/ConfirmEdit/5

        [HttpPost]
        public ActionResult ConfirmEdit(CityProvince cityprovince)
        {
            if (ModelState.IsValid)
            {
                if (cityprovince.DisplayOrder <= 0) cityprovince.DisplayOrder = 1;
                if (cityprovince.DisplayOrder > db.CityProvinces.Count()) cityprovince.DisplayOrder = db.CityProvinces.Count();
                db.Entry(cityprovince).State = EntityState.Modified;
                db.SaveChanges();
                if (cityprovince.DisplayOrder != null) DisplayOrder(cityprovince.DisplayOrder, cityprovince.CityProvinceId);
                return RedirectToAction("Index");
            }
            return View("Edit", cityprovince);
        }

        //
        // GET: /CityProvince/Delete/5
 
        //public ActionResult Delete(int id)
        //{
        //    CityProvince cityprovince = db.CityProvinces.Find(id);
        //    return View(cityprovince);
        //}

        //
        // POST: /CityProvince/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{            
        //    CityProvince cityprovince = db.CityProvinces.Find(id);
        //    //db.CityProvinces.Remove(cityprovince);
        //    cityprovince.IsActive = false;
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
        //    CityProvince cityprovince = db.CityProvinces.Find(id);
        //    cityprovince.IsActive = !cityprovince.IsActive;
        //    db.SaveChanges();
        //    return Json(new{isActive = cityprovince.IsActive});
        //}

        public void DisplayOrder(int? displayOrder, int cityId)
        {
            if (displayOrder > 0)
            {
                var cities = db.CityProvinces;
                foreach (var eachcity in cities)
                {
                    if (eachcity.DisplayOrder >= displayOrder)
                    {
                        if (eachcity.CityProvinceId != cityId)
                        {
                            eachcity.DisplayOrder = eachcity.DisplayOrder + 1;
                            db.Entry(eachcity).State = EntityState.Modified;
                        }

                    }
                }
                db.SaveChanges();
            }
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var cityprovince = db.CityProvinces.Find(id);
                cityprovince.IsActive = false;
                foreach (var district in cityprovince.Districts)
                {
                    district.IsActive = false;
                    foreach (var ward in district.Wards)
                    {
                        ward.IsActive = false;
                    }
                }
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
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
    public class WardController : Controller
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /Wards/
        [Authorize(Roles = "Office Staff")]
        public ViewResult Index()
        {
            var wards = context.Wards.Where(w => w.IsActive).OrderBy(w => w.District.DisplayOrder).ThenBy(w => w.DisplayOrder);
            return View(wards);
        }

        //
        // GET: /Wards/Details/5

        //public ViewResult Details(int id)
        //{
        //    Ward ward = context.Wards.Find(id);
        //    return View(ward);
        //}

        //
        // POST: /Wards/Create
        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult Create()
        {
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(),"CityProvinceId","Name");
            return View();
        } 

        //
        // POST: /Wards/ConfirmCreate
        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult ConfirmCreate(Ward ward)
        {                  
            if (ModelState.IsValid)
            {
                ward.IsActive = true;
                if (ward.DisplayOrder <= 0) ward.DisplayOrder = 1;
                if (ward.DisplayOrder > context.Wards.Count()) ward.DisplayOrder = context.Wards.Count();
                context.Wards.Add(ward);
                context.SaveChanges();
                if (ward.DisplayOrder != null) DisplayOrder(ward.DisplayOrder, ward.WardId);
                return RedirectToAction("Index");  
            }

            return RedirectToAction("Index");
        }
        
        //
        // POST: /Wards/Edit/5
        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult Edit(int id)
        {
            Ward ward = context.Wards.Single(x => x.WardId == id);
            ViewBag.PossibleDistricts = new SelectList(ward.District.CityProvince.Districts.Where(d => d.IsActive).ToArray(), "DistrictId", "Name", ward.DistrictId);
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            return View(ward);
        }

        //
        // POST: /Wards/ConfirmEdit/5
        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult ConfirmEdit(Ward ward)
        {
            if (ModelState.IsValid)
            {
                if (ward.DisplayOrder <= 0) ward.DisplayOrder = 1;
                if (ward.DisplayOrder > context.Wards.Count()) ward.DisplayOrder = context.Wards.Count();
                context.Entry(ward).State = EntityState.Modified;
                context.SaveChanges();
                if (ward.DisplayOrder != null) DisplayOrder(ward.DisplayOrder, ward.WardId);
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        //
        // GET: /Wards/Delete/5
 
        //public ActionResult Delete(int id)
        //{
        //    Ward ward = context.Wards.Single(x => x.WardId == id);
        //    return View(ward);
        //}

        //
        // POST: /Wards/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Ward ward = context.Wards.Single(x => x.WardId == id);
        //   // context.Wards.Remove(ward);
        //    ward.IsActive = false;
        //    context.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //
        // POST: /Ward/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{
        //    Ward ward = context.Wards.Find(id);
        //    ward.IsActive = !ward.IsActive;
        //    context.SaveChanges();
        //    return Json(new { isActive = ward.IsActive });
        //}

        //
        // POST: /Ward/GetWardsOfDistrict/5

        [Authorize]
        public ActionResult GetWardsOfDistrict(int id)
        {
            var wardList = from w in context.Wards
                           where w.DistrictId == id
                                && w.IsActive
                           orderby w.DisplayOrder
                           select new { w.WardId, w.Name };
            return Json(wardList, JsonRequestBehavior.AllowGet);
        }

        public void DisplayOrder(int? displayOrder, int wardId)
        {
            if(displayOrder>0)
            {
                var wards = context.Wards;
                foreach (var eachward in wards)
                {
                    if (eachward.DisplayOrder >= displayOrder)
                    {
                        if (eachward.WardId != wardId)
                        {
                            eachward.DisplayOrder = eachward.DisplayOrder + 1;
                            context.Entry(eachward).State = EntityState.Modified;
                        }

                    }
                }
                context.SaveChanges();
            }      
        }
        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var ward = context.Wards.Find(id);
                ward.IsActive = false;
                context.SaveChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}
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
    public class DistrictController : Controller
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /Districts/
        [Authorize(Roles = "Office Staff")]
        public ViewResult Index()
        {
            ViewBag.PossibleCityProvinces = context.CityProvinces.Where(cp => cp.IsActive);

            var result = context.Districts.Where(d => d.IsActive).OrderBy(d => d.DisplayOrder).ToList();
            return View(result);
        }

        //
        // GET: /Districts/Details/5

        //public ViewResult Details(int id)
        //{
        //    District district = context.Districts.Single(x => x.DistrictId == id);
        //    return View(district);
        //}

        //
        // POST: /Districts/Create

        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult Create()
        {
            ViewBag.PossibleCityProvinces = context.CityProvinces.Where(cp => cp.IsActive);
            return View();
        }

        //
        // POST: /Districts/Create

        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult ConfirmCreate(District district)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    district.IsActive = true;
                    if (district.DisplayOrder <= 0) district.DisplayOrder = 1;
                    if (district.DisplayOrder > context.Districts.Count()) district.DisplayOrder = context.Districts.Count();
                    context.Districts.Add(district);
                    context.SaveChanges();
                    if (district.DisplayOrder != null) DisplayOrder(district.DisplayOrder, district.DistrictId);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                
            }

            return RedirectToAction("Index");
        }

        //
        // POST: /Districts/Edit/5

        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult Edit(int id)
        {
            District district = context.Districts.Single(x => x.DistrictId == id);
            ViewBag.PossibleCityProvinces = context.CityProvinces.Where(cp => cp.IsActive);
            return View(district);
        }

        //
        // POST: /Districts/Edit/5

        [Authorize(Roles = "Office Staff")]
        [HttpPost]
        public ActionResult ConfirmEdit(District district)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (district.DisplayOrder <= 0) district.DisplayOrder = 1;
                    if (district.DisplayOrder > context.Districts.Count()) district.DisplayOrder = context.Districts.Count();
                    context.Entry(district).State = EntityState.Modified;
                    context.SaveChanges();
                    if (district.DisplayOrder != null) DisplayOrder(district.DisplayOrder, district.DistrictId);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                
            }
            return RedirectToAction("Index");
        }

        //
        // GET: /Districts/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    District district = context.Districts.Single(x => x.DistrictId == id);
        //    return View(district);
        //}

        //
        // POST: /Districts/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    District district = context.Districts.Single(x => x.DistrictId == id);
        //    //context.Districts.Remove(district);
        //    district.IsActive = false;

        //    context.SaveChanges();
        //    return RedirectToAction("Index");


        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //
        // POST: /District/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{
        //    District district = context.Districts.Find(id);

        //    district.IsActive = !district.IsActive;


        //    context.SaveChanges();
        //    return RedirectToAction("Index");

        //}

        [Authorize]
        public ActionResult GetDistrictsOfCityProvince(int id)
        {
            var districtList = from d in context.Districts
                               where d.CityProvinceId == id
                                    && d.IsActive
                               orderby d.DisplayOrder
                               select new { d.DistrictId, d.Name };
            return Json(districtList, JsonRequestBehavior.AllowGet);
        }

        public void DisplayOrder(int? displayOrder, int districtId)
        {
            if (displayOrder > 0)
            {
                var districts = context.Districts;
                foreach (var eachdis in districts)
                {
                    if (eachdis.DisplayOrder >= displayOrder)
                    {
                        if (eachdis.DistrictId != districtId)
                        {
                            eachdis.DisplayOrder = eachdis.DisplayOrder + 1;
                            context.Entry(eachdis).State = EntityState.Modified;
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
                int temp = id;
                var district = context.Districts.Find(id);
                district.IsActive = false;
                foreach (var ward in district.Wards)
                {
                    ward.IsActive = false;
                }

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
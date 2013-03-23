using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Concrete;
using SMDH.Models.Abstract;
using SMDH.Models;

namespace SMDH.Controllers
{
    [Authorize]
    public class CityProvinceController : Controller
    {
        private ICityProvinceRepository _repository;

        public CityProvinceController(ICityProvinceRepository repository)
        {
            _repository = repository;
        }
        //
        // GET: /CityProvince/

        public ActionResult Index()
        {
            var result = _repository.GetAllCityProvinces();
            return View(result);
        }

        public ViewResult Details(int id)
        {
            CityProvince cityprovince = _repository.Find(id);
            return View(cityprovince);
        }

        
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ConfirmCreate(CityProvince cityprovince)
        {
            if (ModelState.IsValid)
            {
                cityprovince.IsActive = true;
                _repository.Add(cityprovince);
                if (cityprovince.DisplayOrder != null) _repository.DisplayOrder(cityprovince.DisplayOrder, cityprovince.CityProvinceId);
                return RedirectToAction("Index");
            }

            return View("Create", cityprovince);
        }

        [HttpPost]
        public ActionResult Edit(int id)
        {
            CityProvince cityprovince = _repository.Find(id);
            return View(cityprovince);
        }

        [HttpPost]
        public ActionResult ConfirmEdit(CityProvince cityprovince)
        {
            if (ModelState.IsValid)
            {
                if (cityprovince.DisplayOrder <= 0) cityprovince.DisplayOrder = 1;
                _repository.Save(cityprovince);                
                if (cityprovince.DisplayOrder != null) _repository.DisplayOrder(cityprovince.DisplayOrder, cityprovince.CityProvinceId);
                return RedirectToAction("Index");
            }
            return View("Edit", cityprovince);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                _repository.Remove(id);

                return Json(new { success = true });

            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        public int GetMaximumRequestsOfCity(int id)
        {
            try
            {
                return _repository.GetMaximumRequestsOfCity(id);

            }
            catch (Exception)
            {

                return -1;
            }
        }


    }
}

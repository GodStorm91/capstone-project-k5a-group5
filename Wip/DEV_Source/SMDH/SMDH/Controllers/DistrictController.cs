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
    public class DistrictController : Controller
    {
        private SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /District/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetDistrictsOfCityProvince(int id)
        {
            var districtList = from d in context.Districts
                               where d.CityProvinceId == id
                                    && d.IsActive
                               orderby d.DisplayOrder
                               select new { d.DistrictId, d.Name };
            return Json(districtList, JsonRequestBehavior.AllowGet);
        }
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Controllers
{
    public class PieReportController : Controller
    {
        private HDMSEntities db = new HDMSEntities();
        //
        // GET: /PieReport/

        public ActionResult Index()
        {
            ViewBag.Cities = new SelectList(db.CityProvinces.ToArray(), "CityProvinceId", "Name");
            return View();
        }

        //
        // POST: /PieReport/DistrictPie

        [HttpPost]
        public ActionResult DistrictPie(int cityProvince)
        {
            //var ordersInCity = db.Orders.Where(o => o.District.CityProvinceId == 1);
            int id = 0;
            string name = "null city";

            if(cityProvince != 0)
            {
                id = cityProvince;
                name = db.CityProvinces.Single(n => n.CityProvinceId == id).Name;
            }

            PieReport allData = new PieReport();

            if(id > 0)
            {
                var districts = db.Districts;
                string countResult = "";
                string districtsName = "";
                foreach (var district in districts)
                {
                    if (district.CityProvinceId == id)
                    {
                        if (district.Orders.Count() > 0)
                        {
                            districtsName = (districtsName + "\"" + district.Name + "\"" + ",");
                            countResult = (countResult + district.Orders.Count() + ",");
                        }
                    }


                }
                if (districtsName.Length > 0)
                {
                    districtsName = "[" + districtsName.Substring(0, districtsName.Length - 1) + "]";
                    countResult = "[" + countResult.Substring(0, countResult.Length - 1) + "]";
                }
                allData.Labels = districtsName;
                allData.Numbers = countResult;
            }
            else
            {
                allData.Labels = "[]";
                allData.Numbers = "[]";
            }

            allData.Cityname = name;

            

            

            return View(allData);
        }

    }
}

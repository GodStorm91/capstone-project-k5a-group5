﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Concrete;
using SMDH.Models.Abstract;
using SMDH.Models;
using SMDH.Models.ViewModels;


namespace SMDH.Controllers
{
    public class WardController : Controller
    {
        private SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /Ward/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetWardsOfDistrict(int id)
        {
            var wardList = from w in context.Wards
                           where w.DistrictId == id
                                && w.IsActive
                           orderby w.DisplayOrder
                           select new { w.WardId, w.Name };
            return Json(wardList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetWardsFromDistrictIdAndChars(int id, string str)
        {
            var wardList = context.Wards.Where(w => w.DistrictId == id && w.Name.Contains(str));
            List<WardViewModel> wardViewList = new List<WardViewModel>();
            foreach (var ward in wardList)
            {
                wardViewList.Add(new WardViewModel(ward));
            }
            //var wardList = from w in context.Wards
            //               where w.DistrictId == id && w.Name.Contains(str)
            //               select new { w.WardId, w.Name };
            return Json(new { wardList = wardViewList }, JsonRequestBehavior.AllowGet);
        }

    }
}

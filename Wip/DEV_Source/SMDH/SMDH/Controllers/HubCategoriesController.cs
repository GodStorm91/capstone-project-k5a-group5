using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Concrete;
using SMDH.Models.Abstract;

namespace SMDH.Controllers
{
    public class HubCategoriesController : Controller
    {
        private SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /HubCategories/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetHubsByHubCategory(int id)
        {
            var hubList = from d in context.Hubs
                               where d.HubCategoryId == id
                                    && d.IsActive                               
                               select new { d.HubId, d.Name };
            return Json(hubList, JsonRequestBehavior.AllowGet);
        }

    }
}

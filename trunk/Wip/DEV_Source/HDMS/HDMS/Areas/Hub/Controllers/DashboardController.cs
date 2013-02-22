using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HDMS.Areas.Hub.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /Hub/Dashboard/

        public ActionResult Index()
        {
            return View();
        }

    }
}

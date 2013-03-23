using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Concrete;
using SMDH.Models;

namespace SMDH.Controllers
{
    [Authorize(Roles="admin")]
    public class DashboardController : Controller
    {   
        //
        // GET: /Dashboard/
        public ActionResult Index()
        {
             int  numberOfNewRequests;
             return View();
        }

    }
}

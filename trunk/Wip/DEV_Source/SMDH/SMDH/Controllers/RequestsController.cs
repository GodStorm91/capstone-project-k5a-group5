using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Controllers
{
    public class RequestsController : Controller
    {
        //
        // GET: /Requests/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Requests/Details/5
        public ViewResult Details(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create()
        {
            return View();
        }

    }
}

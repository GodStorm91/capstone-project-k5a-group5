﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Areas.Customer.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Customer/Home/

        public ActionResult Index()
        {
            return Redirect("/Dashboard");
        }

    }
}

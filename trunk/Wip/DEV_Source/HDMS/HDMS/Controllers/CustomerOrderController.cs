using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using HDMS.Models;

namespace HDMS.Controllers
{
    public class CustomerOrderController : Controller
    {
        private HDMSEntities context = new HDMSEntities();
        public ActionResult Index()
        {
            return View(context.ItemManagements.ToList());
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Areas.Customer.Controllers
{

    public partial class HomeController : CustomerDefaultController
    {
        HDMSEntities context = new HDMSEntities();

        public virtual ActionResult Index()
        {
            return Redirect("/Customer/Dashboard");
        }
    }
}

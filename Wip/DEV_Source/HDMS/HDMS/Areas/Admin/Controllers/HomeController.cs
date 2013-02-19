using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Admin.Controllers
{

    public partial class HomeController : AdminDefaultController
    {
        HDMSEntities context = new HDMSEntities();

        public virtual ActionResult Index()
        {
            return Redirect("/Admin/User");
        }
    }
}

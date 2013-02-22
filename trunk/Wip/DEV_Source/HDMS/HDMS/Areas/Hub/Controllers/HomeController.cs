using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Areas.Hub.Controllers
{

    public partial class HomeController : HubDefaultController
    {
        HDMSEntities context = new HDMSEntities();

        public virtual ActionResult Index()
        {
            return Redirect("/Hub/Dashboard");
        }
    }
}

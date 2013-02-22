using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HDMS.Areas.Hub.Controllers
{
    public partial class DashboardController : HubDefaultController
    {
        //
        // GET: /Hub/Dashboard/

        public virtual ActionResult Index()
        {
            return View();
        }

    }
}

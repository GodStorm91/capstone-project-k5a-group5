using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;

namespace SMDH.Areas.Hub.Controllers
{

    public partial class HomeController : HubDefaultController
    {
        SMDHDataContext context = new SMDHDataContext();

        public virtual ActionResult Index()
        {
            return Redirect("/Hub/Dashboard");
        }
    }
}

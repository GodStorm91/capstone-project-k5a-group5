using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;

namespace HDMS.Controllers
{
    [Authorize]
    public partial class HomeController : Controller
    {
        HDMSEntities context = new HDMSEntities();

        public virtual ActionResult Index()
        {
            var roles = Roles.GetRolesForUser(User.Identity.Name).ToList();
            if (roles.Contains("Hub")) return Redirect("/Hub/");
            if(roles.Contains("Customer")) return Redirect("/Customer/");
            if (roles.Contains("Office Staff")) return RedirectToAction("Index", "Dashboard");
            if (roles.Contains("Admin")) return Redirect("/Admin/User");
            //throw new HttpException(403, "You are not permitted to enter!");
            return View("NoPermission");
        }

        public virtual ActionResult About()
        {
            return View();
        }
    }
}

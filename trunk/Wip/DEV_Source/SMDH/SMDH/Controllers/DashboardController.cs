using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Concrete;
using SMDH.Models;
using System.Web.Security;

namespace SMDH.Controllers
{
    [Authorize(Roles="Office Staff")]
    public class DashboardController : Controller
    {
        SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /Dashboard/
        public ActionResult Index()
        {
            ViewBag.UserInfo = context.UserInfos.Single(r => r.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
             return View();
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HDMS.Controllers
{
    [Authorize(Roles = "Office Staff")]
    public class StaffDefaultController : Controller
    {

    }
}

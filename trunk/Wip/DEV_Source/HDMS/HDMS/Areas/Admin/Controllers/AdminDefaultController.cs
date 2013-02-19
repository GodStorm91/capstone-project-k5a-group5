using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HDMS.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminDefaultController : Controller
    {
        
    }
}

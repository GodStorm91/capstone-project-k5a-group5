﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Areas.Hub.Controllers
{    
    [Authorize(Roles = "Hub")]
    public class HubDefaultController : Controller
    {
       

    }
}

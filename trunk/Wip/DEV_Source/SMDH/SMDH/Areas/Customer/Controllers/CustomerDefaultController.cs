﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Areas.Customer.Controllers
{
    [Authorize(Roles = "Customer")]
    public class CustomerDefaultController : Controller
    {

    }
}
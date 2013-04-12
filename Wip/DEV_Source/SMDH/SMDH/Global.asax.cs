﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SMDH.Infrastructure;
using SMDH.Utilities;

namespace SMDH
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected static DateTime whenTaskLastRan;
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }, // Parameter defaults
                new[] {"SMDH.Controllers"}
            );

        }

        protected void Application_Start()
        {
            whenTaskLastRan = DateTime.Now;
            AreaRegistration.RegisterAllAreas();

            HtmlHelper.ClientValidationEnabled = true;
            HtmlHelper.UnobtrusiveJavaScriptEnabled = true;

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            ControllerBuilder.Current.SetControllerFactory(new NinjectControllerFactory());
        }

        void Session_Start(object sender, EventArgs e)
        {
            DoTask();
        }

        static void DoTask()
        {
            var oneDayAgo = DateTime.Now.AddDays(-1);
            if (whenTaskLastRan < oneDayAgo)
            {
                Utilities.Utilities.UpdateOrderInHubStatus();
            }
        }

        
    }
}
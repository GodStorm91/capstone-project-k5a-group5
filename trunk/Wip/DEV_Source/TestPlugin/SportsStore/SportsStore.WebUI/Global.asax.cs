using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SportsStore.WebUI.Infrastructure;
using SportsStore.Domain.Entities;
using SportsStore.WebUI.Binders;

namespace SportsStore.WebUI
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //match for URL null
            routes.MapRoute(null, "",//only match the empty URL (ie . /)
                new
                {
                    controller = "Product",
                    action = "List",
                    category = (string)null,
                    page = 1
                }
                );

            //URL routing for pagination
            routes.MapRoute(null, "Page{page}", new { 
                Controller = "Product", action = "List" ,
                category = (string)null}, 
                new {page = @"\d+"} //must match constraints Page1, Page2, Page123, not PageABC            
            );

            //URL routing for filtering
            routes.MapRoute(null,
                "{category}", //Matches /Footbal or /AnythingWithNoSlash
                new { controller = "Product", action = "List", page = 1 }
             );

            //URL routing for filtering and pagination
            routes.MapRoute(null,
                "{category}/Page{page}", //Matches /Fottball/Page456
                new {controller = "Product", action = "List"}, //defaults
                new {page = @"\d+"}
            );
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Product", action = "List", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            ControllerBuilder.Current.SetControllerFactory(new NinjectControllerFactory());
            ModelBinders.Binders.Add(typeof(Cart), new CartModelBinder());
        }
    }
}
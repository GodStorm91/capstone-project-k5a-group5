using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SMDH.Infrastructure;
using SMDH.Utilities;
using SMDH.Controllers;

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
            name: "Notfound404",
            url: "Notfound404/{action}/{id}",
            defaults: new{
                controller = "Error",
                action="Notfound404",
                id = UrlParameter.Optional
            });
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

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();
            //log the exception
            HttpException httpException = exception as HttpException;

            RouteData routeData = new RouteData();
            routeData.Values.Add("controller", "Error");
            if (httpException == null)
            {
                routeData.Values.Add("action", "Index");
            }
            else
            {
                switch (httpException.GetHttpCode())
                {
                    case 404:
                        //Page not found
                        routeData.Values.Add("action", "HttpError404");
                        break;
                    case 500:
                        //Server Error
                        routeData.Values.Add("action", "HttpError500");
                        break;
                    default:
                        //something error
                        routeData.Values.Add("action", "HttpGeneralError");
                        break;
                }               
            }
            //Pass exception details to the target error view.
            routeData.Values.Add("error", exception);

            //Clear the exception oon server
            Server.ClearError();

            //Avoid IIS7 getting in the middle
            Response.TrySkipIisCustomErrors = true;

            //Call target Controller and pass route Data
            IController errorController = new ErrorController();
            errorController.Execute(new RequestContext(new HttpContextWrapper(Context), routeData));
        }
        
    }
}
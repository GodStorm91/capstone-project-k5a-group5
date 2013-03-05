using System.Web.Mvc;

namespace SMDH.Areas.Hub
{
    public class CustomerAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Hub";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Hub_Default",
                "Hub/{controller}/{action}/{id}",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "SMDH.Areas.Hub.Controllers" } 
            );
        }
    }
}

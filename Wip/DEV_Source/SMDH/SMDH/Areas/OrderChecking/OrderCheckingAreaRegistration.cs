using System.Web.Mvc;

namespace SMDH.Areas.OrderChecking
{
    public class OrderCheckingAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "OrderChecking";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "OrderChecking_default",
                "OrderChecking/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}

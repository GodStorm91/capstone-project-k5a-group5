using System.Web.Mvc;

namespace SMDH.Areas.Buyer
{
    public class BuyerAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Buyer";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                 "Buyer_Default",
                 "Buyer/{controller}/{action}/{id}",
                 new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                 new[] { "SMDH.Areas.Buyer.Controllers" }
             );
        }
    }
}

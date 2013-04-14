using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
namespace SMDH.Controllers
{
    public class ReportController : Controller
    {
        //
        // GET: /Report/
        private SMDHDataContext context = new SMDHDataContext();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetData()
        {
            var orders = from p in context.Orders
                         group p by p.CreatedDate.Value.Date into g
                         select new { Date = String.Format("{0:dd-MM-yyyy hh:mm tt}",g.Key), TotalFee = g.Sum(p => p.Fee), TotalAmountToBeCollected = g.Sum(p=>p.AmountToBeCollectedFromReceiver) };
            return Json(orders,JsonRequestBehavior.AllowGet);
            
        }

    }
}
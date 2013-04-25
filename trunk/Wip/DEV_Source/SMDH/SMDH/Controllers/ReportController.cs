using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Statuses;
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

        public ActionResult GetDataForRevenueChart(string startDate, string endDate, double gasolinePrice)
        {
            var startDateDT = DateTime.ParseExact(startDate.Trim(), "ddMMyyyy", null);
            var endDateDT = DateTime.ParseExact(endDate.Trim(), "ddMMyyyy", null);
            var prices = from p in context.Plans 
                         where (p.FinishedDate > startDateDT && p.FinishedDate < endDateDT)
                         group p by p.CreatedDate.Value.Day into g

                         select new { Month = g.Key, TotalFee = g.Sum(p => p.Distance) * (decimal)gasolinePrice };

            var orders = from p in context.Orders
                         where (p.CreatedDate > startDateDT && p.CreatedDate < endDateDT)
                         group p by p.CreatedDate.Day into g

                         select new { Month = g.Key, TotalFee = g.Sum(p => p.Fee) };

            return Json(new { orders = orders , plans = prices }, JsonRequestBehavior.AllowGet);
            
        }

        public ActionResult GetDataForCustomerRevenuePieChart(string startDate, string endDate)
        {
            var startDateDT = DateTime.ParseExact(startDate.Trim(), "ddMMyyyy", null);
            var endDateDT = DateTime.ParseExact(endDate.Trim(), "ddMMyyyy", null);
            var orders = from p in context.Orders
                         where (p.CreatedDate >= startDateDT && p.CreatedDate <= endDateDT)
                         group p by context.Customers.Single(c => c.CustomerId == p.CustomerId).DisplayName into g

                         select new { CustomerName = g.Key, TotalFee =g.Sum(p => p.Fee) };
            return Json(orders);

        }

        public ActionResult GetDataForPlanDistanceChart(string startDate, string endDate)
        {
            var startDateDT = DateTime.ParseExact(startDate.Trim(), "ddMMyyyy", null);
            var endDateDT = DateTime.ParseExact(endDate.Trim(), "ddMMyyyy", null);
            var plans = from p in context.Plans
                        where (p.CreatedDate >= startDateDT && p.CreatedDate <= endDateDT)
                        group p by p.CreatedDate into g

                        select new { Date = string.Format("{0:dd-MM-yyyy}", g.Key), TotalDistance = g.Sum(p => p.Distance) };
            return Json(plans);
        }

    }
}
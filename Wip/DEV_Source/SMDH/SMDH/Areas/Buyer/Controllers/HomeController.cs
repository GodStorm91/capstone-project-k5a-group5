using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;
using SMDH.Models;

namespace SMDH.Areas.Buyer.Controllers
{
    public class HomeController : Controller
    {
        private IProductRepository _repository;

        private SMDHDataContext context = new SMDHDataContext();

        public HomeController(IProductRepository repository)
        {
            _repository = repository;
        }
        //
        // GET: /Buyer/Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ViewProductsByCustomerId(int customerId)
        {
            var products = _repository.GetProductsByCustomerId(customerId);
            ViewBag.HubCategories = new SelectList(context.HubCategories.Where(o => o.isActive).ToArray(), "HubCategoryId", "HubName");
            ViewBag.Hub = new SelectList( new List<SMDH.Models.Hub>());
            return View(products);
        }

    }
}

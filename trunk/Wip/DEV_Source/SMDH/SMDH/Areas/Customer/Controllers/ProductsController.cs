using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Abstract;
using SMDH.Models;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;

namespace SMDH.Areas.Customer.Controllers
{
    public class ProductsController : Controller
    {
        private IProductRepository _repository;

        public ProductsController(IProductRepository productRepository)
        {
            _repository = productRepository;
        }
        //
        // GET: /Customer/Products/

        public ViewResult Index()
        {
            var product = new List<Product>();
            product = _repository.Products.Where(p => p.IsPermanent == true).ToList();
            return View(product);
        }

        [HttpPost]
        public ActionResult ConfirmCreate(Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.Create(product);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ConfirmEdit(Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.Edit(product);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {

            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                _repository.Remove(id);
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            //var item = context.ItemManagements.Find(id);
            //if (item.VendorID != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            //ViewBag.Customer = userInfo.Customer.CompanyName;
            //return View(item);

            Product product = _repository.Find(id);
            return View(product);
        }

    }
}

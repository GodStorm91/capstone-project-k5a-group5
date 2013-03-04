using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;

namespace SMDH.Controllers
{
    public class CustomersController : Controller
    {
        private ICustomerRepository _repository;
        public CustomersController(ICustomerRepository repository)
        {
            _repository = repository;
        }
        //
        // GET: /Customers/

        public ActionResult Index()
        {           
            return View(_repository.GetActiveCustomer());
        }

        public ViewResult Details(int id)
        {
            Customer customer = _repository.Find(id);
            return View(customer);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ConfirmCreate(Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.IsActive = true;
                _repository.Add(customer);
                return Json(new
                                {
                                    success = true,
                                    customerId = customer.CustomerId
                                });
                
            }

            return Json(new { success = false });
        }

        public ActionResult Edit(int id)
        {
            Customer customer = _repository.Find(id);
            return View(customer);
        }

        [HttpPost]
        public ActionResult ConfirmEdit(Customer customer)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.Save(customer);
                    return Json(new { success = true, customer });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }

        }

        [HttpPost]
        public ActionResult GetAddressTable(int customerId)
        {
            var addresses = _repository.GetCustomerAddresses(customerId);
            return PartialView("AddressTable", addresses);

        }


        [HttpPost]
        public ActionResult GetContactTable(int customerId)
        {
            var contacts = _repository.GetCustomerContacts(customerId);
            return PartialView("ContactTable", contacts);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var customer = _repository.Find(id);
                if (_repository.Delete(customer)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }


    }
}

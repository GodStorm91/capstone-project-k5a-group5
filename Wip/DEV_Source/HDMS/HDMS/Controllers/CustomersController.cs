using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Controllers
{
    public class CustomersController : StaffDefaultController
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /Customers/

        public ViewResult Index()
        {
            return View(context.Customers.Where(c => c.IsActive).ToList());
        }

        //
        // GET: /Customers/Details/5

        public ViewResult Details(int id)
        {
            Customer customer = context.Customers.Find(id);
            return View(customer);
        }

        //
        // GET: /Customers/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Customers/Create

        [HttpPost]
        public ActionResult ConfirmCreate(Customer customer)
        {
            if (ModelState.IsValid)
            {
                customer.IsActive = true;
                context.Customers.Add(customer);
                context.SaveChanges();
                return Json(new
                                {
                                    success = true,
                                    customerId = customer.CustomerId
                                });
            }

            return Json(new { success = false });
        }

        //
        // GET: /Customers/Edit/5

        public ActionResult Edit(int id)
        {
            Customer customer = context.Customers.Find(id);
            return View(customer);
        }

        //
        // POST: /Customers/Edit/5

        [HttpPost]
        public ActionResult ConfirmEdit(Customer customer)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    context.Entry(customer).State = EntityState.Modified;
                    context.SaveChanges();
                    return Json(new{success = true, customer });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
            
        }

        //
        // POST: /Customers/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id)
        //{
        //    Customer customer = context.Customers.Single(x => x.CustomerId == id);
        //    return View(customer);
        //}

        //
        // POST: /Customers/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Customer customer = context.Customers.Single(x => x.CustomerId == id);
        //    customer.IsActive = false;
        //    //context.Customers.Remove(customer);
        //    context.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //
        // GET: /Customers/ToggleActivate/5

        //public ActionResult ToggleActivate(int id)
        //{
        //    Customer customer = context.Customers.Find(id);
        //    customer.IsActive = !customer.IsActive;
        //    context.SaveChanges();
        //    return Json(new { isActive = customer.IsActive });
        //}

        //
        // POST: /Customers/CreateCustomerWizard

        //[HttpPost]
        //public ActionResult CreateCustomerWizard()
        //{
        //    switch (Request["step_number"])
        //    {
        //        case "1":
        //            //ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //            //ViewBag.PossibleDistricts = new SelectList(new List<District>());
        //            //ViewBag.PossibleWards = new SelectList(new List<Ward>());
        //            //return PartialView("WizardCustomerAddress"); ;
        //            ////return PartialView("WizardCustomerContact");
        //            return PartialView("WizardCustomerInfo");
        //            break;
        //        case "2":
        //            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //            ViewBag.PossibleDistricts = new SelectList(new List<District>());
        //            ViewBag.PossibleWards = new SelectList(new List<Ward>());
        //            return PartialView("WizardCustomerAddress"); ;
        //            break;
        //        case "3":
        //            return PartialView("WizardCustomerContact");
        //            break;
        //        default:
        //            break;
        //    }
        //    return null;
        //}

        //[HttpPost]
        //public ActionResult GetCustomerInfo(int customerId)
        //{
        //    var customer = context.Customers.Find(customerId);
        //    return Json(new 
        //    { 
        //        success = true,
        //        customerId = customer.CustomerId,
        //        companyName = customer.CompanyName,
        //        displayName = customer.DisplayName,
        //        phone = customer.PhoneNumber,
        //        contractNumber = customer.CurrentContractCode
        //    });
        //}

        [HttpPost]
        public ActionResult GetAddressTable(int customerId)
        {
            var addresses = context.CustomerAddresses.Where(ca => ca.CustomerId == customerId && ca.IsActive).ToList();
            return PartialView("AddressTable", addresses);
        }

        [HttpPost]
        public ActionResult GetContactTable(int customerId)
        {
            var contacts = context.Contacts.Where(ca => ca.CustomerId == customerId && ca.IsActive).ToList();
            return PartialView("ContactTable", contacts);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var customer = context.Customers.Find(id);
                if(customer.Delete(context)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}
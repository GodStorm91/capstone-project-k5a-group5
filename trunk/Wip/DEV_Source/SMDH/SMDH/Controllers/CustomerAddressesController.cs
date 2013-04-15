using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Utilities;
using SMDH.Models;

namespace SMDH.Controllers
{
    public class CustomerAddressesController : StaffDefaultController
    {
        private SMDHDataContext context = new SMDHDataContext();

        //
        // GET: /CustomerAddresses/

        //public ViewResult Index()
        //{
        //    ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //    ViewBag.PossibleDistricts = new SelectList(context.Districts.ToArray(), "DistrictID", "Name");
        //    ViewBag.PossibleCustomers = context.Customers;
        //    ViewBag.PossibleWards = context.Wards;
        //    return View(context.CustomerAddresses
        //                    .Include(customeraddress => customeraddress.Customer)
        //                    .Include(customeraddress => customeraddress.Ward)
        //                    .Include(customeraddress => customeraddress.Requests).ToList());
        //}

        //
        // GET: /CustomerAddresses/Details/5

        public ViewResult Details(int id)
        {
            CustomerAddress customeraddress = context.CustomerAddresses.Single(c=>c.CustomerId == id);

            return View(customeraddress);
        }

        //
        // POST: /CustomerAddresses/Create

        [HttpPost]
        public ActionResult Create()
        {
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            return View();
        }

        //
        // POST: /CustomerAddresses/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(CustomerAddress customeraddress)
        {
            if (ModelState.IsValid)
            {
                GoogleMapsHelper.UpdateMapLocation(context, customeraddress, false);
                customeraddress.IsActive = true;
                context.CustomerAddresses.InsertOnSubmit(customeraddress);
                context.SubmitChanges();
                return Json(new { success = true });
            }

            return Json(new { success = false });
        }

        //
        // POST: /CustomerAddresses/Edit/5

        [HttpPost]
        public ActionResult Edit(int id)
        {
            CustomerAddress customeraddress = context.CustomerAddresses.Single(x => x.CustomerAddressId == id);
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).OrderBy(cp => cp.DisplayOrder).ToArray(), "CityProvinceId", "Name", customeraddress.District.CityProvinceId);
            ViewBag.PossibleDistricts = new SelectList(customeraddress.District.CityProvince.Districts.Where(d => d.IsActive).OrderBy(d => d.DisplayOrder).ToArray(), "DistrictId", "Name", customeraddress.DistrictId);
            ViewBag.PossibleWards = new SelectList(customeraddress.District.Wards.Where(w => w.IsActive).OrderBy(w => w.DisplayOrder).ToArray(), "WardId", "Name", customeraddress.WardId);
            return View(customeraddress);
        }

        //
        // POST: /CustomerAddresses/ConfirmEdit/5

        [HttpPost]
        public ActionResult ConfirmEdit(CustomerAddress customeraddress)
        {
            if (ModelState.IsValid)
            {
                GoogleMapsHelper.UpdateMapLocation(context, customeraddress, false);
                //context.Entry(customeraddress).State = EntityState.Modified;
                context.SubmitChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        //
        // GET: /CustomerAddresses/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    CustomerAddress customeraddress = context.CustomerAddresses.Single(x => x.CustomerAddressId == id);
        //    return View(customeraddress);
        //}

        //
        // POST: /CustomerAddresses/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    CustomerAddress customeraddress = context.CustomerAddresses.Single(x => x.CustomerAddressId == id);
        //    context.CustomerAddresses.Remove(customeraddress);
        //    context.SaveChanges();
        //    return Json(new { success = true });
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
        // POST: /CustomerAddress/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{
        //    CustomerAddress customeraddress = context.CustomerAddresses.Find(id);
        //    customeraddress.IsActive = !customeraddress.IsActive;
        //    context.SaveChanges();
        //    return Json(new { isActive = customeraddress.IsActive });
        //}



        //
        // POST: /Ward/GetDistrictsOfCity/5

        [HttpPost]
        public ActionResult GetAddressesOfCustomer(int id)
        {
            var addresses = context.CustomerAddresses.Where(ca => ca.CustomerId == id && ca.IsActive).ToList();
            var jsonAddressList = new List<JsonAddress>();
            foreach (var address in addresses)
            {
                var jsonAddress = new JsonAddress
                                      {
                                          CustomerAddressId = address.CustomerAddressId,
                                          FullAddress = address.FullAddress
                                      };
                jsonAddressList.Add(jsonAddress);
            }
            return Json(jsonAddressList);
        }

        class JsonAddress
        {
            public int CustomerAddressId { get; set; }
            public string FullAddress { get; set; }
        }

        [HttpPost]
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
        {
            try
            {
                var customerAddress = context.CustomerAddresses.Single(ca=>ca.CustomerId == id);
                //if (customerAddress.UpdateLocation(context, latitude, longitude)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var customerAddress = context.CustomerAddresses.Single(c=>c.CustomerId == id);
                customerAddress.IsActive = false;
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}
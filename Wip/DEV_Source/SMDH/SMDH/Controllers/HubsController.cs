using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Utilities;
using SMDH.Models;
using SMDH.Models.Concrete;
using SMDH.Models.ViewModels;

namespace SMDH.Controllers
{
    public class HubsController : StaffDefaultController
    {
        private SMDHDataContext context = new SMDHDataContext();

        //
        // GET: /CustomerAddresses/

        public ViewResult Index()
        {
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleCustomers = context.Customers.Where(c => c.IsActive);
            ViewBag.PossibleWards = context.Wards;
            return View(context.Hubs.Where(h => h.IsActive).ToList());
        }

        //
        // GET: /CustomerAddresses/Details/5

        //public ViewResult Details(int id)
        //{
        //    Hub hub = context.Hubs.Find(id);

        //    return View(hub);
        //}

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
        public ActionResult ConfirmCreate(Hub hub)
        {
            hub.IsActive = true;
            if (ModelState.IsValid)
            {
                GoogleMapsHelper.UpdateMapLocation(context, hub, false);
                hub.IsActive = true;
                context.Hubs.InsertOnSubmit(hub);
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
            var hub = context.Hubs.Single(o=> o.HubId == id);

            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", hub.District.CityProvinceId);
            ViewBag.PossibleDistricts = new SelectList(hub.District.CityProvince.Districts.Where(d => d.IsActive).ToArray(), "DistrictId", "Name", hub.DistrictId);
            ViewBag.PossibleWards = new SelectList(hub.District.Wards.Where(w => w.IsActive).ToArray(), "WardId", "Name", hub.WardId);
            return View(hub);
        }

        //
        // POST: /CustomerAddresses/ConfirmEdit/5

        [HttpPost]
        public ActionResult ConfirmEdit(Hub hub)
        {
            if (ModelState.IsValid)
            {
                GoogleMapsHelper.UpdateMapLocation(context, hub, false);
                //context.(hub).State = EntityState.Modified;
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

        //[HttpPost]
        //public ActionResult GetAddressesOfCustomer(int id)
        //{
        //    var addresses = context.CustomerAddresses.Where(ca => ca.CustomerId == id && ca.IsActive).ToList();
        //    var jsonAddressList = new List<JsonAddress>();
        //    foreach (var address in addresses)
        //    {
        //        var jsonAddress = new JsonAddress
        //                              {
        //                                  CustomerAddressId = address.CustomerAddressId,
        //                                  FullAddress = address.FullAddress
        //                              };
        //        jsonAddressList.Add(jsonAddress);
        //    }
        //    return Json(jsonAddressList);
        //}

        //class JsonAddress
        //{
        //    public int CustomerAddressId { get; set; }
        //    public string FullAddress { get; set; }
        //}

        [HttpPost]
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
        {
            try
            {
                var hub = context.Hubs.Single(o=> o.HubId == id);
                if (hub.UpdateLocation(context, latitude, longitude)) return Json(new { success = true });
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
                var hub = context.Hubs.Single(o=> o.HubId == id);
                hub.IsActive = false;
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        public ActionResult GetLatLongOfHub(int id)
        {
            var hub = context.Hubs.Single(o => o.HubId == id);
            return Json(new { latitude= hub.Latitude , longitude = hub.Longitude }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Find(int id)
        {
            EFHubsRepository hubRepo = new EFHubsRepository();
            HubViewModel result = hubRepo.Find(id);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
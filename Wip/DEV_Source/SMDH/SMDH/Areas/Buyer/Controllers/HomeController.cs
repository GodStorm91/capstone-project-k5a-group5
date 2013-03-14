﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;
using SMDH.Models;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using SMDH.Helpers;
using SMDH.Models.ViewModels;

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
            ViewBag.CompanyInfo = context.Customers.FirstOrDefault(c => c.CustomerId == customerId);
            ViewBag.HubCategories = new SelectList(context.HubCategories.Where(o => o.isActive).ToArray(), "HubCategoryId", "HubName");
            ViewBag.Hub = new SelectList( new List<SMDH.Models.Hub>());
            ViewBag.City = new SelectList(context.CityProvinces.Where(o => o.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.District = new SelectList(new List<District>());
            ViewBag.Ward = new SelectList(new List<Ward>());
            return View(products);
        }

        [HttpPost]
        public ActionResult ConfirmBuy(string itemArray, string itemNumberArray, string name, string address, string phone, string email , string totalPrice,
            string dueDate)
        {
            try
            {
                string[] listItem = itemArray.Split(',');
                //fortest 
                itemNumberArray = "1,2";
                dueDate = "20130308";
                string[] listNumber = itemNumberArray.Split(',');
                int[] listItemId = new int[listItem.Length];
                int[] listItemNumber = new int[listItem.Length];
                GetLatitudeAndLongitudeFromAddress(address);
                for (int i = 0; i < listItem.Length; i++)
                {
                    listItemId[i] = Int32.Parse(listItem[i]);
                    listItemNumber[i] = Int32.Parse(listNumber[i]);
                }
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }
       
        public ActionResult GetLatitudeAndLongitudeFromAddress(string address)
        {
            try
            {
                address += ", Ho Chi Minh, Viet Nam"; 
                
                HttpWebRequest request =  (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/geocode/json?address="
             + address + "&sensor=false");

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                double latitude;
                double longitude;
                EFHubsRepository hubRepo = new EFHubsRepository();
                using (var streamReader = new StreamReader(response.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                    RootObject locationInfo = JsonConvert.DeserializeObject<RootObject>(result);
                    latitude = locationInfo.results[0].geometry.location.lat;
                    longitude = locationInfo.results[0].geometry.location.lng;
                  
                }

                HubViewModel nearestHub = hubRepo.GetNearestHub(latitude, longitude);

                return Json( new {lat = latitude, lon = longitude, nearestHub = nearestHub});
            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}
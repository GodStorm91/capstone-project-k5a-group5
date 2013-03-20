using System;
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
using SMDH.Models.Statuses;

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
            ViewBag.Items = products;
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

        [HttpPost]
        public ActionResult ConfirmCreateOrder(string itemsList, string quantitiesList, string pricesList, string receiverName, string receiverAddress,
            int receiverAddressWardId, int receiverAddressDistrictId, decimal longitude, decimal latitude, string receiverPhone, string receiverEmail, int deliveryType,
            int toBeCollectedAmount, int customerId, int hubId = -1)
        {
            EFOrdersRepository _repository = new EFOrdersRepository();
            EFItemsRepository itemRepo = new EFItemsRepository();
            Order order = new Order();
            int[] itemsListArr = parseStringToList(itemsList);
            int[] quantitiesListArr = parseStringToList(quantitiesList);
            int[] priceListArr = parseStringToList(pricesList);
            order.AmountToBeCollectedFromReceiver = toBeCollectedAmount;
            order.DeliveryTypeId = deliveryType;
            order.ReceiverAddress = receiverAddress;
            order.ReceiverAddressDistrictId = receiverAddressDistrictId;
            order.ReceiverAddressWardId = receiverAddressWardId;
            order.ReceiverMail = receiverEmail;
            order.ReceiverPhone = receiverPhone;
            order.ReceiverName = receiverName;
            order.Latitude = latitude;
            order.Longitude = longitude;
            order.DeliveryOptionId = 1;
            order.OrderPaymentTypeId = 1;
            order.OrderStatus = (int)OrderStatus.New;
            order.CustomerId = customerId;
            order.CreatedDate = DateTime.Now;
            if (hubId != -1)
            {
                order.HubId = hubId;
            }
            

            //user want to deliver to Hub so a passcode must be generated
            if (hubId != -1)
            {
                string passCode = Utilities.Utilities.CreateRandomPassword(7);
                order.Passcode = passCode;
            }

            if (_repository.ConfirmAdd(order))
            {
                for (int i = 0; i < itemsListArr.Length; i++)
                {
                    Item item = new Item();
                    item.OrderId = order.OrderId;
                    item.Price = priceListArr[i];
                    item.ProductId = itemsListArr[i];
                    item.Quantity = quantitiesListArr[i];

                    if (!itemRepo.Add(item))
                    {
                        return View("Error");
                    }
                }
            }

            return View(order);
        }

        private int[] parseStringToList(string input)
        {
            string[] splitArr = input.Split(',');
            int[] resultArray = new int[splitArr.Length];
            for (int i = 0; i < splitArr.Length; i++)
            {
                resultArray[i] = int.Parse(splitArr[i]);
            }

            return resultArray;
        }
    }
}

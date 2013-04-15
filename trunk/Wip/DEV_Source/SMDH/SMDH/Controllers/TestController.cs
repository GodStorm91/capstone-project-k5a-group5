using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using SMDH.Models;
using SMDH.Models.Concrete;
using SMDH.Helpers;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;

namespace SMDH.Controllers
{    
    public class TestController : Controller
    {
        private SMDHDataContext context = new SMDHDataContext();
        //
        // GET: /Test/
        private static string[] _address = new string[35]
        {"54 Pham Huu Chi", "136 Nguyen Cuu Dam", "42 Han Thuyen",
            "136 Truong Phuoc Phan", "25/5 Ngo Thoi Nhiem", "69 Tran Quoc Thao",
            "172 Vo Thi Sau" , "300 Ly Chinh Thang", "21 Ba Huyen Thanh Quan", "78 Ky Dong",
            "65 Hoa Hung", "79 To Hien Thanh", "51 Ly Thuong Kiet", "75 Su Van Hanh", "60 Dong Nai",
            "149/65 Le Dai Hanh", "525 Nguyen Tri Phuong", "66 Tran Binh Trong", "49 Ly Nam De", 
            "323A Minh Phung", "50 Han Hai Nguyen" , "65 Nguyen Chi Thanh", "452/1 Hong Bang", 
            "95 Nguyen Duy Duong" , "86 Le Hong Phong" , "172 Nguyen Van Cu", "324 Luy Ban Bich",
            "49 Hoa Binh", "176 Hoa Binh", "195 Hoa Binh", "197 Au Co" , "246 Nguyen Hong Dao", "230 Nguyen Trai",
            "116 Nguyen Du", "10 Nguyen Bieu"
        };
        public TestController()
        {

        }

        public ActionResult Index()
        {
            return View();
        }

        
        public ActionResult MakeOrderTestData(int numberOrders, int maximumCustomer = 2)
        {
            try
            {
                for (int i = 0; i < numberOrders; i++)
                {
                    Random rnd = new Random();
                    int customerId = rnd.Next(1, maximumCustomer);
                    var products = context.Products.Where(p => p.CustomerId == customerId);
                    var order = new Order();
                    order.CreatedDate = DateTime.Now;
                    order.CustomerId = customerId;
                    //generate order information
                    bool isBuffer = rnd.Next(1, 3) > 1 ? true : false;
                    if (isBuffer)
                    {
                        int hubId = rnd.Next(2, 20);
                        while (context.Hubs.Count(h => h.HubId == hubId) == 0)
                        {
                            hubId = rnd.Next(2, 20);
                        }

                        var hub = context.Hubs.Single(h => h.HubId == hubId);
                        order.HubId = hubId;
                        order.ReceiverAddressWardId = hub.WardId;
                        order.ReceiverAddressDistrictId = hub.DistrictId;
                        order.ReceiverAddress = hub.Address;
                        order.DeliveryTypeId = 2;
                        order.Passcode = Utilities.Utilities.CreateRandomPw("01219050305").Substring(0,10);
                        order.Latitude = hub.Latitude;
                        order.Longitude = hub.Longitude;

                    }
                    else
                    {
                        int addressId = rnd.Next(1, _address.Length);
                        order.ReceiverAddress = _address[addressId];
                        GetLatitudeAndLongitudeFromAddress(order);
                        order.ReceiverAddressDistrictId = rnd.Next(1, 24);
                        order.ReceiverAddressWardId = rnd.Next(1, 200);
                        order.DeliveryTypeId = 1;
                    }

                    order.DeliveryOptionId = rnd.Next(1, 2);
                    order.OrderPaymentTypeId = rnd.Next(1, 2);
                    order.OrderStatus = (int)OrderStatus.Draft;
                    order.ReceiverPhone = "01219050305";
                    order.ReceiverMail = "KhanhNHV60566@fpt.edu.vn";
                    order.ReceiverName = "Khanh Nguyen";                    

                    context.Orders.InsertOnSubmit(order);
                    context.SubmitChanges();

                    foreach (var product in products)
                    {
                        int checkCondition = rnd.Next(1, products.Count());
                        if (products.Count() / 2 > checkCondition)
                        {
                            Item item = new Item();
                            item.OrderId = order.OrderId;
                            item.ProductId = product.ProductId;
                            item.IsFragile = rnd.Next(1, 2) > 1 ? true : false;
                            item.HasHighValue = rnd.Next(1, 2) > 1 ? true : false;
                            item.Name = product.Name;
                            item.Price = product.ProductPrice;                            
                            item.Quantity = rnd.Next(1, 3);
                            order.AmountToBeCollectedFromReceiver += item.Quantity * item.Price.Value;
                            item.Size = product.Size;
                            item.Weight = product.ProductWeight;
                            context.Items.InsertOnSubmit(item);
                            context.SubmitChanges();
                        }
                    }
                   
                }
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { success = false, reason= e.Message}, JsonRequestBehavior.AllowGet);
                throw;
            }

        }

        public ActionResult MakeRequestTestData(int customerId, int ordersInRequest, int requestsNum = 5)
        {
            try
            {
                var ordersAvailable = context.Orders.Where(o => o.CustomerId == customerId && o.RequestId == null && o.OrderStatus == (int)OrderStatus.New);
                if (ordersAvailable.Count() < requestsNum * ordersInRequest)
                {
                    return Json(new { success = false });
                }
                else
                {
                    int[,] listOrdersInAddress = new int[requestsNum,ordersInRequest];
                    int requestCount = 0;
                    int ordersInCount = 0;
                    foreach (var order in ordersAvailable)
                    {
                        if (requestCount < requestsNum)
                        {
                            if (ordersInCount < ordersInRequest)
                            {
                                listOrdersInAddress[requestCount,ordersInCount] = order.OrderId;
                                ordersInCount ++;
                            }
                            else if (ordersInCount == ordersInRequest)
                            {
                                requestCount++;
                                ordersInCount = 0;
                                if (requestCount < requestsNum)
                                {
                                    listOrdersInAddress[requestCount, ordersInCount] = order.OrderId;
                                }
                                
                            }
                        }
                    }
                    for (int i = 0; i < requestsNum; i++)
                    {
                        Request request = new Request();
                        UserInfo uf = context.UserInfos.First(u => u.CustomerId == customerId);
                        request.CreatedByUserId = uf.UserId;
                        request.RequestedDate = DateTime.Now;
                        request.RequestStatus = (int)RequestStatus.New;
                        request.CustomerId = customerId;                        
                        var customer = context.Customers.Single(c => c.CustomerId == customerId);
                        var customerAddresses = context.CustomerAddresses.Where(ca => ca.CustomerId == customerId);
                        int[] listAddress = new int[customerAddresses.Count()];
                        int j = 0;
                        foreach (var customerAddress in customerAddresses)
                        {
                            listAddress[j] = customerAddress.CustomerAddressId;
                            j++;
                        }

                        Random rnd = new Random();
                        int addressIndex = rnd.Next(0, customerAddresses.Count());
                        request.CollectionAddressId = listAddress[addressIndex];
                        context.Requests.InsertOnSubmit(request);
                        context.SubmitChanges();

                        for (int k = 0; k < ordersInRequest; k++)
                        {
                            var order = context.Orders.Single(o => o.OrderId == listOrdersInAddress[i, k]);
                            order.RequestId = request.RequestId;
                            order.OrderStatus = (int)OrderStatus.Requested;
                        }

                        context.SubmitChanges();

                    }

                    return Json(new { success = true },JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception e)
            {
                return Json(new { success = false, data= e.Message }, JsonRequestBehavior.AllowGet);
                throw;
            }
        }

        public void GetLatitudeAndLongitudeFromAddress(Order order)
        {
            var address = order.ReceiverAddress;
            try
            {
                //order.ReceiverAddress += ", Ho Chi Minh, Viet Nam";
                address += ", Ho Chi Minh, Viet Nam";                
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/geocode/json?address="
             + address + "&sensor=false");
                request.Proxy = WebRequest.DefaultWebProxy;
                request.Credentials = new NetworkCredential("nhvkhanh", "1qazXSW@", "LUXOFT");
                request.Proxy.Credentials = new NetworkCredential("nhvkhanh", "1qazXSW@", "LUXOFT");
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

                order.Latitude = (decimal)latitude;
                order.Longitude = (decimal)longitude;
                
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}

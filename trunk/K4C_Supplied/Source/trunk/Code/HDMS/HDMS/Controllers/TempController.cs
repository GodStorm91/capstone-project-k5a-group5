using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Google.Api.Maps.Service.Geocoding;
using HDMS.Models.Tsp;
using HDMS.Models.Utilities;
using HDMS.Models;
using HDMS.Models.Statuses;
using Newtonsoft.Json.Linq;

namespace HDMS.Controllers
{
    public class TempController : Controller
    {
        HDMSEntities context = new HDMSEntities();
        //
        // GET: /Temp/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /DeliveryOption/

        public ActionResult DeliveryOption()
        {
            return View();
        }


        //GET :/Account/

        public ActionResult Account()
        {
            return View();
        }
        //
        // GET: /ManageCustomer/
        public ActionResult ManageCustomer()
        {
            return View();
        }

        //
        // GET: /ManageOrder/
        public ActionResult ManageOrder()
        {
            return View();
        }

        //
        // GET: /ManageOrder/
        public ActionResult ManageItem()
        {
            return View();
        }


        //
        // GET: /CityProvince/

        public ActionResult CityProvince()
        {
            return View();
        }

        //
        // GET: /District/

        public ActionResult District()
        {
            return View();
        }

        //
        // GET: /Ward/

        public ActionResult Ward()
        {
            return View();
        }

        //
        // GET : /Contact/

        public ActionResult Contact()
        {
            return View();
        }

        //
        // GET: /ManagePayment/

        public ActionResult ManagePayment()
        {
            return View();
        }

        //
        // GET: /OrderPaymentType/

        public ActionResult OrderPaymentType()
        {
            return View();
        }

        //
        // GET: //DeliveryStaff/

        public ActionResult DeliveryStaff()
        {
            return View();
        }

        //
        // GET: //Collection Planning/

        public ActionResult CollectionPlanning()
        {
            return View();
        }

        //
        // GET: //Request Creating/

        public ActionResult RequestCreating()
        {
            return View();
        }

        //
        // GET: //LineChart/

        public ActionResult LineChart()
        {
            return View();
        }

        //
        // GET: //PieChart/

        public ActionResult PieChart()
        {
            return View();
        }

        public ActionResult Maps()
        {
            var orders = context.Orders.Where(o => o.OrderStatus != (int)OrderStatus.Canceled).ToList();
            var orderViewModels = new List<OrderViewModel>();

            foreach (var order in orders)
            {
                var orderViewModel = new OrderViewModel(order);
                orderViewModels.Add(orderViewModel);
            }
            ViewBag.Orders = orderViewModels;
            return View();
        }

        public ActionResult DistanceMatrix()
        {
            //var list = new List<string>();
            var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                && o.OrderStatus == (int)OrderStatus.Collected
                                                ).ToArray();
            //var distanceBetweenOrder = context.Distances.Where(dbo => (dbo.FromOrderId == fromOrder.OrderId && dbo.ToOrderId == toOrder.OrderId)
            //                           || (dbo.FromOrderId == toOrder.OrderId && dbo.ToOrderId == fromOrder.OrderId)).FirstOrDefault();

            //ViewBag.DBOs = context.Distances.ToList();
            return View(orders);
        }

        public ActionResult MapsRoute()
        {
            var orders = context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.PlannedForDelivering)/*.OrderBy(o => o.ReceiverAddressWardId)*/;
            var cities = new Cities();
            foreach (var order in orders)
            {
                var city = new City(order.OrderId);
                cities.Add(city);
            }
            cities.CalculateCityDistances(null);
            var tsp = new Tsp();
            var orderedIdList = tsp.Begin(cities);
            var orderList = new List<Order>();
            foreach (var id in orderedIdList)
            {
                orderList.Add(orders.Where(o => o.OrderId == id).FirstOrDefault());
            }
            return View(orderList);
        }
    }
}

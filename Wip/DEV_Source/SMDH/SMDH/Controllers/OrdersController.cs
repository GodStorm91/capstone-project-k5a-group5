using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Abstract;
using SMDH.Models;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;

namespace SMDH.Controllers
{
    public class OrdersController : Controller
    {
        private IOrderRepository _repository;        

        public OrdersController(IOrderRepository orderRepository)
        {
            _repository = orderRepository;
        }
        //
        // GET: /Orders/

        public ActionResult Index()
        {
            var orders = new List<Order>();
            var statuses = new List<int>();
            statuses.Add((int)OrderStatus.New);
            statuses.Add((int)OrderStatus.Approved);
            statuses.Add((int)OrderStatus.PlannedForCollecting);
            statuses.Add((int)OrderStatus.Collected);
            statuses.Add((int)OrderStatus.ToBeReturned);
            statuses.Add((int)OrderStatus.PlannedForDelivering);

            try
            {
                if (!string.IsNullOrEmpty(Request["status"]))
                {
                    var statusStrs = Request["status"].Split(',');
                    if (statusStrs.Count() > 0)
                    {
                        statuses = new List<int>();
                        foreach (var statusStr in statusStrs)
                        {
                            switch (statusStr.ToLower())
                            {
                                case "draft": statuses.Add((int)OrderStatus.Draft);
                                    break;
                                case "new": statuses.Add((int)OrderStatus.New);
                                    break;
                                case "approved": statuses.Add((int)OrderStatus.Approved);
                                    break;
                                case "plannedforcollecting": statuses.Add((int)OrderStatus.PlannedForCollecting);
                                    break;
                                case "collected": statuses.Add((int)OrderStatus.Collected);
                                    break;
                                case "tobereturned": statuses.Add((int)OrderStatus.ToBeReturned);
                                    break;
                                case "plannedfordelivering": statuses.Add((int)OrderStatus.PlannedForDelivering);
                                    break;
                                case "delivered": statuses.Add((int)OrderStatus.Delivered);
                                    break;
                                case "returned": statuses.Add((int)OrderStatus.Returned);
                                    break;
                                case "canceled": statuses.Add((int)OrderStatus.Canceled);
                                    break;
                                case "rejected": statuses.Add((int)OrderStatus.Rejected);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            //orders = context.Orders.Where(o => statuses.Contains(o.OrderStatus)).ToList();
            orders = _repository.GetOrdersByStatuses(statuses);

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                orders = orders.Where(o => o.Request.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                orders = orders.Where(o => o.Request.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(orders);
        }

        //
        // GET: /Orders/Details/5
        public ViewResult Details(int id)
        {            
            var order = _repository.Find(id);

            ViewBag.Items = _repository.GetItemsInOrder(id);

            return View(order);           
        }

        //
        // GET: /Ordres/Create
        public ActionResult Create(int requestId)
        {
            ViewBag.PossibleCityProvinces = new SelectList(_repository.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.PossibleDeliveryOptions = new SelectList(_repository.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name");
            ViewBag.PossiblePaymentTypes = new SelectList(_repository.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name");
            ViewBag.RequestId = requestId;
            return View();
        }

        /// <summary>
        /// Save Order to DB
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ConfirmCreate(Order order)
        { 
            try
            {
                var request = _repository.FindRequestById(order.RequestId);
                if (_repository.AddToRequest(request, order))
                {
                    order = _repository.Find(order.OrderId);
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
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
        public ActionResult Edit(int id)
        {
            Order order = _repository.Orders.Single(x => x.OrderId == id);
            ViewBag.PossibleCityProvinces = new SelectList(_repository.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.PossibleDeliveryOptions = new SelectList(_repository.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name");
            ViewBag.PossiblePaymentTypes = new SelectList(_repository.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name");
            return View(order);
        }

        [HttpPost]
        public ActionResult ConfirmEdit(Order order)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    order.OrderStatus = (int)OrderStatus.Draft;
                    order = _repository.ConfirmEdit(order);
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
                }
                else
                {
                    return Json(new { success = true });
                }
                
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                var order = _repository.Find(id);
                if (_repository.Cancel(order))
                {
                    return Json(new { success = true });
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
        public ActionResult Approve()
        {
            try
            {
                if (string.IsNullOrWhiteSpace(Request["OrderId"]) ||
                    string.IsNullOrWhiteSpace(Request["Fee"]) ||
                    string.IsNullOrWhiteSpace(Request["DueDate"]))
                {
                    return Json(new { success = false });
                }
                var order = _repository.Find(int.Parse(Request["OrderId"]));
                var dueDate = DateTime.ParseExact(Request["DueDate"], "dd/MM/yyyy", null);
                var fee = int.Parse(Request["Fee"]);
                if (_repository.Approve(order, dueDate, fee))
                {
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails});

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
        public ActionResult Reject(int id)
        {
            try
            {
                var order = _repository.Find(id);
                if (_repository.Reject(order))
                {
                    return Json(new { success = true });
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
        public ActionResult DisApprove(int id)
        {
            try
            {
                var order = _repository.Find(id);
                if (_repository.DisApprove(order))
                {
                    return Json(new { success = true });
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
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
        {
            try
            {
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        [HttpPost]
        public ActionResult RemoveFromPlan(int id)
        {
            try
            {
                var order = _repository.Find(id);
                var plan = _repository.FindPlan(order);
                if (_repository.RemoveFromPlan(plan, order))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        public int GetAgreedOrders()
        {
            return 0;
        }

        public int GetCollectedOrders()
        {
            return 0;
        }

        public int GetRejectedAndExpiredOrders()
        {
            return 0;
        }

        public ActionResult MarkAsDelivered(int orderId)
        {
            var order = _repository.Find(orderId);
            if (!_repository.MarkAsDelivered(order))
            {
                return Json(new { success = false });
            }
            else
            {
                return Json(new { success = true });
            }
        }



        
    }
}

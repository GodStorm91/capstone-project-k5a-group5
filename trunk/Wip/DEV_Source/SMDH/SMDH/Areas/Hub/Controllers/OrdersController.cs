using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SMDH.Models;
using SMDH.Models.Statuses;
using SMDH.Utilities;
using SMDH.Models.ViewModels;
using SMDH.Models.Concrete;

namespace SMDH.Areas.Hub.Controllers
{
    public class OrdersController : HubDefaultController
    {

        //
        // GET: /Hub/Orders/
        private SMDHDataContext context = new SMDHDataContext();

        public ViewResult Index()
        {
            List<int> status = new List<int>();

            try
            {
                if (!string.IsNullOrEmpty(Request["status"]))
                {
                    var statusStrs = Request["status"].Split(',');
                    if (statusStrs.Any())
                    {
                        foreach (var statusStr in statusStrs)
                        {
                            switch (statusStr.ToLower())
                            {
                                case "deliveringtohub": status.Add((int)OrderStatus.DeliveringToHub);
                                    break;
                                case "delivering": status.Add((int)OrderStatus.Delivering);
                                    break;
                                case "delivered": status.Add((int)OrderStatus.Delivered);
                                    break;
                                case "waitingforreturn": status.Add((int)OrderStatus.WaitingForReturn);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            ////var requests = context.Requests.Where(r => r.CustomerId == userInfo.CustomerId).ToList();
            ////var requestId = requests.Select(request => request.RequestId).ToList();

            List<Order> orders = context.Orders.Where(o => status.Contains(o.OrderStatus) && o.HubId == 1).ToList();


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

            ViewBag.SelectedStatuses = status;
            return View(orders);
        }

        //
        // GET: /HubSideOrder/Details/5

        public ViewResult Details(int id)
        {
            Order order = context.Orders.Single(o=> o.OrderId == id);

            ViewBag.Items = order.Items.ToList();

            return View(order);
        }

        ////public ViewResult Edit(int id)
        ////{
        ////    var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
        ////    var order = context.Orders.Find(id);
        ////    if (order.Request.CustomerId != userInfo.CustomerId) return null;
        ////    ViewBag.Customer = userInfo.Customer.CompanyName;
        ////    ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", order.District.CityProvinceId);
        ////    ViewBag.PossibleDistricts = new SelectList(order.District.CityProvince.Districts.Where(d => d.IsActive), "DistrictId", "Name", order.ReceiverAddressDistrictId);
        ////    ViewBag.PossibleWards = new SelectList(order.District.Wards.Where(w => w.IsActive), "WardId", "Name", order.ReceiverAddressWardId);
        ////    ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name", order.DeliveryOptionId);
        ////    ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name", order.OrderPaymentTypeId);
        ////    return View(order);
        ////}

        public ViewResult EnterPasscode()
        {
            return View();
        }

        public ActionResult CreateOrderAndPasscode()
        {
            string newPass = Utilities.Utilities.CreateRandomPassword(7);
            Order testOrder = new Order()
                {
                    RequestId = 7,
                    DeliveryOptionId = 2,
                    OrderPaymentTypeId = 1,
                    ReceiverPhone = "0933113113",
                    ReceiverAddress = "abc",
                    ReceiverAddressDistrictId = 1,
                    AmountToBeCollectedFromReceiver = 10000,
                    OrderStatus = 14,
                    Passcode = newPass
                };
            context.Orders.InsertOnSubmit(testOrder);
            context.SubmitChanges();

            Utilities.Utilities.SendMail(newPass, "test.hdms@gmail.com");


            return Redirect("/Hub/");
        }

        public ViewResult Edit(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var order = context.Orders.Single( o=> o.OrderId == id);
            //if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
            ViewBag.Customer = "Cty Vikey";//userInfo.Customer.CompanyName;
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", order.District.CityProvinceId);
            ViewBag.PossibleDistricts = new SelectList(order.District.CityProvince.Districts.Where(d => d.IsActive), "DistrictId", "Name", order.ReceiverAddressDistrictId);
            ViewBag.PossibleWards = new SelectList(order.District.Wards.Where(w => w.IsActive), "WardId", "Name", order.ReceiverAddressWardId);
            ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name", order.DeliveryOptionId);
            ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name", order.OrderPaymentTypeId);
            return View(order);
        }

        ////[HttpPost]
        ////public ActionResult Edit(int id)
        ////{
        ////    var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
        ////    var order = context.Orders.Find(id);
        ////    if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
        ////    ViewBag.Customer = userInfo.Customer.CompanyName;
        ////    ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", order.District.CityProvinceId);
        ////    ViewBag.PossibleDistricts = new SelectList(order.District.CityProvince.Districts.Where(d => d.IsActive), "DistrictId", "Name", order.ReceiverAddressDistrictId);
        ////    ViewBag.PossibleWards = new SelectList(order.District.Wards.Where(w => w.IsActive), "WardId", "Name", order.ReceiverAddressWardId);
        ////    ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name", order.DeliveryOptionId);
        ////    ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name", order.OrderPaymentTypeId);
        ////    return View(order);
        ////}

        [HttpPost]
        public ActionResult ConfirmEdit(Order order)
        {
            try
            {
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var request = context.Requests.Single(o=> o.RequestId == order.RequestId);
                if (request.CustomerId != userInfo.CustomerId) return Json(new { success = false });
                ViewBag.Customer = userInfo.Customer.CompanyName;
                if (ModelState.IsValid)
                {
                    //context.Entry(order).State = EntityState.Modified;
                    context.SubmitChanges();
                    var myContext = new SMDHDataContext();
                    order = myContext.Orders.Single(o=> o.OrderId == order.OrderId);
                    var orderDetails = new OrderViewModel(order);
                    return Json(new { success = true, order = orderDetails });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        ////[HttpPost]
        ////public ActionResult Edit(int id)
        ////{
        ////    var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
        ////    var order = context.Orders.Find(id);
        ////    if (order.Request.CustomerId != userInfo.CustomerId) throw new HttpException(404, "Not found!");
        ////    ViewBag.Customer = userInfo.Customer.CompanyName;
        ////    ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name", order.District.CityProvinceId);
        ////    ViewBag.PossibleDistricts = new SelectList(order.District.CityProvince.Districts.Where(d => d.IsActive), "DistrictId", "Name", order.ReceiverAddressDistrictId);
        ////    ViewBag.PossibleWards = new SelectList(order.District.Wards.Where(w => w.IsActive), "WardId", "Name", order.ReceiverAddressWardId);
        ////    ViewBag.PossibleDeliveryOptions = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToList(), "DeliveryOptionId", "Name", order.DeliveryOptionId);
        ////    ViewBag.PossiblePaymentTypes = new SelectList(context.OrderPaymentTypes.Where(opt => opt.IsActive).ToList(), "OrderPaymentTypeId", "Name", order.OrderPaymentTypeId);
        ////    return View(order);
        ////}

        public ActionResult SubmitPasscode(string passCode)
        {
            try
            {
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var result = context.Orders.Where(x => x.Passcode.ToString() == passCode && x.OrderStatus == (int)OrderStatus.Delivering && userInfo.HubId == x.HubId ).Single();
                if (result == null)
                {
                    return Json(new { success = false }, JsonRequestBehavior.AllowGet);
                }
                OrderViewModel returnResult = new OrderViewModel(result);

                return Json(new { success = true, result = returnResult }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
           
        }

        public ActionResult ChangeStatusByPasscode(int selectedId)
        {
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            var order = context.Orders.FirstOrDefault(x => x.OrderId == selectedId && x.HubId == userInfo.HubId);
            if (order == null)
            {
                return Redirect("/Hubs/");
            }

            order.Status = OrderStatus.Delivered;
            order.OrderStatus = (int)OrderStatus.Delivered;
            context.SubmitChanges();

            return Redirect("/Hub/");
        }

        public ActionResult ChangeStatus(List<int> selectedObjects)
        {
            if (selectedObjects != null)
            {
                IEnumerable<Order> listObject = context.Orders.Where(x => selectedObjects.Contains(x.OrderId));

                if (listObject.Any())
                {
                    if (listObject.Any(x => x.Status == OrderStatus.DeliveringToHub))
                    {
                        foreach (var item in listObject)
                        {
                            item.Status = OrderStatus.Delivering;
                        }

                        context.SubmitChanges();

                        return Redirect("/Hub/Orders?&status=deliveringToHub");
                    }
                    if (listObject.Any(x => x.Status == OrderStatus.WaitingForReturn))
                    {
                        foreach (var item in listObject)
                        {
                            item.Status = OrderStatus.Returned;
                        }

                        context.SubmitChanges();

                        return Redirect("/Hub/Orders?&status=waitingForReturn");
                    }
                }
            }

            return Redirect("/Hub/");
        }

    }
}

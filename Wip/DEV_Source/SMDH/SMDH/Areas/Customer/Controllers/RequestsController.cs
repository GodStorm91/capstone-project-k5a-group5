using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SMDH.Models;
using SMDH.Models.Statuses;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;

namespace SMDH.Areas.Customer.Controllers
{
    public class RequestsController : CustomerDefaultController
    {
        private SMDHDataContext context = new SMDHDataContext();
        private IRequestRepository _repository;

        public RequestsController(IRequestRepository requestRepository)
        {
            _repository = requestRepository;
        }
        //
        // GET: /CRCustomer/
        public ViewResult Index()
        {
            var requests = new List<Request>();
            var statuses = new List<int>();
            statuses.Add((int)RequestStatus.New);
            statuses.Add((int)RequestStatus.Pricing);
            statuses.Add((int)RequestStatus.Approved);
            statuses.Add((int)RequestStatus.Collected);
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
                                case "new": statuses.Add((int)RequestStatus.New);
                                    break;
                                case "pricing": statuses.Add((int)RequestStatus.Pricing);
                                    break;
                                case "approved": statuses.Add((int)RequestStatus.Approved);
                                    break;
                                case "collected": statuses.Add((int)RequestStatus.Collected);
                                    break;
                                case "canceled": statuses.Add((int)RequestStatus.Canceled);
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
            //requests = userInfo.Customer.Requests.Where(r => statuses.Contains(r.RequestStatus)).ToList();
            requests = context.Requests.Where(r => statuses.Contains(r.RequestStatus) && r.CustomerId == 1).ToList();
            //ViewBag.Customer = userInfo.Customer.CompanyName;
            ViewBag.Customer = "Test";

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                requests = requests.Where(r => r.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                requests = requests.Where(r => r.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;
            return View(requests);
        }

        //public ActionResult Index()
        //{
        //    var currentUser = Membership.GetUser(User.Identity.Name);
        //    var userInfo = context.UserInfoes.Find((Guid) currentUser.ProviderUserKey);
        //    var requests = userInfo.Customer.Requests.ToList();

        //    return View(requests);
        //}

        //
        // GET: /Requests/Details/5

        public ViewResult Details(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            Request request = context.Requests.Single(o => o.RequestId == id);
            //if (request.CustomerId == userInfo.CustomerId)
            if (request.CustomerId == 1)
            {
                if (request != null)
                {
                    ViewBag.Customer = "Lazada";
                    return View(request);
                }
            }
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult ConfirmCreate(HttpPostedFileBase excelFile)
        {
            try
            {
                var request = new Request
                {
                    CustomerId = 1,
                    CollectionAddressId = 1,
                    RequestStatus = 0
                };
                if (_repository.Create(request))
                {
                    return RedirectToAction("AddOrders", new { id = request.RequestId });
                }
                return View("CreateUnsuccessful");
            }
            catch (Exception)
            {
                return View("CreateUnsuccessful");
            }

        }

        //public ActionResult AddOrders(int id)
        //{
        //    Request request = _repository.Find(id);
        //    if (request.CustomerId == 1)
        //    {
        //        if (request != null)
        //        {
        //            if (request.Status != RequestStatus.Draft) return RedirectToAction("Index");
        //            return View(request);
        //        }
        //    }
        //    throw new HttpException(404, "Not found!");
        //}

        //private class JsonRequest
        //{
        //    public int RequestId { get; set; }
        //    public string CustomerDisplayName { get; set; }
        //    public string CollectionAddress { get; set; }
        //    public Nullable<System.DateTime> RequestedDate { get; set; }
        //}

        //[HttpPost]
        //public ActionResult GetRequestsOfCityProvince(int id)
        //{
        //    var requests = context.Requests.Where(cr => cr.CustomerAddress.District.CityProvinceId == id)
        //        .Include(cr => cr.Customer).Include(cr => cr.CustomerAddress);
        //    if (requests != null)
        //    {
        //        var jsonRequests = new List<JsonRequest>();
        //        foreach (var request in requests)
        //        {
        //            var jsonRequest = new JsonRequest
        //            {
        //                RequestId = request.RequestId,
        //                RequestedDate = request.RequestedDate,
        //                CustomerDisplayName = request.Customer.DisplayName,
        //                CollectionAddress = request.CollectionAddress
        //            };
        //            jsonRequests.Add(jsonRequest);
        //        }
        //        return Json(new { success = true, jsonRequests });
        //    }
        //    return Json(new { success = false });
        //}

        [HttpPost]
        public ActionResult Create()
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);

            //ViewBag.PossibleCollectionAddresses = userInfo.Customer.CustomerAddresses.Where(ca => ca.IsActive);
            ViewBag.PossibleCollectionAddresses = context.CustomerAddresses.Where(ca => ca.IsActive && ca.CustomerId == 1);
            return View();
        }

        //[HttpPost]
        //public ActionResult ConfirmCreate(int collectionAddressId, string note, HttpPostedFileBase excelFile)
        //{
        //    try
        //    {
        //        var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
        //        var collectionAddress = context.CustomerAddresses.Find(collectionAddressId);
        //        if (userInfo.CustomerId != collectionAddress.CustomerId) return View("CreateUnsuccessful");
        //        var request = new Request
        //        {
        //            CustomerId = (int)userInfo.CustomerId,
        //            CollectionAddressId = collectionAddressId,
        //            Note = note
        //        };
        //        if (request.Create(context))
        //        {
        //            if (excelFile != null)
        //            {
        //                string savedFileName = "~/Excel/" + excelFile.FileName;
        //                excelFile.SaveAs(Server.MapPath(savedFileName));

        //                var connectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", Server.MapPath(savedFileName));
        //                OleDbConnection objConn = new OleDbConnection(connectionString);
        //                objConn.Open();
        //                var dt = objConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

        //                String[] excelSheets = new String[dt.Rows.Count];
        //                int x = 0;

        //                foreach (DataRow row in dt.Rows)
        //                {
        //                    excelSheets[x] = row["TABLE_NAME"].ToString();
        //                    x++;
        //                }

        //                for (int j = 0; j < excelSheets.Length; j++)
        //                {
        //                    if (excelSheets[j].Contains("Order"))
        //                    {
        //                        var adapter = new OleDbDataAdapter("SELECT * FROM " + "[" + excelSheets[j] + "]", connectionString);
        //                        var ds = new DataSet();
        //                        adapter.Fill(ds, "results");
        //                        DataTable data = new DataTable();
        //                        data = ds.Tables["results"];

        //                        var orders = new List<Order>();
        //                        var items = new List<Item>();

        //                        Order order = new Order();

        //                        for (int i = 0; i < data.Rows.Count; i++)
        //                        {
        //                            var receiverName = data.Rows[i].Field<string>("Receiver Name");
        //                            var receiverPhone = data.Rows[i].Field<string>("Receiver Phone");
        //                            var receiverAddress = data.Rows[i].Field<string>("Receiver Address");
        //                            var drOption = data.Rows[i].Field<string>("Delivery Option");
        //                            var orPaymentType = data.Rows[i].Field<string>("Order Payment Type");
        //                            var cityName = data.Rows[i].Field<string>("City");
        //                            var districtName = data.Rows[i].Field<string>("District");
        //                            var wardName = data.Rows[i].Field<string>("Ward");
        //                            var amount = data.Rows[i].Field<string>("Amount");

        //                            if (i == 0)
        //                            {
        //                                if (string.IsNullOrEmpty(receiverName) == false && string.IsNullOrEmpty(receiverPhone) == false
        //                                    && string.IsNullOrEmpty(receiverAddress) == false && string.IsNullOrEmpty(amount) == false
        //                                    && string.IsNullOrEmpty(drOption) == false && string.IsNullOrEmpty(orPaymentType) == false
        //                                    && string.IsNullOrEmpty(districtName) == false && string.IsNullOrEmpty(cityName) == false
        //                                    && string.IsNullOrEmpty(wardName) == false)
        //                                {
        //                                    var deliveryOption = context.DeliveryOptions.Single(dr => dr.Name == drOption);
        //                                    var orderPaymentType = context.OrderPaymentTypes.Single(op => op.Name == orPaymentType);
        //                                    var district = context.Districts.Single(di => di.Name == districtName);
        //                                    var ward = context.Wards.Single(w => w.Name == wardName && w.DistrictId == district.DistrictId);

        //                                    order.RequestId = request.RequestId;
        //                                    order.DeliveryOptionId = deliveryOption.DeliveryOptionId;
        //                                    order.OrderPaymentTypeId = orderPaymentType.OrderPaymentTypeId;
        //                                    order.ReceiverName = receiverName;
        //                                    order.ReceiverPhone = receiverPhone;
        //                                    order.ReceiverAddress = receiverAddress;
        //                                    order.ReceiverAddressDistrictId = district.DistrictId;
        //                                    order.ReceiverAddressWardId = ward.WardId;
        //                                    order.AmountToBeCollectedFromReceiver = int.Parse(amount);
        //                                    order.Note = data.Rows[i].Field<string>("Note");

        //                                    orders.Add(order);
        //                                    context.Orders.Add(order);
        //                                }
        //                                else
        //                                {
        //                                    return View("CreateUnsuccessful");
        //                                }
        //                            }

        //                            if (i == 4)
        //                            {
        //                                for (int k = 4; k < data.Rows.Count; k++)
        //                                {
        //                                    var name = data.Rows[k].Field<string>("Receiver Name");
        //                                    var quantity = data.Rows[k].Field<string>("Receiver Phone");
        //                                    var isFragile = data.Rows[k].Field<string>("City");
        //                                    var hasHighValue = data.Rows[k].Field<string>("District");
        //                                    var size = data.Rows[k].Field<string>("Ward");
        //                                    var weight = data.Rows[k].Field<string>("Receiver Address");

        //                                    if (string.IsNullOrEmpty(name) == false && string.IsNullOrEmpty(quantity) == false
        //                                        && string.IsNullOrEmpty(isFragile) == false && string.IsNullOrEmpty(hasHighValue) == false
        //                                        && string.IsNullOrEmpty(size) == false && string.IsNullOrEmpty(weight) == false)
        //                                    {
        //                                        Item item = new Item();

        //                                        item.OrderId = order.OrderId;
        //                                        item.Name = name;
        //                                        item.Quantity = int.Parse(quantity);
        //                                        if (isFragile == "True")
        //                                        {
        //                                            item.IsFragile = true;
        //                                        }
        //                                        else
        //                                        {
        //                                            item.IsFragile = false;
        //                                        }
        //                                        if (hasHighValue == "True")
        //                                        {
        //                                            item.HasHighValue = true;
        //                                        }
        //                                        else
        //                                        {
        //                                            item.HasHighValue = false;
        //                                        }
        //                                        item.Size = size;
        //                                        item.Weight = weight;
        //                                        item.Note = data.Rows[k].Field<string>("Amount");

        //                                        items.Add(item);
        //                                        context.Items.Add(item);
        //                                        context.SaveChanges();
        //                                    }
        //                                    else
        //                                    {
        //                                        return View("CreateUnsuccessful");
        //                                    }
        //                                }
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //            return RedirectToAction("AddOrders", new { id = request.RequestId });
        //        }
        //        return View("CreateUnsuccessful");
        //    }
        //    catch (Exception)
        //    {
        //        return View("CreateUnsuccessful");
        //    }

        //}

        public ActionResult AddOrders(int id)
        {
            //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            Request request = context.Requests.Single(o => o.RequestId == id);
            //if (request.CustomerId == userInfo.CustomerId)
            if (request.CustomerId == 1)
            {
                if (request != null)
                {
                    //ViewBag.Customer = userInfo.Customer.CompanyName;
                    ViewBag.Customer = "Lazara";
                    //if (request.Status != RequestStatus.Draft) return RedirectToAction("Index");
                    return View(request);
                }
            }
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult Submit(int id)
        {
            try
            {
                EFRequestsRepository requestRepo = new EFRequestsRepository();
                //var userInfo = context.UserInfoes.Find((Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                Request request = context.Requests.Single(o => o.RequestId == id);
                //if (request.CustomerId == userInfo.CustomerId)
                if (request.CustomerId == 1)
                {
                    if (requestRepo.Confirm(request)) return Json(new { success = true, requestId = request.RequestId });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }


        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                EFRequestsRepository requestRepo = new EFRequestsRepository();
                var request = context.Requests.Single(r => r.RequestId == id);
                if (requestRepo.CustomerCancel(request))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }
    }
}

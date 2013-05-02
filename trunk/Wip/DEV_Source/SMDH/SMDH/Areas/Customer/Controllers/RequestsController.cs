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

        public ActionResult AddOrderToRequest(int customerId, int requestId)
        {
            EFProductsRepository productrepository = new EFProductsRepository();
            var products = productrepository.GetProductsByCustomerId(customerId);
            ViewBag.CompanyInfo = context.Customers.FirstOrDefault(c => c.CustomerId == customerId);
            ViewBag.HubCategories = new SelectList(context.HubCategories.Where(o => o.isActive).ToArray(), "HubCategoryId", "HubName");
            ViewBag.Hub = new SelectList(new List<SMDH.Models.Hub>());
            ViewBag.City = new SelectList(context.CityProvinces.Where(o => o.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.District = new SelectList(new List<District>());
            ViewBag.Ward = new SelectList(new List<Ward>());
            ViewBag.DeliveryOption = new SelectList(context.DeliveryOptions.Where(d => d.IsActive).ToArray(), "DeliveryOptionId", "Name");
            ViewBag.OrderPaymentType = new SelectList(context.OrderPaymentTypes.Where(o => o.IsActive).ToArray(), "OrderPaymentTypeId", "Name");
            ViewBag.Items = products;
            ViewBag.RequestId = requestId;
            return View(products);
        }

        [HttpPost]
        public ActionResult ConfirmCreateOrder(string itemsList, string quantitiesList, string pricesList, string receiverName, string receiverAddress,
            int receiverAddressDistrictId, decimal longitude, decimal latitude, string receiverPhone, string receiverEmail, int deliveryType,
             int customerId, int requestId, int receiverAddressWardId = 1, int hubId = -1, int deliveryOption = 1, int orderPaymentType = 1)
        {
            EFOrdersRepository _repository = new EFOrdersRepository();
            EFItemsRepository itemRepo = new EFItemsRepository();
            Order order = new Order();
            int[] itemsListArr = parseStringToList(itemsList);
            int[] quantitiesListArr = parseStringToList(quantitiesList);
            int[] priceListArr = parseStringToList(pricesList);
            int toBeCollectedAmount = 0;
            for (int i = 0; i < itemsListArr.Length; i++)
            {
                toBeCollectedAmount += context.Products.Single(p => p.ProductId == itemsListArr[i]).ProductPrice.Value * quantitiesListArr[i];
            }
            order.RequestId = requestId;
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
            order.DeliveryOptionId = deliveryOption;
            order.OrderPaymentTypeId = orderPaymentType;
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
                    item.Name = context.Products.Single(p => p.ProductId == itemsListArr[i]).Name;
                    item.Size = context.Products.Single(p => p.ProductId == itemsListArr[i]).Size;
                    item.Weight = context.Products.Single(p => p.ProductId == itemsListArr[i]).ProductWeight;

                    if (!itemRepo.Add(item))
                    {
                        return RedirectToAction("AddOrders/" + requestId);
                    }
                }
            }
            return RedirectToAction("AddOrders/" + requestId);
            //return View(order);
        }
        //
        // GET: /CRCustomer/
        public ViewResult Index()
        {
            var requests = new List<Request>();
            var statuses = new List<int>();
            statuses.Add((int)RequestStatus.New);
            statuses.Add((int)RequestStatus.Draft);
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
                                case "draft": statuses.Add((int)RequestStatus.Draft);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            requests = _repository.GetRequestsByStatuses(statuses);

            if (statuses.Count == 1 && statuses.ElementAt(0) == (int)RequestStatus.Pricing)
            {
                ViewBag.ApproveAllDisplay = true;
            }
            else
            {
                ViewBag.ApproveAllDisplay = false;
            }

            var userInfo = context.UserInfos.Single(r => r.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            requests = userInfo.Customer.Requests.Where(r => statuses.Contains(r.RequestStatus)).ToList();
            ////requests = context.Requests.Where(r => statuses.Contains(r.RequestStatus) && r.CustomerId == 1).ToList();
            ViewBag.Customer = userInfo.Customer.CompanyName;
            ////ViewBag.Customer = "Test";

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"].Trim(), "ddMMyyyy", null);
                requests = requests.Where(r => r.RequestedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"].Trim(), "ddMMyyyy", null);
                requests = requests.Where(r => r.RequestedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", endDate);
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
            //var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            Request request = context.Requests.Single(o => o.RequestId == id);
            //if (request.CustomerId == userInfo.CustomerId)
            ////if (request.CustomerId == 1)
            //{
            //    if (request != null)
            //    {
            //        ViewBag.Customer = userInfo.Customer.CompanyName;
            return View(request);
            //    }
            //}
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult ConfirmCreate(int collectionAddressId, string note, HttpPostedFileBase excelFile)
        {
            try
            {
                var request = new Request
                {
                    CustomerId = context.UserInfos.Single(uf => uf.UserId ==
                        (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey).CustomerId.Value,
                    RequestStatus = (int)RequestStatus.Draft,
                    CreatedByUserId = (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey,
                    CollectionAddressId = collectionAddressId,
                    Note = note

                };
                if (_repository.Create(request))
                {
                    if (excelFile != null)
                    {
                        string savedFileName = "~/Excel/" + excelFile.FileName;
                        excelFile.SaveAs(Server.MapPath(savedFileName));

                        var connectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", Server.MapPath(savedFileName));
                        OleDbConnection objConn = new OleDbConnection(connectionString);
                        objConn.Open();
                        var dt = objConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                        String[] excelSheets = new String[dt.Rows.Count];
                        int x = 0;

                        foreach (DataRow row in dt.Rows)
                        {
                            excelSheets[x] = row["TABLE_NAME"].ToString();
                            x++;
                        }

                        for (int j = 0; j < excelSheets.Length; j++)
                        {
                            if (excelSheets[j].Contains("Order"))
                            {
                                var adapter = new OleDbDataAdapter("SELECT * FROM " + "[" + excelSheets[j] + "]", connectionString);
                                var ds = new DataSet();
                                adapter.Fill(ds, "results");
                                DataTable data = new DataTable();
                                data = ds.Tables["results"];

                                var orders = new List<Order>();
                                var items = new List<Item>();
                                var products = new List<Product>();

                                Order order = new Order();

                                for (int i = 0; i < data.Rows.Count; i++)
                                {
                                    var receiverName = data.Rows[i].Field<string>("Receiver Name");
                                    var receiverPhone = data.Rows[i].Field<string>("Receiver Phone");
                                    var receiverAddress = data.Rows[i].Field<string>("Receiver Address");
                                    var drOption = data.Rows[i].Field<string>("Delivery Option");
                                    var orPaymentType = data.Rows[i].Field<string>("Order Payment Type");
                                    var cityName = data.Rows[i].Field<string>("City");
                                    var districtName = data.Rows[i].Field<string>("District");
                                    var wardName = data.Rows[i].Field<string>("Ward");
                                    var amount = data.Rows[i].Field<string>("Amount");

                                    if (i == 0)
                                    {
                                        if (string.IsNullOrEmpty(receiverName) == false && string.IsNullOrEmpty(receiverPhone) == false
                                            && string.IsNullOrEmpty(receiverAddress) == false && string.IsNullOrEmpty(amount) == false
                                            && string.IsNullOrEmpty(drOption) == false && string.IsNullOrEmpty(orPaymentType) == false
                                            && string.IsNullOrEmpty(districtName) == false && string.IsNullOrEmpty(cityName) == false
                                            && string.IsNullOrEmpty(wardName) == false)
                                        {
                                            var deliveryOption = context.DeliveryOptions.Single(dr => dr.Name == drOption);
                                            var orderPaymentType = context.OrderPaymentTypes.Single(op => op.Name == orPaymentType);
                                            var district = context.Districts.Single(di => di.Name == districtName);
                                            var ward = context.Wards.Single(w => w.Name == wardName && w.DistrictId == district.DistrictId);

                                            order.RequestId = request.RequestId;
                                            order.DeliveryOptionId = deliveryOption.DeliveryOptionId;
                                            order.OrderPaymentTypeId = orderPaymentType.OrderPaymentTypeId;
                                            order.ReceiverName = receiverName;
                                            order.ReceiverPhone = receiverPhone;
                                            order.ReceiverAddress = receiverAddress;
                                            order.ReceiverAddressDistrictId = district.DistrictId;
                                            order.ReceiverAddressWardId = ward.WardId;
                                            order.AmountToBeCollectedFromReceiver = int.Parse(amount);
                                            order.Note = data.Rows[i].Field<string>("Note");
                                            order.OrderStatus = (int)OrderStatus.New;
                                            order.CreatedDate = DateTime.Now;

                                            orders.Add(order);
                                            context.Orders.InsertOnSubmit(order);
                                            context.SubmitChanges();
                                        }
                                        else
                                        {
                                            return View("CreateUnsuccessful");
                                        }
                                    }

                                    if (i == 4)
                                    {
                                        for (int k = 4; k < data.Rows.Count; k++)
                                        {
                                            var name = data.Rows[k].Field<string>("Receiver Name");
                                            var quantity = data.Rows[k].Field<string>("Receiver Phone");
                                            var isFragile = data.Rows[k].Field<string>("City");
                                            var hasHighValue = data.Rows[k].Field<string>("District");
                                            var size = data.Rows[k].Field<string>("Ward");
                                            var weight = data.Rows[k].Field<string>("Receiver Address");
                                            var category = data.Rows[k].Field<string>("Delivery Option");
                                            var price = data.Rows[k].Field<string>("Order Payment Type");

                                            if (string.IsNullOrEmpty(name) == false && string.IsNullOrEmpty(quantity) == false
                                                && string.IsNullOrEmpty(isFragile) == false && string.IsNullOrEmpty(hasHighValue) == false
                                                && string.IsNullOrEmpty(size) == false && string.IsNullOrEmpty(weight) == false && string.IsNullOrEmpty(category) == false && string.IsNullOrEmpty(price) == false)
                                            {
                                                Product product = new Product();
                                                product.ProductCategory = category;
                                                product.Name = name;
                                                product.Size = size;
                                                product.ProductWeight = weight;
                                                product.IsPermanent = false;
                                                product.CustomerId = 1;
                                                products.Add(product);
                                                context.Products.InsertOnSubmit(product);
                                                context.SubmitChanges();

                                                Item item = new Item();

                                                item.OrderId = order.OrderId;
                                                item.ProductId = product.ProductId;
                                                item.Name = name;
                                                item.Size = size;
                                                item.Weight = weight;
                                                item.Quantity = int.Parse(quantity);
                                                item.Price = Int32.Parse(price);
                                                if (isFragile == "True")
                                                {
                                                    item.IsFragile = true;
                                                }
                                                else
                                                {
                                                    item.IsFragile = false;
                                                }
                                                if (hasHighValue == "True")
                                                {
                                                    item.HasHighValue = true;
                                                }
                                                else
                                                {
                                                    item.HasHighValue = false;
                                                }
                                                item.Note = data.Rows[k].Field<string>("Amount");

                                                items.Add(item);
                                                context.Items.InsertOnSubmit(item);
                                                context.SubmitChanges();
                                            }
                                            else
                                            {
                                                return View("CreateUnsuccessful");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
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

        //[HttpPost]
        public ActionResult Create()
        {
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            ViewBag.PossibleCollectionAddresses = userInfo.Customer.CustomerAddresses.Where(ca => ca.IsActive);
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
            var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
            Request request = context.Requests.Single(o => o.RequestId == id);
            if (request.CustomerId == userInfo.CustomerId)
            //if (request.CustomerId == 1)
            {
                if (request != null)
                {
                    ViewBag.Customer = userInfo.Customer.CompanyName;
                    //ViewBag.Customer = "Lazara";
                    if (request.Status != RequestStatus.Draft) return RedirectToAction("Index");
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
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                Request request = context.Requests.Single(o => o.RequestId == id);
                if (request.CustomerId == userInfo.CustomerId)
                //if (request.CustomerId == 1)
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

        public ActionResult Approve(int id)
        {
            try
            {
                var request = context.Requests.Single(r => r.RequestId == id);
                request.RequestStatus = (int)RequestStatus.Approved;
                request.ApprovedDate = DateTime.Now;
                foreach (var order in request.ValidOrders)
                {
                    order.ApprovedDate = DateTime.Now;
                    order.OrderStatus = (int)OrderStatus.Approved;
                }
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {

                return Json(new { success = false });
            }
        }

        public ActionResult AddExistingOrdersToRequest(int requestId, string orderStringList)
        {
            try
            {
                int[] orderIds = parseStringToList(orderStringList);
                var request = context.Requests.Single(o => o.RequestId == requestId);
                for (int i = 0; i < orderIds.Length; i++)
                {
                    var order = context.Orders.Single(o => o.OrderId == orderIds[i]);
                    order.RequestId = requestId;
                }

                context.SubmitChanges();

                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }

        }

        public ActionResult RejectForRepricing(int id)
        {
            try
            {
                var request = context.Requests.Single(r => r.RequestId == id);
                request.RequestStatus = (int)RequestStatus.RePricing;
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }

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

        [HttpPost]
        public ActionResult Note(int requestid)
        {
            var request = context.Requests.Single(r => r.RequestId == requestid);
            return View(request);
        }
        [HttpPost]
        public ActionResult SendNote(Request rq, FormCollection formvalues)
        {
            try
            {
                var request = context.Requests.Single(r => r.RequestId == rq.RequestId);
                if (ModelState.IsValid)
                {
                    request.Note = formvalues["note"];
                    context.SubmitChanges();
                    return RedirectToAction("Index", "Dashboard");
                }
                return RedirectToAction("Index", "Dashboard");
            }
            catch (Exception e)
            {
                return RedirectToAction("Index", "Dashboard");
            }

        }

        public ActionResult ApproveAll()
        {
            try
            {
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Pricing && r.CustomerId == userInfo.CustomerId);
                foreach (var request in requests)
                {
                    request.RequestStatus = (int)RequestStatus.Approved;
                    request.ApprovedDate = DateTime.Now;
                }
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

        public ActionResult AutoApprove()
        {
            try
            {
                //orders 
                var allowDraft = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableDraft"];
                var enableReturnedReducedPrice = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableReturnedReducedPrice"];
                var enableRepricingApproveRequest = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["enableRepricingApproveRequest"];
                var orderFlag = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["flag"];
                var orderImmediately = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["immediately"];
                var orderInterval = HttpContext.Profile.GetProfileGroup("OrdersConfiguration")["interval"];

                //request
                var requestFlag = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["flag"];
                var requestImmediately = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["immediately"];
                var requestInterval = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["interval"];
                var minPrice = HttpContext.Profile.GetProfileGroup("RequestsConfiguration")["minPrice"];
                //-------
                var userInfo = context.UserInfos.Single(uf => uf.UserId == (Guid)(Membership.GetUser(User.Identity.Name)).ProviderUserKey);
                var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Pricing && r.CustomerId == userInfo.CustomerId);
                foreach (var request in requests)
                {
                    if ((bool)requestFlag == true)
                    {
                        if ((int)minPrice == 0)
                        {
                            if ((bool)requestImmediately == true)
                            {
                                request.RequestStatus = (int)RequestStatus.Approved;
                                request.ApprovedDate = DateTime.Now;
                            }
                            else
                            {
                                if (request.PricedDate.Value.AddMinutes((int)requestInterval) <= DateTime.Now)
                                {
                                    request.RequestStatus = (int)RequestStatus.Approved;
                                    request.ApprovedDate = DateTime.Now;
                                }
                            }
                        }
                        else
                        {
                            if (request.TotalFee <= (int)minPrice)
                            {
                                if ((bool)requestImmediately == true)
                                {
                                    request.RequestStatus = (int)RequestStatus.Approved;
                                    request.ApprovedDate = DateTime.Now;
                                }
                                else
                                {
                                    if (request.PricedDate.Value.AddMinutes((int)requestInterval) <= DateTime.Now)
                                    {
                                        request.RequestStatus = (int)RequestStatus.Approved;
                                        request.ApprovedDate = DateTime.Now;
                                    }
                                }
                            }
                        }
                    }
                }
                context.SubmitChanges();
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }

    }
}

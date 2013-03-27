using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;
using SMDH.Models.Statuses;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;
using SMDH.Models.ViewModels;
using SMDH.Models.mTsp;
using OsmSharp;
using OsmSharp.Osm.Routing.Interpreter;
using OsmSharp.Routing.Core.Graph.Memory;
using OsmSharp.Osm.Routing.Data.Processing;
using OsmSharp.Osm.Routing.Data;
using OsmSharp.Osm.Data.Core.Processor;
using OsmSharp.Osm.Core;
using OsmSharp.Osm.Data.XML.Raw.Processor;
using OsmSharp.Routing.Core;
using OsmSharp.Routing.Core.Graph.Router.Dykstra;
using OsmSharp.Osm.Map.Layers.Tiles;
using OsmSharp.Osm.Map.Layers.Custom;
using OsmSharp.Tools.Math.Geo;
using OsmSharp.Tools.Math.Shapes;
using OsmSharp.Osm.Map.Elements;
using OsmSharp.Osm.Data.Core.Processor.Progress;
using OsmSharp.Osm.Renderer.Gdi.Targets.UserControlTarget;
using OsmSharp.Routing.Core.Route;
using OsmSharp.Osm.Map.Layers.Routing;
using OsmSharp.Routing.CH.PreProcessing;
using OsmSharp.Routing.CH.Routing;
using OsmSharp.Routing.CH.PreProcessing.Witnesses;
using OsmSharp.Routing.CH.PreProcessing.Ordering;
using System.Threading;
using OsmSharp.Routing.Core.Graph.DynamicGraph.SimpleWeighed;
using OsmSharp.Osm.Data.PostgreSQL.Raw;
using OsmSharp.Osm.Routing.Core.TSP;
using OsmSharp.Osm.Data.Raw.XML.OsmSource;
using System.Reflection;
using OsmSharp.Osm.Data.Core.Processor.Filter.Sort;
using OsmSharp.Osm.Routing.Core.TSP.Genetic;
using OsmSharp.Routing.Core.Graph.DynamicGraph.PreProcessed;


namespace SMDH.Controllers
{
    [Authorize]
    public class PlansController : Controller
    {
        private IPlanRepository _repository;

        SMDHDataContext context = new SMDHDataContext();

        public PlansController(IPlanRepository repository)
        {
            _repository = repository;
        }
        //
        // GET: /Plans/

        public ActionResult Index()
        {
            //Data table

            var plans = context.Plans.Where(p => p.PlanId != null);
            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                plans = plans.Where(p => p.CreatedDate >= startDate);
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            return View(plans);
        }

        //
        //GET: /CollectionPlans
        public ViewResult ViewDeliveryPlans()
        {
            var statuses = new List<int>();
            statuses.Add((int)PlanStatus.New);
            statuses.Add((int)PlanStatus.Assigned);

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
                                case "new": statuses.Add((int)DeliveryPlanStatus.New);
                                    break;
                                case "assigned": statuses.Add((int)DeliveryPlanStatus.Assigned);
                                    break;
                                case "finished": statuses.Add((int)DeliveryPlanStatus.Finished);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            var deliveryPlans = _repository.GetCollectionPlansByStatuses(statuses);

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                deliveryPlans = deliveryPlans.Where(dp => dp.CreatedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                deliveryPlans = deliveryPlans.Where(dp => dp.CreatedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            var deliveryStaffs = from d in context.DeliveryMens
                                 select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status };
            var listDelivery = new List<DeliveryMen>();
            foreach (var delivery in deliveryStaffs)
            {
                listDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
            }
            ViewBag.PossibleDeliveryStaffs = listDelivery;

            return View(deliveryPlans);

        }

        //
        //GET: /Plans/ViewDeliveryPlans
        public ViewResult ViewCollectionPlans()
        {

            var statuses = new List<int>();
            statuses.Add((int)PlanStatus.New);
            statuses.Add((int)PlanStatus.Assigned);

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
                                case "new": statuses.Add((int)DeliveryPlanStatus.New);
                                    break;
                                case "assigned": statuses.Add((int)DeliveryPlanStatus.Assigned);
                                    break;
                                case "finished": statuses.Add((int)DeliveryPlanStatus.Finished);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            var collectionPlans = _repository.GetCollectionPlansByStatuses(statuses);

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                collectionPlans = collectionPlans.Where(dp => dp.CreatedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                collectionPlans = collectionPlans.Where(dp => dp.CreatedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(collectionPlans);
        }

        //
        //GET: /Plans/Create
        public ActionResult CreateDeliveryPlan()
        {
            var usingMap = true;
            if (!string.IsNullOrEmpty(Request["usingMap"]))
            {
                if (Request["usingMap"].ToLower() == "no" || Request["usingMap"].ToLower() == "false") usingMap = false;
            }

            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.Hub = context.Hubs.FirstOrDefault();
            if (usingMap) return View("CreateDeliveryPlanUsingMap");
            return View();
        }

        public ActionResult CreateCollectionPlan()
        {
            var usingMap = true;
            if (!string.IsNullOrEmpty(Request["usingMap"]))
            {
                if (Request["usingMap"].ToLower() == "no" || Request["usingMap"].ToLower() == "false") usingMap = false;
            }
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            ViewBag.PossibleDistricts = new SelectList(new List<District>());
            ViewBag.PossibleWards = new SelectList(new List<Ward>());
            ViewBag.Hub = context.Hubs.FirstOrDefault();
            if (usingMap) return View("CreateCollectionPlanUsingMap");
            return View();
        }

        /// <summary>
        /// Confirm Create Plans
        /// </summary>
        /// <returns>Json: success:boolean, planId: int</returns>
        [HttpPost]
        public ActionResult ConfirmCreate()
        {
            try
            {
                var deliveryPlan = new Plan();
                var orderIdStrs = Request["selectedOrderIds"].Split(',');
                var orderIds = new int[orderIdStrs.Length];
                for (int i = 0; i < orderIdStrs.Length; i++)
                {
                    orderIds[i] = int.Parse(orderIdStrs[i]);
                }
                if (_repository.Create(orderIds))
                {
                    return Json(new { success = true, deliveryPlanId = deliveryPlan.PlanId });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }

            return Json(new { success = false });
        }

        public ActionResult ConfirmCreateCollectionPlan()
        {
            try
            {
                var collectionPlan = new Plan();
                var requestIdsStrs = Request["selectedRequestIds"].Split(',');
                var requestIds = new int[requestIdsStrs.Length];
                for (int i = 0; i < requestIdsStrs.Length; i++)
                {
                    requestIds[i] = int.Parse(requestIdsStrs[i]);
                }

                if (_repository.CreateCollectionPlan(collectionPlan, requestIds))
                {
                    return Json(new { success = true, planId = collectionPlan.PlanId });
                }
                return Json(new { success = true });

            }
            catch (Exception)
            {

                throw;
            }
        }



        /// <summary>
        /// Get Unplanned Request By City
        /// </summary>
        /// <param name="id">City Id: int</param>
        /// <param name="selectedRequestIds">List of Requests that selected by User: int[]</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUnplannedOrdersByCityProvince(int id, int[] selectedOrderIds)
        {
            try
            {
                if (selectedOrderIds == null) selectedOrderIds = new int[0];
                var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                            && o.OrderStatus == (int)OrderStatus.Collected
                                                            && o.District.CityProvinceId == id
                                                            && !selectedOrderIds.Contains(o.OrderId)
                                                            ).OrderBy(o => o.DueDate).ToList();
                var orderViewModels = new List<OrderViewModel>();
                foreach (var order in orders)
                {
                    orderViewModels.Add(new OrderViewModel(order));
                }
                return Json(new { success = true, orders = orderViewModels });
            }
            catch (Exception)
            {
                return Json(new { success = false });
                throw;
            }
        }
        /// <summary>
        /// Get Unplanned Requests by District
        /// </summary>
        /// <param name="id">District Id: int</param>
        /// <param name="selectedRequestIds">selected request : int[]</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUnplannedOrdersByDistrict(int id, int[] selectedOrderIds)
        {
            if (selectedOrderIds == null) selectedOrderIds = new int[0];
            var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                        && o.OrderStatus == (int)OrderStatus.Collected
                                                        && o.ReceiverAddressDistrictId == id
                                                        && !selectedOrderIds.Contains(o.OrderId)
                                                        ).OrderBy(o => o.DueDate).ToList();
            var orderViewModels = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                orderViewModels.Add(new OrderViewModel(order));
            }
            return Json(new { success = true, orders = orderViewModels });
        }

        /// <summary>
        /// Get Unplanned Requests By Ward
        /// </summary>
        /// <param name="id"></param>
        /// <param name="selectedRequestIds"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUnplannedOrdersByWard(int id, int[] selectedOrderIds)
        {
            if (selectedOrderIds == null) selectedOrderIds = new int[0];
            var orders = context.Orders.Where(o => o.DeliveryPlanId == null
                                                        && o.OrderStatus == (int)OrderStatus.Collected
                                                        && o.ReceiverAddressWardId == id
                                                        && !selectedOrderIds.Contains(o.OrderId)
                                                        ).OrderBy(o => o.DueDate).ToList();
            var orderViewModels = new List<OrderViewModel>();
            foreach (var order in orders)
            {
                orderViewModels.Add(new OrderViewModel(order));
            }
            return Json(new { success = true, orders = orderViewModels });
        }

        /// <summary>
        /// Assign delivery men to plan
        /// </summary>
        /// <param name="planId">planId: int</param>
        /// <param name="deliveryMenId">deliveryMenid: int[]</param>
        /// <returns></returns>

        [HttpPost]
        public ActionResult Assign(int PlanId, List<int> listdeliveryman, List<int> listNotAssignedDeliveryMen)
        {
            try
            {
                EFDeliveryMenRepository deliveryMenRepo = new EFDeliveryMenRepository();
                deliveryMenRepo.AssignDeliveryMenToPlan(PlanId, listdeliveryman, listNotAssignedDeliveryMen);
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                String exMsg = e.Message;
                return Json(new { success = false });
            }
        }

        /// <summary>
        /// Cancel a plan
        /// </summary>
        /// <param name="id">planId : int</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Cancel(int id)
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

        /// <summary>
        /// Redirect to AutoSchedule plan section
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ViewResult AutoSchedule()
        {
            return View();
        }


        /// <summary>
        /// Mark plan to be finished
        /// </summary>
        /// <param name="id">id: int</param>
        /// <param name="removeUnfinishedOrders">removeUnfinishedOrders: bool</param>
        /// <returns></returns>
        //[HttpPost]
        //public ActionResult MarkAsFinished(int id, bool removeUnfinishedOrders)
        //{
        //    try
        //    {
        //        return Json(new { success = true });
        //    }
        //    catch (Exception)
        //    {
        //        return Json(new { success = false });
        //        throw;
        //    }
        //}

        [HttpPost]
        public ActionResult GetSelectedRequests(int numberOfRequests, int numberOfPlans, float weightedDateScore, float weightedDeliveryTypeScore)
        {
            try
            {
                var requests = context.Requests.Where(c => c.RequestStatus == (int)Models.Statuses.RequestStatus.Approved);
                var requestViewModel = new List<RequestViewModel>();
                var unselectedViewModel = new List<RequestViewModel>();
                var pointList = new List<GeoCoordinate>();
                foreach (var request in requests)
                {
                    requestViewModel.Add(new RequestViewModel(request, weightedDeliveryTypeScore, weightedDateScore));
                }

                requestViewModel.Sort(CompareRequestByWeightedScore);
                for (int i = numberOfRequests; i < requestViewModel.Count; i++)
                {
                    unselectedViewModel.Add(requestViewModel.ElementAt(i));
                }
                requestViewModel.RemoveRange(numberOfRequests, requestViewModel.Count - numberOfRequests);

                //Create geopointlist
                for (int i = 0; i < requestViewModel.Count; i++)
                {
                    pointList.Add(new GeoCoordinate((double)requestViewModel.ElementAt(i).Latitude, (double)requestViewModel.ElementAt(i).Longitude));
                }

                //MTspHelper.initialize();
                //MTspHelper.solveTsp(pointList, numberOfPlans);

                return Json(new { success = true, requests = requestViewModel, notSelected = unselectedViewModel, waypoints = MTspHelper.waypointLists, segments = MTspHelper.segmentsLists });
            }
            catch (Exception ex)
            {
                string str = ex.Message;
                return Json(new { success = false });
                throw;
            }
        }

        private static int CompareRequestByWeightedScore(RequestViewModel model1, RequestViewModel model2)
        {
            return model1.WeightedScore.CompareTo(model2.WeightedScore);
        }

        [HttpPost]
        public ActionResult GetUnplannedRequestsByCityProvince(int id, int[] selectedRequestIds)
        {
            try
            {
                if (selectedRequestIds == null) selectedRequestIds = new int[0];
                var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved
                                                            && r.CustomerAddress.District.CityProvinceId == id
                                                            && !selectedRequestIds.Contains(r.RequestId)
                                                            ).OrderBy(r => r.RequestedDate).ToList();
                //return View("UnplannedRequestList", requests);
                var requestViewModels = new List<RequestViewModel>();
                foreach (var request in requests)
                {
                    requestViewModels.Add(new RequestViewModel(request));
                }
                return Json(new { success = true, requests = requestViewModels });
            }
            catch (Exception)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult GetUnplannedRequestsByDistrict(int id, int[] selectedRequestIds)
        {
            try
            {
                if (selectedRequestIds == null) selectedRequestIds = new int[0];
                var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved
                                                            && r.CustomerAddress.DistrictId == id
                                                            && !selectedRequestIds.Contains(r.RequestId)
                                                            ).OrderBy(r => r.RequestedDate).ToList();
                var requestViewModels = new List<RequestViewModel>();
                foreach (var request in requests)
                {
                    requestViewModels.Add(new RequestViewModel(request));
                }
                return Json(new { success = true, requests = requestViewModels });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult GetUnplannedRequestsByWard(int id, int[] selectedRequestIds)
        {
            try
            {
                if (selectedRequestIds == null) selectedRequestIds = new int[0];
                var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved
                                                            && r.CustomerAddress.WardId == id
                                                            && !selectedRequestIds.Contains(r.RequestId)
                                                            ).OrderBy(r => r.RequestedDate).ToList();
                var requestViewModels = new List<RequestViewModel>();
                foreach (var request in requests)
                {
                    requestViewModels.Add(new RequestViewModel(request));
                }
                return Json(new { success = true, requests = requestViewModels });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        public ViewResult AutoScheduleCollectionPlan(int cityId = 1, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {

            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");

            var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved
                                                     && r.CustomerAddress.District.CityProvinceId == cityId
                                                     ).OrderBy(r => r.RequestedDate).ToList();
            var requestGroups =
                    from request in requests
                    group request by request.CollectionAddressId into g
                    select new { CollectionAddressId = g.Key, Groups = g };

            //group all
            int maxRequest = 10000000;
            List<List<RequestViewModel>> result = new List<List<RequestViewModel>>();
            foreach (var g in requestGroups)
            {
                List<RequestViewModel> currList = new List<RequestViewModel>();
                int i = 0;
                foreach (var n in g.Groups)
                {
                    i++;
                    currList.Add(new RequestViewModel(n, weightedDeliveryTypeScore, weightedDateScore));

                    //it's equal the maximum request
                    if (i == maxRequest)
                    {
                        result.Add(currList);
                        currList = new List<RequestViewModel>();
                        i = 0;
                    }
                }
                if (currList.Count > 0)
                {
                    result.Add(currList);
                }
            }
            ViewBag.PossibleRequests = result;

            //
            return View();
        }


        public ActionResult Details(int id)
        {
            Plan plans = context.Plans.Single(o => o.PlanId == id);
            if (plans != null)
            {
                try
                {
                    var deliveryStaffs = from d in context.DeliveryMens
                                         select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status };
                    if (plans.Status == 1)
                    {
                        var listDelivery = new List<DeliveryMen>();
                        foreach (var delivery in deliveryStaffs)
                        {
                            listDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
                        }
                        ViewBag.PossibleDeliveryStaffs = listDelivery;
                    }
                    else
                    {
                        var assignedStaff = (from d in context.DeliveryMens
                                             join dm in context.DeliveryMenInPlans on d.DeliveryMenId equals dm.DeliveryMenId
                                             join p in context.Plans on dm.PlanId equals p.PlanId
                                             where d.Status != (int)PlanStatus.New && p.PlanId == id
                                             select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status }).Distinct();

                        int[] listAssignedStaffIds = new int[assignedStaff.Count()];

                        for (int i = 0; i < listAssignedStaffIds.Length; i++)
                        {
                            listAssignedStaffIds[i] = assignedStaff.ToList().ElementAt(i).DeliveryMenId;
                        }

                        deliveryStaffs = deliveryStaffs.Where(d => !listAssignedStaffIds.Contains(d.DeliveryMenId));

                        var listDelivery = new List<DeliveryMen>();
                        var assignDelivery = new List<DeliveryMen>();
                        foreach (var delivery in deliveryStaffs)
                        {
                            listDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
                        }
                        foreach (var delivery in assignedStaff)
                        {
                            assignDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
                        }
                        ViewBag.Assignto = assignDelivery;
                        ViewBag.PossibleDeliveryStaffs = listDelivery;
                        //ViewBag.AssignTo =
                        //    AccountHelper.GetName(assignedStaff.UserId);
                        //Get Request Details in here                       

                    }
                    if (plans.PlanTypeId == (int)PlanTypes.CollectionPlan)
                    {
                        var cargoesInPlan = context.Cargos.Where(c => c.PlanId == plans.PlanId);
                        int[] requestIds = new int[cargoesInPlan.Count()];
                        int i = 0;
                        foreach (var cargo in cargoesInPlan)
                        {
                            requestIds[i] = cargo.RequestId.Value;
                            i++;
                        }

                        var requests = context.Requests.Where(r => requestIds.Contains(r.RequestId)).ToList();
                        List<RequestViewModel> resultList = new List<RequestViewModel>();
                        for (i = 0; i < requests.Count; i++)
                        {
                            resultList.Add(new RequestViewModel(requests.ElementAt(i)));
                        }
                        ViewBag.RequestDetails = resultList;
                    }
                    else if (plans.PlanTypeId == (int)PlanTypes.DeliveryPlan)
                    {
                        var cargoesInPlan = context.Cargos.Where(c => c.PlanId == plans.PlanId);
                        int[] orderIds = new int[cargoesInPlan.Count()];
                        int i = 0;
                        foreach (var cargo in cargoesInPlan)
                        {
                            orderIds[i] = cargo.OrderId.Value;
                            i++;
                        }

                        var requests = context.Orders.Where(r => orderIds.Contains(r.OrderId)).ToList();
                        List<OrderViewModel> resultList = new List<OrderViewModel>();
                        for (i = 0; i < requests.Count; i++)
                        {
                            resultList.Add(new OrderViewModel(requests.ElementAt(i)));
                        }
                        ViewBag.RequestDetails = resultList;
                    }
                    return View(plans);
                }
                catch (Exception e)
                {
                    return View("Error");
                    //throw new HttpException(500, "Error!");
                }
            }

            throw new HttpException(404, "Not found!");
        }

        public ActionResult GroupRequestByCollectionAddressId(int maxRequest = -1, int cityId = 1, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {

            var requests = context.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Approved
                                                    && r.CustomerAddress.District.CityProvinceId == cityId
                                                    ).OrderBy(r => r.RequestedDate).ToList();
            var requestGroups =
                    from request in requests
                    group request by request.CollectionAddressId into g
                    select new { CollectionAddressId = g.Key, Groups = g };

            List<List<RequestViewModel>> result = new List<List<RequestViewModel>>();
            foreach (var g in requestGroups)
            {
                List<RequestViewModel> currList = new List<RequestViewModel>();
                int i = 0;
                foreach (var n in g.Groups)
                {
                    i++;
                    currList.Add(new RequestViewModel(n, weightedDeliveryTypeScore, weightedDateScore));

                    //it's equal the maximum request
                    if (i == maxRequest)
                    {
                        result.Add(currList);
                        currList = new List<RequestViewModel>();
                        i = 0;
                    }
                }
                if (currList.Count > 0)
                {
                    result.Add(currList);
                }

            }

            return Json(new { success = true, groupList = result });

        }

        public ActionResult GroupOrdersByDistrictId(int maxOrders = -1, int cityId = 1, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {

            var orders = context.Orders.Where(r => r.OrderStatus == (int)OrderStatus.Collected
                                                     ).OrderBy(r => r.CreatedDate).ToList();
            var orderGroups =
                    from order in orders
                    group order by order.ReceiverAddressDistrictId into g
                    select new { ReceiverAddressDistrictId = g.Key, Groups = g };


            List<List<OrderViewModel>> result = new List<List<OrderViewModel>>();
            foreach (var g in orderGroups)
            {
                List<OrderViewModel> currList = new List<OrderViewModel>();
                int i = 0;
                foreach (var n in g.Groups)
                {
                    i++;
                    currList.Add(new OrderViewModel(n, weightedDeliveryTypeScore, weightedDateScore));

                    //it's equal the maximum request
                    if (i == maxOrders)
                    {
                        result.Add(currList);
                        currList = new List<OrderViewModel>();
                        i = 0;
                    }
                }
                if (currList.Count > 0)
                {
                    result.Add(currList);
                }
            }

            return Json(new { success = true, groupList = result });

        }

        public ActionResult EditAutoScheduleCollectionPlanAJax(string requestsIdsList, int planNumber = 2, int selectedPlan = 0, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {
            string[] strRequestsIds = requestsIdsList.Split(',');
            int[] requestIds = new int[strRequestsIds.Length];
            List<RequestViewModel> requestViewModel = new List<RequestViewModel>();
            List<List<RequestViewModel>> returnList = new List<List<RequestViewModel>>();
            for (int i = 0; i < requestIds.Length; i++)
            {
                requestIds[i] = Int16.Parse(strRequestsIds[i]);
            }

            //planNumber must be greateer than reqestIds
            if (requestIds.Length < planNumber)
            {
                return null;
            }
            else
            {
                var requests = context.Requests.Where(o => requestIds.Contains(o.RequestId));
                var requestsList = requests.ToList();
                List<GeoCoordinate> pointList = new List<GeoCoordinate>();
                foreach (var request in requests)
                {
                    requestViewModel.Add(new RequestViewModel(request, weightedDeliveryTypeScore, weightedDateScore));
                }
                for (int i = 0; i < requests.Count(); i++)
                {
                    pointList.Add(new GeoCoordinate((double)requestViewModel.ElementAt(i).Latitude, (double)requestViewModel.ElementAt(i).Longitude));
                }

                PointCollection pointCollection = new PointCollection();
                for (int i = 0; i < pointList.Count; i++)
                {
                    pointCollection.Add(new Point(i, pointList[i].Latitude, pointList[i].Longitude));
                }

                List<PointCollection> listPointCollection = MTspHelper.DoKMeans(pointCollection, planNumber);
                for (int i = 0; i < listPointCollection.Count; i++)
                {
                    PointCollection cluster = listPointCollection[i];
                    List<RequestViewModel> listItem = new List<RequestViewModel>();
                    for (int j = 0; j < cluster.Count; j++)
                    {
                        listItem.Add(new RequestViewModel(requestsList.ElementAt(cluster.ElementAt(j).Id)));
                    }
                    returnList.Add(listItem);
                }

                ViewBag.NumberOfPlans = planNumber;
                string listRequestsIds = "";
                for (int i = 0; i < requestIds.Length - 1; i++)
                {
                    listRequestsIds += requestIds[i] + ",";
                }
                listRequestsIds += requestIds[requestIds.Length - 1];

                ViewBag.SelectedRequestsIds = listRequestsIds;

                PointCollection pointCluster = listPointCollection[0];


                //Solve mTsp;
                MTspHelper.initialize();
                MTspHelper.solveTsp(pointList, planNumber);
            }

            return Json(new { waypoints = MTspHelper.waypointLists, segments = MTspHelper.segmentsLists, requests = returnList, distanceList = MTspHelper.planDistanceLists, timeList = MTspHelper.planTimeLists });
        }

        public ActionResult EditAutoScheduleCollectionPlan(string requestsIdsList, int planNumber = 2, int selectedPlan = 0, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {
            try
            {
                string[] strRequestsIds = requestsIdsList.Split(',');
                int[] requestIds = new int[strRequestsIds.Length];
                for (int i = 0; i < requestIds.Length; i++)
                {
                    requestIds[i] = Int16.Parse(strRequestsIds[i]);
                }

                //planNumber must be greateer than reqestIds
                if (requestIds.Length < planNumber)
                {
                    return null;
                }
                else
                {
                    //var requests = context.Requests.Where(o => requestIds.Contains(o.RequestId));
                    //var requestsList = requests.ToList();
                    //List<GeoCoordinate> pointList = new List<GeoCoordinate>();
                    //List<RequestViewModel> requestViewModel = new List<RequestViewModel>();
                    //foreach (var request in requests)
                    //{
                    //    requestViewModel.Add(new RequestViewModel(request, weightedDeliveryTypeScore, weightedDateScore));
                    //}
                    //for (int i = 0; i < requests.Count(); i++)
                    //{
                    //    pointList.Add(new GeoCoordinate((double)requestViewModel.ElementAt(i).Latitude, (double)requestViewModel.ElementAt(i).Longitude));
                    //}

                    //PointCollection pointCollection = new PointCollection();
                    //for (int i = 0; i < pointList.Count; i++)
                    //{
                    //    pointCollection.Add(new Point(i, pointList[i].Latitude, pointList[i].Longitude));
                    //}

                    //List<PointCollection> listPointCollection = MTspHelper.DoKMeans(pointCollection, planNumber);

                    //for (int i = 0; i < listPointCollection.Count; i++)
                    //{
                    //    PointCollection cluster = listPointCollection[i];
                    //}

                    ViewBag.NumberOfPlans = planNumber;
                    //string listRequestsIds = "";
                    //for (int i = 0; i < requestIds.Length - 1; i++)
                    //{
                    //    listRequestsIds += requestIds[i] + ",";
                    //}
                    //listRequestsIds += requestIds[requestIds.Length - 1];

                    //ViewBag.SelectedRequestsIds = listRequestsIds;
                    //List<RequestViewModel> returnList = new List<RequestViewModel>();
                    //PointCollection pointCluster = listPointCollection[0];
                    //for (int i = 0; i < pointCluster.Count; i++)
                    //{
                    //    returnList.Add(new RequestViewModel(requestsList.ElementAt(pointCluster.ElementAt(i).Id)));
                    //}

                    ////Solve mTsp;
                    //MTspHelper.initialize();
                    //MTspHelper.solveTsp(pointList, planNumber);

                    //ViewBag.RequestDetails = returnList;

                }

                return View();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult GetRequestsInPlan(string selectedRequestsIds, int planNumber, int planId)
        {
            try
            {
                string[] selectedRequestIdsArr = selectedRequestsIds.Split(',');
                int[] requestIds = new int[selectedRequestIdsArr.Length];
                for (int i = 0; i < requestIds.Length; i++)
                {
                    requestIds[i] = Int16.Parse(selectedRequestIdsArr[i]);
                }
                var requests = context.Requests.Where(o => requestIds.Contains(o.RequestId));
                List<GeoCoordinate> pointList = new List<GeoCoordinate>();
                List<RequestViewModel> requestViewModel = new List<RequestViewModel>();
                foreach (var request in requests)
                {
                    requestViewModel.Add(new RequestViewModel(request, 0.5, 0.5));
                }
                for (int i = 0; i < requests.Count(); i++)
                {
                    pointList.Add(new GeoCoordinate((double)requestViewModel.ElementAt(i).Latitude, (double)requestViewModel.ElementAt(i).Longitude));
                }

                PointCollection pointCollection = new PointCollection();
                for (int i = 0; i < pointList.Count; i++)
                {
                    pointCollection.Add(new Point(i, pointList[i].Latitude, pointList[i].Longitude));
                }

                List<PointCollection> listPointCollection = MTspHelper.DoKMeans(pointCollection, planNumber);
                var requestsList = requests.ToList();
                List<RequestViewModel> returnList = new List<RequestViewModel>();
                PointCollection cluster = listPointCollection[planId];
                for (int i = 0; i < cluster.Count; i++)
                {
                    returnList.Add(new RequestViewModel(requestsList.ElementAt(cluster.ElementAt(i).Id)));
                }
                string result = "<ul class='site-stats'>";
                for (int i = 0; i < returnList.Count; i++)
                {
                    string itemString = "<li>" +
                            "<div style='float: right;'>" +
                                "<a class='label label-success' href='#'><i class='icon-circle-arrow-right'></i></a>" +
                                "<a class='label label-important' href='#'><i class='icon-remove'></i></a>" +
                            "</div>" +
                            "<div>" +
                                "<div>" +
                                    "<span class='icon-book'></span><span class='label label-info requestId'>" + returnList[i].RequestId + "</span><span " +
                                        "class='icon-user'></span><span class='label label-info requestId'>" + returnList[i].Customer + "</span><span " +
                                            "class='icon-calendar'></span><span class='label label-info requestId'>" + returnList[i].RequestedDate + "</span>" +
                                "</div>" +
                                "<div>" +
                                    "<span class='icon-globe'></span><span>" + returnList[i].CollectionAddress + "</span>" +
                                "</div>" +
                            "</div>" +
                            "<div>" +
                                "---------------------------------------------------</div>" +
                        "</li>";
                    result += itemString;
                }
                result += "</ul>";
                pointList.Clear();
                for (int i = 0; i < returnList.Count; i++)
                {
                    pointList.Add(new GeoCoordinate((double)returnList.ElementAt(i).Latitude, (double)returnList.ElementAt(i).Longitude));
                }

                MTspHelper.initialize();
                MTspHelper.solveTsp(pointList, 1);
                return Json(new { success = true, listRequest = result, waypoints = MTspHelper.waypointLists, segments = MTspHelper.segmentsLists }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                string message = e.Message;
                throw;
            }
        }

        public ActionResult ConfirmCreateAutoScheduleCollectionPlan(List<ListRequestsJsonModel> Entrys)
        {
            string planIds = "";
            bool success = true;
            foreach (var entry in Entrys)
            {
                int[] listRequests = entry.listRequests.ToArray();
                double distance = entry.Distance;
                var plan = new Plan();
                plan.Distance = (Decimal)distance;
                plan.SegmentsLatitude = string.Join(",", entry.SegmentsLatitudeList.ToArray());
                plan.SegmentsLongitude = string.Join(",", entry.SegmentsLongitudeList.ToArray());
                plan.WaypointsLatitude = string.Join(",", entry.WaypointsLatitudeList.ToArray());
                plan.WaypointsLongitude = string.Join(",", entry.WaypointsLongitudeList.ToArray());
                if (_repository.CreateCollectionPlan(plan, listRequests))
                {
                    planIds += plan.PlanId + ",";
                }
                else
                {
                    success = false;
                    break;
                }
            }

            //remove the "," redundancy
            if (success)
            {
                planIds = planIds.Remove(planIds.Length - 1);
            }


            if (success)
            {
                return Json(new { success = success, url = Url.Action("ViewDetailsCollectionPlans", "Plans", new { planIds = planIds }) });
            }
            else
            {
                return Json(new { success = success });
            }


        }

        public ActionResult ViewDetailsCollectionPlans(string planIds)
        {
            string[] planIdsList = planIds.Split(',');
            int[] planIdsNumList = new int[planIdsList.Length];
            for (int i = 0; i < planIdsList.Length; i++)
            {
                planIdsNumList[i] = int.Parse(planIdsList[i]);
            }
            var plans = context.Plans.Where(o => planIdsNumList.Contains(o.PlanId));

            var deliveryStaffs = from d in context.DeliveryMens
                                 select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status };
            var listDelivery = new List<DeliveryMen>();
            foreach (var delivery in deliveryStaffs)
            {
                listDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
            }
            ViewBag.PossibleDeliveryStaffs = listDelivery;

            return View(plans);
        }

        public ActionResult AutoScheduleDeliveryPlan(int cityId = 1, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {
            var orders = context.Orders.Where(r => r.OrderStatus == (int)OrderStatus.Collected
                                                     ).OrderBy(r => r.CreatedDate).ToList();
            var orderGroups =
                    from order in orders
                    group order by order.ReceiverAddressDistrictId into g
                    select new { ReceiverAddressDistrictId = g.Key, Groups = g };

            //group all
            int maxRequest = 10000000;
            List<List<OrderViewModel>> result = new List<List<OrderViewModel>>();
            foreach (var g in orderGroups)
            {
                List<OrderViewModel> currList = new List<OrderViewModel>();
                int i = 0;
                foreach (var n in g.Groups)
                {
                    i++;
                    currList.Add(new OrderViewModel(n, weightedDeliveryTypeScore, weightedDateScore));

                    //it's equal the maximum request
                    if (i == maxRequest)
                    {
                        result.Add(currList);
                        currList = new List<OrderViewModel>();
                        i = 0;
                    }
                }
                if (currList.Count > 0)
                {
                    result.Add(currList);
                }
            }
            ViewBag.PossibleOrders = result;

            //
            return View();
        }


        public ActionResult EditAutoScheduleDeliveryPlanAJax(string ordersIdLists, int planNumber = 2, int selectedPlan = 0, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {
            string[] strRequestsIds = ordersIdLists.Split(',');
            int[] requestIds = new int[strRequestsIds.Length];
            List<OrderViewModel> orderViewModel = new List<OrderViewModel>();
            List<List<OrderViewModel>> returnList = new List<List<OrderViewModel>>();
            for (int i = 0; i < requestIds.Length; i++)
            {
                requestIds[i] = Int16.Parse(strRequestsIds[i]);
            }

            //planNumber must be greateer than reqestIds
            if (requestIds.Length < planNumber)
            {
                return null;
            }
            else
            {
                var requests = context.Orders.Where(o => requestIds.Contains(o.OrderId));
                var requestsList = requests.ToList();
                List<GeoCoordinate> pointList = new List<GeoCoordinate>();
                foreach (var request in requests)
                {
                    orderViewModel.Add(new OrderViewModel(request, weightedDeliveryTypeScore, weightedDateScore));
                }
                for (int i = 0; i < requests.Count(); i++)
                {
                    pointList.Add(new GeoCoordinate((double)orderViewModel.ElementAt(i).Latitude, (double)orderViewModel.ElementAt(i).Longitude));
                }

                PointCollection pointCollection = new PointCollection();
                for (int i = 0; i < pointList.Count; i++)
                {
                    pointCollection.Add(new Point(i, pointList[i].Latitude, pointList[i].Longitude));
                }

                List<PointCollection> listPointCollection = MTspHelper.DoKMeans(pointCollection, planNumber);
                for (int i = 0; i < listPointCollection.Count; i++)
                {
                    PointCollection cluster = listPointCollection[i];
                    List<OrderViewModel> listItem = new List<OrderViewModel>();
                    for (int j = 0; j < cluster.Count; j++)
                    {
                        listItem.Add(new OrderViewModel(requestsList.ElementAt(cluster.ElementAt(j).Id)));
                    }
                    returnList.Add(listItem);
                }

                ViewBag.NumberOfPlans = planNumber;
                string listRequestsIds = "";
                for (int i = 0; i < requestIds.Length - 1; i++)
                {
                    listRequestsIds += requestIds[i] + ",";
                }
                listRequestsIds += requestIds[requestIds.Length - 1];

                ViewBag.SelectedRequestsIds = listRequestsIds;

                PointCollection pointCluster = listPointCollection[0];

                //Solve mTsp;
                MTspHelper.initialize();
                MTspHelper.solveTsp(pointList, planNumber);
            }

            return Json(new { waypoints = MTspHelper.waypointLists, segments = MTspHelper.segmentsLists, requests = returnList, distanceList = MTspHelper.planDistanceLists, timeList = MTspHelper.planTimeLists });
        }


        public ActionResult EditAutoScheduleDeliveryPlan(string requestsIdsList, int planNumber = 2, int selectedPlan = 0, double weightedDeliveryTypeScore = 0.5, double weightedDateScore = 0.5)
        {
            try
            {
                string[] strRequestsIds = requestsIdsList.Split(',');
                int[] requestIds = new int[strRequestsIds.Length];
                for (int i = 0; i < requestIds.Length; i++)
                {
                    requestIds[i] = Int16.Parse(strRequestsIds[i]);
                }

                //planNumber must be greateer than reqestIds
                if (requestIds.Length < planNumber)
                {
                    return null;
                }
                else
                {
                    //var requests = context.Orders.Where(o => requestIds.Contains(o.OrderId));
                    //var requestsList = requests.ToList();
                    //List<GeoCoordinate> pointList = new List<GeoCoordinate>();
                    //List<OrderViewModel> requestViewModel = new List<OrderViewModel>();
                    //foreach (var request in requests)
                    //{
                    //    requestViewModel.Add(new OrderViewModel(request, weightedDeliveryTypeScore, weightedDateScore));
                    //}
                    //for (int i = 0; i < requests.Count(); i++)
                    //{
                    //    pointList.Add(new GeoCoordinate((double)requestViewModel.ElementAt(i).Latitude, (double)requestViewModel.ElementAt(i).Longitude));
                    //}

                    //PointCollection pointCollection = new PointCollection();
                    //for (int i = 0; i < pointList.Count; i++)
                    //{
                    //    pointCollection.Add(new Point(i, pointList[i].Latitude, pointList[i].Longitude));
                    //}

                    //List<PointCollection> listPointCollection = MTspHelper.DoKMeans(pointCollection, planNumber);

                    //for (int i = 0; i < listPointCollection.Count; i++)
                    //{
                    //    PointCollection cluster = listPointCollection[i];
                    //}

                    ViewBag.NumberOfPlans = planNumber;
                    //string listRequestsIds = "";
                    //for (int i = 0; i < requestIds.Length - 1; i++)
                    //{
                    //    listRequestsIds += requestIds[i] + ",";
                    //}
                    //listRequestsIds += requestIds[requestIds.Length - 1];

                    //ViewBag.SelectedRequestsIds = listRequestsIds;
                    //List<OrderViewModel> returnList = new List<OrderViewModel>();
                    //PointCollection pointCluster = listPointCollection[0];
                    //for (int i = 0; i < pointCluster.Count; i++)
                    //{
                    //    returnList.Add(new OrderViewModel(requestsList.ElementAt(pointCluster.ElementAt(i).Id)));
                    //}

                    ////Solve mTsp;
                    //MTspHelper.initialize();
                    //MTspHelper.solveTsp(pointList, planNumber);

                    //ViewBag.RequestDetails = returnList;

                }

                return View();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult CalculateRouteOfPlan(int id)
        {
            List<GeoCoordinate> segments = new List<GeoCoordinate>();
            List<GeoCoordinate> waypoints = new List<GeoCoordinate>();
            List<List<GeoCoordinate>> segmentsList = new List<List<GeoCoordinate>>();
            List<List<GeoCoordinate>> waypointsList = new List<List<GeoCoordinate>>();
            Plan plans = context.Plans.Single(o => o.PlanId == id);
            string[] segmentLongitudeStrs = plans.SegmentsLongitude.Split(',');
            string[] segmentLatitudeStrs = plans.SegmentsLatitude.Split(',');
            string[] waypointsLatitudeStrs = plans.WaypointsLatitude.Split(',');
            string[] waypointsLongitudeStrs = plans.WaypointsLongitude.Split(',');

            for (int i = 0; i < segmentLatitudeStrs.Length; i++)
            {
                double lon = double.Parse(segmentLongitudeStrs[i]);
                double lat = double.Parse(segmentLatitudeStrs[i]);
                segments.Add(new GeoCoordinate(lat,lon));
            }

            for (int i = 0; i < waypointsLatitudeStrs.Length; i++)
            {
                double lon = double.Parse(waypointsLongitudeStrs[i]);
                double lat = double.Parse(waypointsLatitudeStrs[i]);
                waypoints.Add(new GeoCoordinate(lat,lon));
            }

            segmentsList.Add(segments);
            waypointsList.Add(waypoints);

            //create new 
            return Json(new {segments = segmentsList, waypoints = waypointsList});
        }
		
		public ActionResult ConfirmCreateAutoScheduleDeliveryPlan(List<ListRequestsJsonModel> Entrys)
        {
            string planIds = "";
            bool success = true;
            foreach (var entry in Entrys)
            {
                int[] listRequests = entry.listRequests.ToArray();
                double distance = entry.Distance;
                var plan = new Plan();
                plan.SegmentsLatitude = string.Join(",", entry.SegmentsLatitudeList.ToArray());
                plan.SegmentsLongitude = string.Join(",", entry.SegmentsLongitudeList.ToArray());
                plan.WaypointsLatitude = string.Join(",", entry.WaypointsLatitudeList.ToArray());
                plan.WaypointsLongitude = string.Join(",", entry.WaypointsLongitudeList.ToArray());
                plan.Distance = (Decimal)distance;
                if (_repository.CreateDeliveryPlan(plan, listRequests))
                {
                    planIds += plan.PlanId + ",";
                }
                else
                {
                    success = false;
                    break;
                }
            }

            //remove the "," redundancy
            if (success)
            {
                planIds = planIds.Remove(planIds.Length - 1);
            }

            if (success)
            {
                return Json(new { success = success, url = Url.Action("ViewDetailsDeliveryPlans", "Plans", new { planIds = planIds }) });
            }
            else
            {
                return Json(new { success = success });
            }


        }

        public ActionResult ViewDetailsDeliveryPlans(string planIds)
        {
            string[] planIdsList = planIds.Split(',');
            int[] planIdsNumList = new int[planIdsList.Length];
            for (int i = 0; i < planIdsList.Length; i++)
            {
                planIdsNumList[i] = int.Parse(planIdsList[i]);
            }
            var plans = context.Plans.Where(o => planIdsNumList.Contains(o.PlanId));

            var deliveryStaffs = from d in context.DeliveryMens
                                 select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status };
            var listDelivery = new List<DeliveryMen>();
            foreach (var delivery in deliveryStaffs)
            {
                listDelivery.Add(new DeliveryMen { DeliveryMenId = delivery.DeliveryMenId, FirstName = delivery.FirstName, LastName = delivery.LastName });
            }
            ViewBag.PossibleDeliveryStaffs = listDelivery;

            return View(plans);
        }

        public ActionResult MarkAsFinished(int planId)
        {
            var plan = context.Plans.Single(p => p.PlanId == planId);
            if (plan.PlanTypeId == (int)PlanTypes.CollectionPlan)
            {
                if (_repository.MarkCollectionPlanFinished(plan))
                {
                    return Json(new { success = true });
                }
                else
                {
                    return Json(new { success = false });
                }
            }
            else if (plan.PlanTypeId == (int)PlanTypes.DeliveryPlan)
            {
                return Json(new { success = true });
            }

            return Json(new { success = false });
        }

        //public ActionResult
    }
}

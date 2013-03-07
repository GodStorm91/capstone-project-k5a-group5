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
            return View();
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

                if (_repository.CreateCollectionPlan(collectionPlan , requestIds))
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
        [HttpPost]
        public ActionResult MarkAsFinished(int id, bool removeUnfinishedOrders)
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

                MTspHelper.initialize();
                MTspHelper.solveTsp(pointList, numberOfPlans);

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

        public ViewResult AutoScheduleCollectionPlan()
        {
            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.Where(cp => cp.IsActive).ToArray(), "CityProvinceId", "Name");
            return View();
        }

        public ActionResult Details(int id)
        {
            Plan plans = context.Plans.Single(o=> o.PlanId == id);
            if (plans != null)
            {
                try
                {
                    var deliveryStaffs = from d in context.DeliveryMens
                                         where d.Status == 1
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
                                             where d.Status > 1 && p.PlanId == id
                                             select new { d.DeliveryMenId, d.FirstName, d.LastName, d.Status }).Distinct();
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
    }
}

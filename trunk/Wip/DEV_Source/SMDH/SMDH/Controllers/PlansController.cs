using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models;

namespace SMDH.Controllers
{
    public class PlansController : Controller
    {
        SMDHDataContext context = new SMDHDataContext();
        
        //
        // GET: /Plans/

        public ActionResult Index()
        {
            return View();
        }

        //
        //GET: /CollectionPlans
        public ViewResult ViewCollectionPlans()
        {
            return View();
        }

        //
        //GET: /Plans/ViewDeliveryPlans
        public ViewResult ViewDeliveryPlans()
        {
            return View();
        }

        //
        //GET: /Plans/Create
        public ActionResult Create()
        {
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
                return Json(new { success = true });
            }
            catch (Exception)
            {
                return Json(new { success = false });
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
        public ActionResult GetUnplannedRequestByCityProvince(int id, int[] selectedRequestIds)
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
        /// Get Unplanned Requests by District
        /// </summary>
        /// <param name="id">District Id: int</param>
        /// <param name="selectedRequestIds">selected request : int[]</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUnplannedRequestsByDistrict(int id, int[] selectedRequestIds)
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
        /// Get Unplanned Requests By Ward
        /// </summary>
        /// <param name="id"></param>
        /// <param name="selectedRequestIds"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUnplannedRequestsByWard(int id, int[] selectedRequestIds)
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
        /// Assign delivery men to plan
        /// </summary>
        /// <param name="planId">planId: int</param>
        /// <param name="deliveryMenId">deliveryMenid: int[]</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Assign(int planId, int[] deliveryMenId)
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
        /// Return Selected list requests to autoschedule plans
        /// </summary>
        /// <param name="numberOfRequests">numRequests: int</param>
        /// <parasm name="numberOfPlans">numPlans: int </param>
        /// <param name="weightedDateScore">weightedDateScore: float</param>
        /// <param name="weightedDeliveryTypeScore">weightedDeliveryTypeScore: float</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetSelectedRequests(int numberOfRequests, int numberOfPlans, float weightedDateScore, float weightedDeliveryTypeScore)
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




    }
}

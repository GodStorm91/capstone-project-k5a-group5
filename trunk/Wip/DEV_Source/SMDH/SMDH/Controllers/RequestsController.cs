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
    public class RequestsController : Controller
    {

        private IRequestRepository _repository;

        public RequestsController(IRequestRepository requestRepository)
        {
            _repository = requestRepository;
        }
        //
        // GET: /Requests/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Requests/Details/5
        public ViewResult Details(int id)
        {
            Request request = _repository.Find(id);
            if (request != null)
            {
                return View(request);
            }
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult Create()
        {
            //ViewBag.PossibleCustomers = context.Customers.Where(c => c.IsActive);
            ViewBag.PossibleCollectionAddresses = new SelectList(new List<CustomerAddress>());
            return View();
        }

        [HttpPost]
        public ActionResult ConfirmCreate(int CustomerId, int CollectionAddressId, string Note, HttpPostedFileBase excelFile)
        {
            try
            {
                var request = new Request
                                  {
                                      CustomerId = CustomerId,
                                      CollectionAddressId = CollectionAddressId,
                                      Note = Note
                                  };
                if (_repository.Create(request))
                {
                    if (excelFile != null)
                    {

                    }
                   
                }
                return View("CreateSuccessful");
            }
            catch (Exception)
            {
                return View("CreateUnsuccessful");
                throw;
            }
        }

        public ActionResult AddOrders(int id)
        {
            Request request = _repository.Find(id);
            if (request != null)
            {
                if (request.RequestStatus != (int)RequestStatus.Draft) return RedirectToAction("Index");
                return View(request);
            }
            throw new HttpException(404, "Not found!");
        }

        [HttpPost]
        public ActionResult Submit(int id)
        {
            try
            {
                var request = _repository.Find(id);
                if (_repository.Confirm(request)) return Json(new { success = true, requestId = request.RequestId });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult RemoveFromCollectionPlan(int id)
        {
            try
            {
                var request = _repository.Find(id);
                if (_repository.RemoveFromPlan(request))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult Approve(int id)
        {
            var request = _repository.Find(id);
            if (request.RequestStatus !=(int) RequestStatus.New) return Json(new { success = false });
            if (_repository.Approve(request))
            {
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        [HttpPost]
        public ActionResult Reject(int id)
        {
            try
            {
                var request = _repository.Find(id);
                if (_repository.Reject(request))
                {
                    return Json(new { success = true });
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
                var request = _repository.Find(id);
                if (_repository.Cancel(request))
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

        [HttpPost]
        public ActionResult MarkAsCollected()
        {
            try
            {
                var requestIdStrs = Request["collectedRequest"].Split(',');
                var requestIds = new int[requestIdStrs.Length];
                for (int i = 0; i < requestIdStrs.Length; i++)
                {
                    requestIds[i] = int.Parse(requestIdStrs[i]);
                }
                var requests = _repository.GetRequestsByIds(requestIds).ToList();
                if (_repository.MarkAsCollected(requests))
                {
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
        {
            try
            {
                var request = _repository.Find(id);
                //if (request.CustomerAddress.UpdateLocation(context, latitude, longitude)) return Json(new { success = true });
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }
    }
}

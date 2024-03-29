﻿using System;
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
     [Authorize(Roles = "Office Staff")]
    public class RequestsController : Controller
    {

        private IRequestRepository _repository;

        private SMDHDataContext context = new SMDHDataContext();

        public RequestsController(IRequestRepository requestRepository)
        {
            _repository = requestRepository;
        }
        //
        // GET: /Requests/

        public ActionResult Index()
        {
            var requests = new List<Request>();
            var statuses = new List<int>();
            statuses.Add((int)RequestStatus.New);
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
                                case "draft": statuses.Add((int)RequestStatus.Draft);
                                    break;
                                case "new": statuses.Add((int)RequestStatus.New);
                                    break;
                                case "approved": statuses.Add((int)RequestStatus.Approved);
                                    break;
                                case "planned": statuses.Add((int)RequestStatus.PlannedForCollecting);
                                    break;
                                case "collected": statuses.Add((int)RequestStatus.Collected);
                                    break;
                                case "finished": statuses.Add((int)RequestStatus.Finished);
                                    break;
                                case "canceled": statuses.Add((int)RequestStatus.Canceled);
                                    break;
                                case "repricing": statuses.Add((int)RequestStatus.RePricing);
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
            if (!(request.RequestStatus == (int)RequestStatus.New || request.RequestStatus == (int)RequestStatus.RePricing)) return Json(new { success = false });
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

        public ActionResult ApproveOrders(int id)
        {
            var request = _repository.Find(id);
            if (!(request.RequestStatus == (int)RequestStatus.New || request.RequestStatus == (int)RequestStatus.RePricing)) return RedirectToAction("Index");
            var unapprovedOrders = _repository.ValidOrders(request).Where(o => o.PriceCategories.Count == 0).ToList();
            ViewBag.RequestApprovable = unapprovedOrders.Count == 0 ? true : false;
            ViewBag.TotalFee = request.ValidOrders.Sum(p => p.Fee);
            return View(request);
        }

        public ActionResult ApproveForAcceptPrice(int id)
        {
            try
            {
                var request = context.Requests.Single(r => r.RequestId == id);
                request.RequestStatus = (int)RequestStatus.Pricing;
                request.PricedDate = DateTime.Now;
                foreach (var order in request.Orders)
                {
                    order.Fee = order.PriceCategories.Sum(p => p.PriceTag.Price);
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

        [HttpPost]
        public ActionResult Note(int requestid)
        {
            var request = context.Requests.Single(r => r.RequestId == requestid);
            return View(request);
        }
        [HttpPost]
        public ActionResult SendNote(Request rq)
        {
            try
            {
                var request = context.Requests.Single(r => r.RequestId == rq.RequestId);
                if (ModelState.IsValid)
                {
                    request.Note += "Tiktak: " + rq.Note + "<br/>";
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }

        }
      
    }
}

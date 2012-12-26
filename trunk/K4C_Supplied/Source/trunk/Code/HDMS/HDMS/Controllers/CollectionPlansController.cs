using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;
using HDMS.Models.Utilities;
using System.Transactions;

namespace HDMS.Controllers
{
    public class CollectionPlansController : StaffDefaultController
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /CollectionPlans/

        public ViewResult Index()
        {
            var collectionPlans = new List<CollectionPlan>();
            var statuses = new List<int>();
            statuses.Add((int)CollectionPlanStatus.New);
            statuses.Add((int)CollectionPlanStatus.Assigned);

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
                                case "new": statuses.Add((int)CollectionPlanStatus.New);
                                    break;
                                case "assigned": statuses.Add((int)CollectionPlanStatus.Assigned);
                                    break;
                                case "finished": statuses.Add((int)CollectionPlanStatus.Finished);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }


            collectionPlans = context.CollectionPlans.Where(cp => statuses.Contains(cp.CollectionPlanStatus)).ToList();

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                collectionPlans = collectionPlans.Where(cp => cp.CreatedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                collectionPlans = collectionPlans.Where(cp => cp.CreatedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(collectionPlans);
        }

        //
        // GET: /CollectionPlans/Details/5

        public ViewResult Details(int id)
        {
            CollectionPlan collectionplan = context.CollectionPlans.Find(id);
            if (collectionplan != null)
            {
                try
                {
                    var deliveryStaffUsers = Roles.GetUsersInRole("Delivery Staff");
                    var deliveryStaffs = from m in context.aspnet_Membership
                                         join u in context.aspnet_Users on m.UserId equals u.UserId
                                         join ui in context.UserInfoes on m.UserId equals ui.UserId
                                         where m.IsApproved && deliveryStaffUsers.Contains(u.UserName)
                                         select new { m.UserId, ui.FullName, u.UserName };
                    if (collectionplan.AssignedDeliveryStaffId == null)
                    {
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName");
                    }
                    else
                    {
                        var assignedStaff = (from m in context.aspnet_Membership
                                             join u in context.aspnet_Users on m.UserId equals u.UserId
                                             join ui in context.UserInfoes on m.UserId equals ui.UserId
                                            where m.UserId == collectionplan.AssignedDeliveryStaffId
                                            select new { m.UserId, ui.FullName, u.UserName }
                                            ).FirstOrDefault();
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName",
                                                                        assignedStaff);
                        ViewBag.AssignTo =
                            AccountHelper.GetName(assignedStaff.UserId);
                    }
                    return View(collectionplan);
                }
                catch (Exception e)
                {
                    return View("Error");
                    //throw new HttpException(500, "Error!");
                }
            }

            throw new HttpException(404, "Not found!");
        }

        //
        // GET: /CollectionPlans/Create

        public ActionResult Create()
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
            if (usingMap) return View("CreateUsingMap");
            return View();
        }

        //
        // POST: /CollectionPlans/Create

        [HttpPost]
        public ActionResult ConfirmCreate()
        {
            try
            {
                var collectionPlan = new CollectionPlan();
                var requestIdStrs = Request["selectedRequestIds"].Split(',');
                var requestIds = new int[requestIdStrs.Length];
                for (int i = 0; i < requestIdStrs.Length; i++)
                {
                    requestIds[i] = int.Parse(requestIdStrs[i]);
                }
                if (collectionPlan.Create(context, requestIds))
                {
                    return Json(new { success = true, collectionPlanId = collectionPlan.CollectionPlanId });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        //
        // GET: /CollectionPlans/Edit/5

        //public ActionResult Edit(int id)
        //{
        //    CollectionPlan collectionplan = context.CollectionPlans.Find(id);
        //    return View(collectionplan);
        //}

        //
        // POST: /CollectionPlans/Edit/5

        //[HttpPost]
        //public ActionResult Edit(CollectionPlan collectionplan)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        context.Entry(collectionplan).State = EntityState.Modified;
        //        context.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(collectionplan);
        //}

        //
        // GET: /CollectionPlans/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    CollectionPlan collectionplan = context.CollectionPlans.Find(id);
        //    return View(collectionplan);
        //}

        //
        // POST: /CollectionPlans/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    CollectionPlan collectionplan = context.CollectionPlans.Find(id);
        //    context.CollectionPlans.Remove(collectionplan);
        //    context.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //[HttpPost]
        //public ActionResult CreatePlanWizard()
        //{
        //    switch (Request["step_number"])
        //    {
        //        case "1":
        //            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //            ViewBag.PossibleDistricts = new SelectList(new List<District>());
        //            ViewBag.PossibleWards = new SelectList(new List<Ward>());
        //            return PartialView("WizardSelectRequests");
        //            break;
        //        case "2":
        //            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //            ViewBag.PossibleDistricts = new SelectList(new List<District>());
        //            ViewBag.PossibleWards = new SelectList(new List<Ward>());
        //            return PartialView("WizardSelectRequests"); ;
        //            break;
        //        case "3":
        //            ViewBag.PossibleCityProvinces = new SelectList(context.CityProvinces.ToArray(), "CityProvinceId", "Name");
        //            ViewBag.PossibleDistricts = new SelectList(new List<District>());
        //            ViewBag.PossibleWards = new SelectList(new List<Ward>());
        //            return PartialView("WizardSelectRequests");
        //            break;
        //        default:
        //            break;
        //    }
        //    return null;
        //}

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
                return Json(new {success = false});
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

        [HttpPost]
        public ActionResult Assign(int collectionPlanId, Guid staffUserId)
        {
            try
            {
                var collectionPlan = context.CollectionPlans.Find(collectionPlanId);
                var staff = Membership.GetUser(staffUserId);
                if (!staff.IsApproved) return Json(new { success = false });
                if (collectionPlan != null && staff != null)
                {
                    collectionPlan.AssignedDeliveryStaffId = staffUserId;
                    collectionPlan.UpdateStatus(CollectionPlanStatus.Assigned);
                    context.SaveChanges();
                    return Json(new { success = true, staffName = AccountHelper.GetName(staffUserId) });
                }
                return Json(new { success = false });
            }
            catch (Exception e)
            {
                return Json(new { success = false });
            }
        }

        //[HttpPost]
        //public ActionResult UpdateStatus(int collectionPlanId, int newStatus)
        //{
        //    try
        //    {
        //        var collectionPlan = context.CollectionPlans.Find(collectionPlanId);
        //        collectionPlan.UpdateStatus((CollectionPlanStatus)newStatus);
        //        context.SaveChanges();
        //        return Json(new { success = true });
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(new { success = false });
        //    }
        //}

        //[HttpPost]
        //public ActionResult GetStatusByCheckBox()
        //{
        //    var requests = new List<CollectionPlan>();
        //    if (!string.IsNullOrWhiteSpace(Request["selectedStatusIds"]))
        //    {
        //        var strStatusValue = Request["selectedStatusIds"].Split(',');
        //        var statusValues = new int[strStatusValue.Length];
        //        for (int i = 0; i < strStatusValue.Length; i++)
        //        {
        //            statusValues[i] = int.Parse(strStatusValue[i]);
        //        }
        //        requests = context.CollectionPlans.Where(r => statusValues.Contains(r.CollectionPlanStatus)).ToList();

        //        var startDate = new DateTime();
        //        var endDate = new DateTime();
        //        if (!string.IsNullOrWhiteSpace(Request["startDate"]) && !string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.CollectionPlans.Where(r => statusValues.Contains(r.CollectionPlanStatus) && r.CreatedDate >= startDate && r.CreatedDate <= endDate).ToList();
        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["startDate"]))
        //        {
        //            startDate = DateTime.ParseExact(Request["startDate"], "dd/MM/yyyy", null);
        //            requests = context.CollectionPlans.Where(r => statusValues.Contains(r.CollectionPlanStatus) && r.CreatedDate >= startDate).ToList();

        //        }
        //        else if (!string.IsNullOrWhiteSpace(Request["endDate"]))
        //        {
        //            endDate = DateTime.ParseExact(Request["endDate"], "dd/MM/yyyy", null).AddDays(1);
        //            requests = context.CollectionPlans.Where(r => statusValues.Contains(r.CollectionPlanStatus) && r.CreatedDate <= endDate).ToList();

        //        }
        //    }
        //    return View("CollectionPlansTable", requests);
        //}

        [HttpPost]
        public ActionResult Cancel(int id)
        {
            try
            {
                var collectionPlan = context.CollectionPlans.Find(id);
                if (collectionPlan.Cancel(context))
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
        public ActionResult MarkAsFinished(int id, bool removeUncollectedRequests)
        {
            try
            {
                var collectionPlan = context.CollectionPlans.Find(id);
                if (collectionPlan.MarkAsFinished(context, removeUncollectedRequests))
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
    }
}
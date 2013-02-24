﻿using System;
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
    public class PlansController : StaffDefaultController
    {
         private HDMSEntities context = new HDMSEntities();
        //
        // GET: /Plans/

        public ViewResult Index()
        {
            var plans = new List<Plan>();
            var statuses = new List<int>();
            statuses.Add((int)PlanStatus.New);
            statuses.Add((int)PlanStatus.Assigned);
            statuses.Add((int)PlanStatus.Finished);
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
                                case "new": statuses.Add((int)PlanStatus.New);
                                    break;
                                case "assigned": statuses.Add((int)PlanStatus.Assigned);
                                    break;
                                case "finished": statuses.Add((int)PlanStatus.Finished);
                                    break;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }

            plans = context.Plans.Where(p => statuses.Contains((int)p.Status)).ToList();

            if (!string.IsNullOrWhiteSpace(Request["startDate"]))
            {
                var startDate = DateTime.ParseExact(Request["startDate"], "ddMMyyyy", null);
                plans = plans.Where(cp => cp.CreatedDate >= startDate).ToList();
                ViewBag.StartDate = string.Format("{0:dd/MM/yyyy}", startDate);
            }
            if (!string.IsNullOrWhiteSpace(Request["endDate"]))
            {
                var endDate = DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null).AddDays(1);
                plans = plans.Where(cp => cp.CreatedDate <= endDate).ToList();
                ViewBag.EndDate = string.Format("{0:dd/MM/yyyy}", DateTime.ParseExact(Request["endDate"], "ddMMyyyy", null));
            }

            ViewBag.SelectedStatuses = statuses;

            return View(plans);
        }

        //
        // GET: /Plans/Details/5

        public ActionResult Details(int id)
        {
            Plan plans = context.Plans.Find(id);
            if (plans != null)
            {
                try
                {
                    var deliveryStaffUsers = Roles.GetUsersInRole("Delivery Staff");
                    var deliveryStaffs = from m in context.aspnet_Membership
                                         join u in context.aspnet_Users on m.UserId equals u.UserId
                                         join ui in context.UserInfoes on m.UserId equals ui.UserId
                                         where m.IsApproved && deliveryStaffUsers.Contains(u.UserName)
                                         select new { m.UserId, ui.FullName, u.UserName };
                    if (plans.Status <= 1)
                    {
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName");
                    }
                    else
                    {
                        var assignedStaff = (from m in context.aspnet_Membership
                                             join u in context.aspnet_Users on m.UserId equals u.UserId
                                             join ui in context.UserInfoes on m.UserId equals ui.UserId
                                             //where m.UserId == plans.CreatedByUserId
                                             select new { m.UserId, ui.FullName, u.UserName }
                                            ).FirstOrDefault();
                        ViewBag.PossibleDeliveryStaffs = new SelectList(deliveryStaffs.ToList(), "UserId", "UserName",
                                                                        assignedStaff);
                        ViewBag.AssignTo =
                            AccountHelper.GetName(assignedStaff.UserId);
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

        //
        // GET: /Plans/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Plans/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Plans/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Plans/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Plans/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Plans/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

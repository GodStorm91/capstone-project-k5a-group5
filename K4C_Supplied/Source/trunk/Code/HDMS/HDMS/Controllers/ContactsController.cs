using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Models;

namespace HDMS.Controllers
{
    public class ContactsController : StaffDefaultController
    {
        private HDMSEntities context = new HDMSEntities();

        //
        // GET: /Contacts/

        //public ViewResult Index()
        //{
        //    return View(context.Contacts.Where(c => c.IsActive).ToList());
        //}

        //
        // GET: /Contacts/Details/5

        //public ViewResult Details(int id)
        //{
        //    Contact contact = context.Contacts.Find(id);
        //    return View(contact);
        //}

        //
        // POST: /Contacts/Create

        [HttpPost]
        public ActionResult Create()
        {
            ViewBag.PossibleCustomers = context.Customers.Where(c => c.IsActive);
            var possibleTitles = new List<string>();
            possibleTitles.Add("Mr.");
            possibleTitles.Add("Ms.");
            ViewBag.PossibleTitles = new SelectList(possibleTitles);
            return View();
        } 

        //
        // POST: /Contacts/ConfirmCreate

        [HttpPost]
        public ActionResult ConfirmCreate(Contact contact)
        {
            if (ModelState.IsValid)
            {
                contact.IsActive = true;
                context.Contacts.Add(contact);
                context.SaveChanges();
                return Json(new { success = true });
            }

            return Json(new { success = false });
        }
        
        //
        // POST: /Contacts/Edit/5
 
        [HttpPost]
        public ActionResult Edit(int id)
        {
            Contact contact = context.Contacts.Single(x => x.ContactId == id);
            ViewBag.PossibleCustomers = context.Customers.Where(c => c.IsActive);
            var possibleTitles = new List<string>();
            possibleTitles.Add("Mr.");
            possibleTitles.Add("Ms.");
            ViewBag.PossibleTitles = new SelectList(possibleTitles,contact.Title);
            return View(contact);
        }

        //
        // POST: /Contacts/ConfirmEdit/5

        [HttpPost]
        public ActionResult ConfirmEdit(Contact contact)
        {
            if (ModelState.IsValid)
            {
                context.Entry(contact).State = EntityState.Modified;
                context.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        //
        // GET: /Contacts/Delete/5
 
        public ActionResult Delete(int id)
        {
            Contact contact = context.Contacts.Find(id);
            return View(contact);
        }

        //
        // POST: /Contacts/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Contact contact = context.Contacts.Find(id);
            context.Contacts.Remove(contact);
            context.SaveChanges();
            return Json(new { success = true });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                context.Dispose();
            }
            base.Dispose(disposing);
        }

        //
        // POST: /CustomerAddress/ToggleActivate/5

        //[HttpPost]
        //public ActionResult ToggleActivate(int id)
        //{

        //    Contact contact = context.Contacts.Find(id);
        //    contact.IsActive = !contact.IsActive;
        //    context.SaveChanges();
        //    return Json(new { isActive = contact.IsActive });
        //}

        //[HttpPost]
        //public ActionResult Remove(int id)
        //{
        //    try
        //    {
        //        var contact = context.Contacts.Find(id);
        //        contact.IsActive = false;
        //        context.SaveChanges();
        //        return Json(new { success = true });
        //    }
        //    catch (Exception)
        //    {
        //        return Json(new { success = false });
        //    }
        //}
    }
}
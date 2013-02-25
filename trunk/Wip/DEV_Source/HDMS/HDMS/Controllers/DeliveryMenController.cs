using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using HDMS.Models;
using HDMS.Models.Statuses;

namespace HDMS.Controllers
{
    public class DeliveryMenController : Controller
    {
        //
        // GET: /DeliveryMen/
        private HDMSEntities context = new HDMSEntities();

        public ActionResult Index()
        {
            return View();
        }

        public int GetAvailableDeliveryMen()
        {
            try
            {
                var deliveryMenNumber = context.DeliveryMen.Where(c => c.Status == (int)Models.Statuses.DeliveryMenStatus.Available);
                return deliveryMenNumber.ToArray().Length;
            }
            catch (Exception)
            {
                return -1;
                throw;
            }
        }

    }
}

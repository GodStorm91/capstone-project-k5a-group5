using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Abstract;

namespace SMDH.Controllers
{
    public class OrdersController : Controller
    {
        private IOrderRepository _repository;

        public OrdersController(IOrderRepository orderRepository)
        {
            _repository = orderRepository;
        }
        //
        // GET: /Orders/

        public ActionResult Index()
        {
            return View(_repository.Orders);
        }

        //
        // GET: /Orders/Details/5
        public ViewResult Details(int id)
        {
            
            var order = _repository.Orders.Where(o => o.OrderId == id).ToList();
            
            return View();
        }

        //
        // GET: /Ordres/Create
        public ActionResult Create(int requestId)
        {
            return View();
        }

        /// <summary>
        /// Save Order to DB
        /// </summary>
        /// <returns></returns>
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

        [HttpPost]
        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult ConfirmEdit()
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

        [HttpPost]
        public ActionResult Approve()
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
        public ActionResult Reject(int id)
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
        public ActionResult DisApprove(int id)
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
        public ActionResult UpdateLocation(int id, decimal latitude, decimal longitude)
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
        public ActionResult RemoveFromPlan(int id)
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

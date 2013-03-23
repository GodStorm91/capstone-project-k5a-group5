using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SMDH.Models.Concrete;
using SMDH.Models.Abstract;

namespace SMDH.Controllers
{
    [Authorize]
    public class DeliveryMenController : Controller
    {

        private IDeliveryMenRepository _repository;

        public DeliveryMenController(IDeliveryMenRepository repository)
        {
            _repository = repository;
        }
        //
        // GET: /DeliveryMen/

        public ActionResult Index()
        {
            return View();
        }

        public int GetAvailableDeliveryMen()
        {
            return _repository.GetAvailableDeliveryMen();
        }

    }
}

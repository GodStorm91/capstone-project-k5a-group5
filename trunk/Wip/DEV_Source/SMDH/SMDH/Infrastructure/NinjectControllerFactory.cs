using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ninject;
using System.Web.Mvc;
using System.Web.Routing;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;

namespace SMDH.Infrastructure
{
    public class NinjectControllerFactory : DefaultControllerFactory
    {
        private IKernel ninjectKernel;

        public NinjectControllerFactory()
        {
            ninjectKernel = new StandardKernel();
            AddBindings();
        }

        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            return controllerType == null ? null
                : (IController)ninjectKernel.Get(controllerType);
        }

        private void AddBindings()
        {
            //put additionla bindings here
            ninjectKernel.Bind<IOrderRepository>().To<EFOrdersRepository>();
            ninjectKernel.Bind<IRequestRepository>().To<EFRequestsRepository>();
            ninjectKernel.Bind<ICustomerRepository>().To<EFCustomersRepository>();
            ninjectKernel.Bind<ICityProvinceRepository>().To<EFCityProvincesRepository>();
            ninjectKernel.Bind<IProductRepository>().To<EFProductsRepository>();
        }
    }
}
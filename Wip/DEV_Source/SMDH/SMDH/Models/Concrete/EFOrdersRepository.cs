using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;

namespace SMDH.Models.Concrete
{
    public class EFOrdersRepository : IOrderRepository
    {
        private EFDBbContext context = new EFDBbContext();

        public IQueryable<Order> Orders
        {
            get { return context.Orders; }
        }
    }
}
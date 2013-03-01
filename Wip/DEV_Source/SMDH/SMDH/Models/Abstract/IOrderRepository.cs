using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMDH.Models;

namespace SMDH.Models.Abstract
{
    public interface IOrderRepository
    {
        public IQueryable<Order> Orders { get; set; }
        public Order Find(int orderId);
    }
   
}

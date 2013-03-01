using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMDH.Models;

namespace SMDH.Models.Abstract
{
    public interface IOrderRepository
    {
        IQueryable<Order> Orders { get; set; }
        Order Find(int orderId);
    }
   
}

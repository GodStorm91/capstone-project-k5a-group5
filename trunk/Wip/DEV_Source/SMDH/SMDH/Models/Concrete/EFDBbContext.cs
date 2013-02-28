using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace SMDH.Models.Concrete
{
    public class EFDBbContext : DbContext
    {
        public DbSet<Order> Orders { get; set; }
    }
}
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

        public DbSet<Item> Items { get; set; }

        public DbSet<Request> Requests { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<CityProvince> CityProvinces { get; set; }

        public DbSet<District> Districts { get; set; }

        public DbSet<Ward> Wards { get; set; }

        public DbSet<OrderPaymentType> OrderPaymentTypes { get; set; }

        public DbSet<DeliveryOption> DeliveryOptions { get; set; }

        public DbSet<Cargo> Cargoes { get; set; }

        public DbSet<Plan> Plans { get; set; }        
    }
}
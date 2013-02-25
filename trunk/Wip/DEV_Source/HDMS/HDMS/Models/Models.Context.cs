﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HDMS.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HDMSEntities : DbContext
    {
        public HDMSEntities()
            : base("name=HDMSEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<aspnet_Membership> aspnet_Membership { get; set; }
        public DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public DbSet<aspnet_Users> aspnet_Users { get; set; }
        public DbSet<CityProvince> CityProvinces { get; set; }
        public DbSet<CollectionPlan> CollectionPlans { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerAddress> CustomerAddresses { get; set; }
        public DbSet<DeliveryOption> DeliveryOptions { get; set; }
        public DbSet<DeliveryPlan> DeliveryPlans { get; set; }
        public DbSet<District> Districts { get; set; }
        public DbSet<Hub> Hubs { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderPaymentType> OrderPaymentTypes { get; set; }
        public DbSet<Request> Requests { get; set; }
        public DbSet<UserInfo> UserInfoes { get; set; }
        public DbSet<Ward> Wards { get; set; }
        public DbSet<Plan> Plans { get; set; }
        public DbSet<Cargo> Cargoes { get; set; }
        public DbSet<DeliveryCategory> DeliveryCategories { get; set; }
        public DbSet<DeliveryMenInPlan> DeliveryMenInPlans { get; set; }
        public DbSet<DeliveryType> DeliveryTypes { get; set; }
        public DbSet<HubCategory> HubCategories { get; set; }
        public DbSet<ItemManagement> ItemManagements { get; set; }
        public DbSet<PriceCategory> PriceCategories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<TiktakStaff> TiktakStaffs { get; set; }
        public DbSet<DeliveryMan> DeliveryMen { get; set; }
    }
}

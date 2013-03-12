//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class District
    {
        public District()
        {
            this.CustomerAddresses = new HashSet<CustomerAddress>();
            this.Hubs = new HashSet<Hub>();
            this.Orders = new HashSet<Order>();
            this.Wards = new HashSet<Ward>();
        }
    
        public int DistrictId { get; set; }
        public int CityProvinceId { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public Nullable<int> DisplayOrder { get; set; }
    
        public virtual CityProvince CityProvince { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }
        public virtual ICollection<Hub> Hubs { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Ward> Wards { get; set; }
    }
}
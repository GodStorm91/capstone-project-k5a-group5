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
    
    public partial class Hub
    {
        public int HubId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public Nullable<int> WardId { get; set; }
        public int DistrictId { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public bool IsActive { get; set; }
    
        public virtual District District { get; set; }
        public virtual Ward Ward { get; set; }
    }
}

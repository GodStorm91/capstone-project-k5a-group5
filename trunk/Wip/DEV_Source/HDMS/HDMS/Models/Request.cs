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
    
    public partial class Request
    {
        public Request()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int RequestId { get; set; }
        public System.Guid CreatedByUserId { get; set; }
        public int CustomerId { get; set; }
        public int CollectionAddressId { get; set; }
        public Nullable<System.DateTime> RequestedDate { get; set; }
        public Nullable<int> CollectionPlanId { get; set; }
        public int RequestStatus { get; set; }
        public string Note { get; set; }
    
        public virtual CollectionPlan CollectionPlan { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual CustomerAddress CustomerAddress { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}

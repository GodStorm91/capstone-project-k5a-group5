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
    
    public partial class Plan
    {
        public Plan()
        {
            this.Cargoes = new HashSet<Cargo>();
            this.DeliveryMenInPlans = new HashSet<DeliveryMenInPlan>();
        }
    
        public int PlanId { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public int CreatedByUserId { get; set; }
        public Nullable<System.DateTime> FinishedDate { get; set; }
        public string Note { get; set; }
        public Nullable<int> StaffId { get; set; }
        public int PlanTypeId { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual ICollection<Cargo> Cargoes { get; set; }
        public virtual TiktakStaff TiktakStaff { get; set; }
        public virtual ICollection<DeliveryMenInPlan> DeliveryMenInPlans { get; set; }
    }
}
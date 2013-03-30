using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models;
using SMDH.Models.Statuses;

namespace SMDH.Models.Concrete
{
    public class EFDeliveryMenRepository: IDeliveryMenRepository
    {
        private SMDHDataContext context = new SMDHDataContext();
        public int GetAvailableDeliveryMen()
        {
            return context.DeliveryMens.Where(o => o.Status == (int)DeliveryMenStatus.Available).Count();
        }


        public bool AssignDeliveryMenToPlan(int planId, List<int> deliveryMenIds)
        {
            var Plan = context.Plans.Single(o => o.PlanId == planId);

            if (Plan != null)
            {
                foreach (var man in deliveryMenIds)
                {
                    var deliveryman = context.DeliveryMens.Single(d => d.DeliveryMenId == man);
                    var deliverymaninplan = new DeliveryMenInPlan();
                    deliveryman.Status = (int)DeliveryMenStatus.Busy;
                    deliverymaninplan.DeliveryMenId = man;
                    deliverymaninplan.PlanId = Plan.PlanId;
                    deliverymaninplan.AssignedDate = DateTime.Now;
                    context.DeliveryMenInPlans.InsertOnSubmit(deliverymaninplan);
                }
                if (context.DeliveryMenInPlans.Where(o => o.PlanId == planId).Count() >= 0)
                {
                    Plan.Status = (int)PlanStatus.Assigned;
                }
                context.SubmitChanges();
                return true;
            }

            return false;            
            
        }


        public bool RemoveDeliveryMenFromPlan(int planId, List<int> deliveryMenIds)
        {
             var Plan = context.Plans.Single(o => o.PlanId == planId);

             if (Plan != null)
             {
                 foreach (var man in deliveryMenIds)
                 {
                     var deliveryman = context.DeliveryMens.Single(d => d.DeliveryMenId == man);
                     deliveryman.Status = (int)DeliveryMenStatus.Available;
                     var  deliveryMenInPlan = context.DeliveryMenInPlans.Where(o => o.DeliveryMenId == deliveryman.DeliveryMenId &&
                                                                            o.PlanId == planId);
                     if (deliveryMenInPlan != null)
                     {
                         context.DeliveryMenInPlans.DeleteAllOnSubmit(deliveryMenInPlan);
                     }                     
                 }
                 context.SubmitChanges();
                 return true;
             }

             return false;
        }

        public bool AssignDeliveryMenToPlan(int planId, List<int> assignedDeliveryMen, List<int> unassignedDeliveryMen)
        {
            if (assignedDeliveryMen != null)
            {
                AssignDeliveryMenToPlan(planId, assignedDeliveryMen);                
            }

            if (unassignedDeliveryMen != null)
            {
                RemoveDeliveryMenFromPlan(planId, unassignedDeliveryMen);
            }

            Plan plan = context.Plans.Single(o => o.PlanId == planId);

            if (context.DeliveryMenInPlans.Where(o => o.PlanId == planId).Count() >= 0)
            {
                plan.Status = (int)PlanStatus.Assigned;                
            }

            if (context.DeliveryMenInPlans.Where(o => o.PlanId == planId).Count() == 0)
            {
                plan.Status = (int)PlanStatus.New;
            }

            plan.CreatedDate = DateTime.Now;

            context.SubmitChanges();

            return true;
        
        }
    }
}
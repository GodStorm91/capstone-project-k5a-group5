using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;
using System.Transactions;

namespace SMDH.Models.Concrete
{
    public class EFPlansRepository : IPlanRepository
    {

        private SMDHDataContext context = new SMDHDataContext();

        public void UpdateStatus(Plan plan, int status)
        {
            throw new NotImplementedException();
        }

        public bool Create(int[] orderIds)
        {
            throw new NotImplementedException();
        }

        public void CalculateRoute(Plan plan)
        {
            throw new NotImplementedException();
        }

        public void CalculateRoute(Plan plan, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool Cancel(Plan plan)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsFinished(Plan plan, bool removeUnfinishedOrders)
        {
            throw new NotImplementedException();
        }

        public List<Plan> GetDeliveryPlansByStatuses(List<int> statuses)
        {
            return context.Plans.Where(dp => statuses.Contains((int)dp.Status) &&
                dp.PlanTypeId == (int)CargoTypes.DeliveryPlan).ToList();
        }

        public List<Plan> GetCollectionPlansByStatuses(List<int> statuses)
        {
            return context.Plans.Where(dp => statuses.Contains((int)dp.Status) && 
                dp.PlanTypeId == (int)CargoTypes.CollectionPlan).ToList();
        }


        public bool CreateCollectionPlan(Plan plan, int[] requestIds)
        {            
            plan.CreatedDate = DateTime.Now;
            plan.Status = (int)CollectionPlanStatus.New;
            plan.CreatedByUserId = 1;
            plan.PlanTypeId = (int)PlanTypes.CollectionPlan;
            var requestRepo = new EFRequestsRepository();
            using (var trans = new TransactionScope())
            {
                context.Plans.InsertOnSubmit(plan);
                context.SubmitChanges();
                var requests = context.Requests.Where(r => requestIds.Contains(r.RequestId)
                                                        && r.RequestStatus == (int)RequestStatus.Approved).ToList();

                if (requests.Count == requestIds.Length && requestRepo.AddToPlan(plan, requests))
                {
                    trans.Complete();
                    return true;

                }
            }

            return false;
        }
		
		public bool CreateDeliveryPlan(Plan plan, int[] orderIds)
        {            
            plan.CreatedDate = DateTime.Now;
            plan.Status = (int)CollectionPlanStatus.New;//Which status goes here ?
            plan.CreatedByUserId = 1;
            plan.PlanTypeId = (int)PlanTypes.DeliverPlan;
            var orderRepo = new EFOrderRepository();
            using (var trans = new TransactionScope())
            {
                context.Plans.InsertOnSubmit(plan);
                context.SubmitChanges();
                var orders = context.Orders.Where(r => orderIds.Contains(r.OrderId)
                                                        && r.OrderStatus == (int)OrderStatus.Collected).ToList(); // Only Order status that is collected can be add to Delivery Plan

                if (orders.Count == orderIds.Length && orderRepo.AddToPlan(plan, orders))
                {
                    trans.Complete();
                    return true;

                }
            }

            return false;
        }
    }
}
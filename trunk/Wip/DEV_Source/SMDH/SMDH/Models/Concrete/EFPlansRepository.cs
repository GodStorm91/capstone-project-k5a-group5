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
            try
            {
                if (plan.PlanTypeId == (int)PlanTypes.CollectionPlan)
                {
                    if (plan.Status == (int)Statuses.CollectionPlanStatus.Finished || plan.Status == (int)Statuses.CollectionPlanStatus.Canceled) return false;
                    List<int> requestIds = new List<int>();
                    foreach (var cargo in plan.Cargos)
                    {
                        requestIds.Add(cargo.RequestId.Value);
                    }

                    var requestsTmp = context.Requests.Where(r => requestIds.Contains(r.RequestId));

                    if (requestsTmp.Any(r => r.RequestStatus != (int)RequestStatus.PlannedForCollecting)) return false;

                    var requests = requestsTmp.ToArray() ;
                    EFRequestsRepository requestsRepo = new EFRequestsRepository();
                    for (int i = 0; i < requests.Length; i++)
                    {
                        requestsRepo.RemoveFromPlan(requests[i]);
                    }
                    using (var myContext = new SMDHDataContext())
                    {
                        var myPlan = myContext.Plans.Single(p => p.PlanId == plan.PlanId);
                        myPlan.Status = (int)Statuses.CollectionPlanStatus.Canceled;
                        myPlan.CreatedDate = DateTime.Now;
                        myContext.SubmitChanges();
                    }
                    
                    return true;
                }

                if (plan.PlanTypeId == (int)PlanTypes.DeliveryPlan)
                {
                    return true;
                }

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }         
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
            plan.PlanTypeId = (int)PlanTypes.DeliveryPlan;
            var orderRepo = new EFOrdersRepository();
            using (var trans = new TransactionScope())
            {
                using (var myContext = new SMDHDataContext())
                {
                    myContext.Plans.InsertOnSubmit(plan);
                    myContext.SubmitChanges();
                    var orders = context.Orders.Where(r => orderIds.Contains(r.OrderId)
                                                            && r.OrderStatus == (int)OrderStatus.Collected).ToList(); // Only Order status that is collected can be add to Delivery Plan

                    if (orders.Count == orderIds.Length && orderRepo.AddToPlan(plan, orders))
                    {
                        trans.Complete();
                        return true;

                    }
                }
                
            }

            return false;
        }

        public bool MarkCollectionPlanFinished(Plan plan)
        {
            try
            {
                using (var myContext = new SMDHDataContext())
                {
                    plan = myContext.Plans.Single(p => p.PlanId == plan.PlanId);
                    if (plan.Status != (int)Statuses.DeliveryPlanStatus.Assigned) return false;
                    foreach (var cargo in plan.Cargos)
                    {
                        var request = cargo.Request;
                        foreach (var order in request.Orders)
                        {
                            order.OrderStatus = (int)OrderStatus.Collected;
                        }

                        request.RequestStatus = (int)RequestStatus.Finished;
                    }
                    plan.Status = (int)PlanStatus.Finished;
                    myContext.SubmitChanges();
                    return true;
                }                
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMDH.Models.Abstract;
using SMDH.Models.Statuses;
using SMDH.Models;

namespace SMDH.Models.Concrete
{
    public class EFRequestsRepository: IRequestRepository
    {
        private SMDHDataContext context = new SMDHDataContext();        

        public IQueryable<Request> Requests
        {
            get
            {
                return context.Requests;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public List<Order> ValidOrders(Request request)
        {
            var validOrderStatuses = new List<int>();

            switch (request.RequestStatus)
            {
                case (int)Statuses.RequestStatus.Draft:
                        validOrderStatuses.Add((int)OrderStatus.Draft);
                        validOrderStatuses.Add((int)OrderStatus.New);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                    case (int)Statuses.RequestStatus.New:
                        validOrderStatuses.Add((int)OrderStatus.New);
                        validOrderStatuses.Add((int)OrderStatus.Requested);
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                    case (int)Statuses.RequestStatus.Approved:
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        break;
                    case (int)Statuses.RequestStatus.PlannedForCollecting:
                        validOrderStatuses.Add((int)OrderStatus.PlannedForCollecting);
                        break;
                    case (int)Statuses.RequestStatus.Collected:
                        validOrderStatuses.Add((int)OrderStatus.Collected);
                        validOrderStatuses.Add((int)OrderStatus.PlannedForDelivering);
                        validOrderStatuses.Add((int)OrderStatus.Delivered);
                        validOrderStatuses.Add((int)OrderStatus.ToBeReturned);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                    case (int)Statuses.RequestStatus.Finished:
                        validOrderStatuses.Add((int)OrderStatus.Delivered);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                    case (int)Statuses.RequestStatus.Canceled:
                        validOrderStatuses.Add((int)OrderStatus.Canceled);
                        validOrderStatuses.Add((int)OrderStatus.ToBeReturned);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                    case (int)Statuses.RequestStatus.RePricing:
                        validOrderStatuses.Add((int)OrderStatus.New);
                        validOrderStatuses.Add((int)OrderStatus.Requested);
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
            }
            return request.Orders.Where(o => validOrderStatuses.Contains(o.OrderStatus)).ToList(); ;
        }

        public bool AddToPlan(Plan plan, List<Request> requests)
        {
            return AddToPlan(plan, requests, true);
        }

        public bool AddToPlan(Plan plan, List<Request> requests, bool commit)
        {            
            try
            {
                foreach (var request in requests)
                {
                    if (!AddToPlan(plan, request, false)) return false;
                }

                if (commit) context.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                string message = e.Message;
                return false;
                throw;
            }
        }

        public bool RemoveFromPlan(Plan plan, List<Request> requests)
        {
            throw new NotImplementedException();
        }

        public bool RemoveFromPlan(Plan plan, List<Request> requests, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool Create(Request request)
        {
            try
            {
                request.RequestStatus = (int)RequestStatus.Draft;
                //request.CreatedByUserId =
                context.Requests.InsertOnSubmit(request);
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool CreateWithStatusNew(Request request)
        {
            try
            {
                request.RequestStatus = (int)RequestStatus.New;
                //request.CreatedByUserId =
                context.Requests.InsertOnSubmit(request);
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Confirm(Request request)
        {
            try
            {
                using (var myContext = new SMDHDataContext())
                {
                    request = myContext.Requests.Single(rq => rq.RequestId == request.RequestId);
                    if (request.RequestStatus != (int)RequestStatus.Draft) return false;
                    var validOrders = ValidOrders(request);
                    foreach (var validOrder in validOrders.Where(o => o.OrderStatus == (int)OrderStatus.Draft || o.OrderStatus == (int)OrderStatus.New))
                    {
                        validOrder.OrderStatus = (int)OrderStatus.Requested;
                    }

                    request.RequestStatus = (int)RequestStatus.New;
                    request.RequestedDate = DateTime.Now;
                    myContext.SubmitChanges();
                    return true;
                }              

            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Approve(Request request)
        {
            try
            {
                if (!(request.RequestStatus == (int)RequestStatus.New ||request.RequestStatus == (int)RequestStatus.RePricing)) return false;
                var validOrders = ValidOrders(request);
                if (validOrders.Where(o => o.OrderStatus != (int)OrderStatus.Approved).Count() > 0) return false;
                request.RequestStatus = (int)RequestStatus.Pricing;
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Reject(Request request)
        {
            try
            {
                if (request.RequestStatus != (int)RequestStatus.New) return false;
                BackToDraft(request);
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Cancel(Request request)
        {
            return Cancel(request, true);
        }

        public bool Cancel(Request request, bool commit)
        {
            try
            {
                if (request.RequestStatus == (int)RequestStatus.Finished ||
                    request.RequestStatus == (int)RequestStatus.Canceled) return false;
                if (request.Orders.Any( o => o.OrderStatus == (int)OrderStatus.Delivered)) return false;
                EFOrdersRepository orderRepo = new EFOrdersRepository();                
                foreach (var validOrder in ValidOrders(request))
                {
                    orderRepo.Cancel(validOrder,false);   
                }
                request.RequestStatus = (int)RequestStatus.Canceled;
                if (commit) context.SubmitChanges();
                return true;

            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool CustomerCancel(Request request)
        {
            return CustomerCancel(request, true);
        }

        public bool CustomerCancel(Request request, bool commit)
        {
            try
            {
                if (request.RequestStatus == (int)RequestStatus.Draft || request.RequestStatus == (int)RequestStatus.Pricing)
                {
                    return Delete(request, commit);
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool MarkAsCollected(Request request, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsCollected(Request request)
        {
            throw new NotImplementedException();
        }

        public bool Delete(Request request)
        {
            return Delete(request, true);
        }

        public bool Delete(Request request, bool commit)
        {
            try
            {
                var orderRepo = new EFOrdersRepository();
                if (!(request.RequestStatus == (int)RequestStatus.Draft || request.RequestStatus == (int)RequestStatus.Pricing)) return false;
                var ordersArray = request.Orders.ToArray();
                for (var i = 0; i < ordersArray.Length; i++)
                {
                    //if (!orderRepo.Delete(ordersArray[i], false)) return false;
                    ordersArray[i].OrderStatus = (int)OrderStatus.New;
                }

                context.Requests.DeleteOnSubmit(request);
                if (commit) context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool BackToDraft(Request request, bool commit)
        {
            try
            {
                EFOrdersRepository orderRepo = new EFOrdersRepository();
                if (request.RequestStatus != (int)RequestStatus.New) return false;
                foreach (var validOrder in ValidOrders(request))
                {
                    orderRepo.BackToDraft(validOrder, false);
                }
                request.RequestedDate = null;
                request.RequestStatus = (int)RequestStatus.Draft;
                if (commit) context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool BackToDraft(Request request)
        {
            return BackToDraft(request, true);
        }


        public bool AddToPlan(Plan plan, Request request)
        {
            return AddToPlan(plan, request, true);
        }

        public bool AddToPlan(Plan plan, Request request, bool commit)
        {
            try
            {
                if (request.RequestStatus != (int)RequestStatus.Approved) return false;
                Cargo cargo = new Cargo();
                cargo.RequestId = request.RequestId;
                cargo.PlanId = plan.PlanId;
                cargo.CargoType = (int)CargoTypes.CollectionPlan;
                context.Cargos.InsertOnSubmit(cargo);

                foreach (var validOrder in request.ValidOrders)
                {
                    Order orderInDb = new Order();
                    orderInDb = context.Orders.Single(o => o.OrderId == validOrder.OrderId);
                    orderInDb.OrderStatus = (int)OrderStatus.PlannedForCollecting;
                }

                Request requestInDb = context.Requests.Single(r => r.RequestId == request.RequestId);
                requestInDb.RequestStatus = (int)RequestStatus.PlannedForCollecting;

                if (commit) context.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                string message = e.Message;
                return false;
                throw;
            }
        }


        public bool RemoveFromPlan(Plan plan, Request request, bool commit)
        {
            try
            {
                if (request.RequestStatus != (int)RequestStatus.PlannedForCollecting) return false;
                foreach (var order in ValidOrders(request))
                {
                    order.OrderStatus = (int)OrderStatus.Approved;
                }
                request.RequestStatus = (int)RequestStatus.Approved;
                var cargoes = context.Cargos.Where(p => p.RequestId == request.RequestId
                    && p.PlanId == plan.PlanId);
                foreach (var cargo in cargoes)
                {
                    context.Cargos.DeleteOnSubmit(cargo);
                }

                if (commit) context.SubmitChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool RemoveFromPlan(Plan plan, Request request)
        {
            return RemoveFromPlan(plan, request, true);
        }


        public Request Find(int id)
        {
            return context.Requests.Single(o=> o.RequestId == id);
        }

        public bool RemoveFromPlan(Request request, bool commit)
        {
            try
            {
                if (request.RequestStatus != (int)RequestStatus.PlannedForCollecting) return false;
                foreach (var order in ValidOrders(request))
                {
                    order.OrderStatus = (int)OrderStatus.Approved;
                }
                request.RequestStatus = (int)RequestStatus.Approved;
 
                var cargoes = context.Cargos.Where(p => p.RequestId == request.RequestId);
                foreach (var cargo in cargoes)
                {
                    //KhanhNVH Remove -- won't remove from cargo. start
                    //context.Cargos.DeleteOnSubmit(cargo);
                    //KhanhNHV Remove end
                }

                if (commit) context.SubmitChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool RemoveFromPlan(Request request)
        {
            return RemoveFromPlan(request, true);
        }

        public IQueryable<Request> GetRequestsByIds(int[] requestIds)
        {
            return context.Requests.Where(r => requestIds.Contains(r.RequestId));
        }


        public bool MarkAsCollected(List<Request> request, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsCollected(List<Request> request)
        {
            throw new NotImplementedException();
        }

        public List<Request> GetRequestsByStatuses(List<int> statuses)
        {
            return context.Requests.Where(o => statuses.Contains(o.RequestStatus)).ToList();
        }
    }
}

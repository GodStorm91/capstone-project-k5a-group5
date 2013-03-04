﻿using System;
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
        private EFDbContext context = new EFDbContext();        

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
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                    case (int)Statuses.RequestStatus.New:
                        validOrderStatuses.Add((int)OrderStatus.New);
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

                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
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
                context.Requests.Add(request);
                context.SaveChanges();
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
                if (request.RequestStatus != (int)RequestStatus.Draft) return false;
                var validOrders = ValidOrders(request);
                foreach (var validOrder in validOrders.Where(o => o.OrderStatus == (int)OrderStatus.Draft))
                {
                    validOrder.OrderStatus = (int)OrderStatus.New;
                }

                request.RequestStatus = (int)RequestStatus.New;
                request.RequestedDate = DateTime.Now;
                context.SaveChanges();
                return true;

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
                if (request.RequestStatus != (int)RequestStatus.New) return false;
                var validOrders = ValidOrders(request);
                if (validOrders.Where(o => o.OrderStatus != (int)OrderStatus.Approved).Count() > 0) return false;
                request.RequestStatus = (int)RequestStatus.Approved;
                context.SaveChanges();
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
                context.SaveChanges();
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
                if (commit) context.SaveChanges();
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
                if (request.RequestStatus != (int)RequestStatus.Draft) return false;
                return Delete(request, commit);
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
                if (request.RequestStatus != (int)RequestStatus.Draft) return false;
                var ordersArray = request.Orders.ToArray();
                for (var i = 0; i < ordersArray.Length; i++)
                {
                    if (!orderRepo.Delete(ordersArray[i], false)) return false;
                }

                context.Requests.Remove(request);
                if (commit) context.SaveChanges();
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
                if (commit) context.SaveChanges();
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
                context.Cargoes.Add(cargo);

                foreach (var validOrder in ValidOrders(request))
                {
                    validOrder.OrderStatus = (int)OrderStatus.PlannedForCollecting;
                }

                request.RequestStatus = (int)RequestStatus.PlannedForCollecting;

                if (commit) context.SaveChanges();

                return true;
            }
            catch (Exception)
            {
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
                var cargoes = context.Cargoes.Where(p => p.RequestId == request.RequestId
                    && p.PlanId == plan.PlanId);
                foreach (var cargo in cargoes)
                {
                    context.Cargoes.Remove(cargo);
                }

                if (commit) context.SaveChanges();

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
            return context.Requests.Find(id);
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
 
                var cargoes = context.Cargoes.Where(p => p.RequestId == request.RequestId);
                foreach (var cargo in cargoes)
                {
                    context.Cargoes.Remove(cargo);
                }

                if (commit) context.SaveChanges();

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
    }
}

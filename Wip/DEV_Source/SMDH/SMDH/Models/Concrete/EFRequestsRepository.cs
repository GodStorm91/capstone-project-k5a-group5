using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMDH.Models.Abstract;
using SMDH.Models;

namespace SMDH.Models.Concrete
{
    public class EFRequestsRepository: IRequestRepository
    {
        private EFDBbContext context = new EFDBbContext();

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

        public List<Order> ValidOrders
        {
            get
            {
                return null;
            }
        }

        public bool AddToPlan(Plan plan, List<Request> requests, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool AddToPlan(Plan plan, List<Request> requests)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public bool Confirm(Request request)
        {
            throw new NotImplementedException();
        }

        public bool Approve(Request request)
        {
            throw new NotImplementedException();
        }

        public bool Reject(Request request)
        {
            throw new NotImplementedException();
        }

        public bool Cancel(Request request)
        {
            throw new NotImplementedException();
        }

        public bool Cancel(Request request, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool CustomerCancel(Request request)
        {
            throw new NotImplementedException();
        }

        public bool CustomerCancel(Request request, bool commit)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public bool Delete(Request request, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool BackToDraft(Request request, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool BackToDraft(Request request)
        {
            throw new NotImplementedException();
        }
    }
}

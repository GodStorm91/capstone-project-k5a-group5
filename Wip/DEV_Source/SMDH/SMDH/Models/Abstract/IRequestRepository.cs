using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface IRequestRepository
    {        
        IQueryable<Request> Requests { get; set; }
        List<Order> ValidOrders(Request request);
        IQueryable<Request> GetRequestsByIds(int[] requestIds);

        Request Find(int id);
         bool AddToPlan(Plan plan, List<Request> requests, bool commit);
         bool AddToPlan(Plan plan, List<Request> requests);
         bool RemoveFromPlan(Plan plan, List<Request> requests);
         bool RemoveFromPlan(Plan plan, List<Request> requests, bool commit);
         bool RemoveFromPlan(Plan plan, Request request, bool commit);
         bool RemoveFromPlan(Plan plan, Request request);
         bool RemoveFromPlan(Request request);
         bool RemoveFromPlan(Request request, bool commit);
         bool Create(Request request);
         bool Confirm(Request request);
         bool Approve(Request request);
         bool Reject(Request request);
         bool Cancel(Request request);
         bool Cancel(Request request, bool commit);
         bool CustomerCancel(Request request);
         bool CustomerCancel(Request request, bool commit);
         bool MarkAsCollected(Request request, bool commit);
         bool MarkAsCollected(Request request);
        bool MarkAsCollected(List<Request> request, bool commit);
         bool MarkAsCollected(List<Request> request);
         bool Delete(Request request);
         bool Delete(Request request , bool commit);
         bool BackToDraft(Request request, bool commit);
         bool BackToDraft(Request request);
         bool AddToPlan(Plan plan, Request request);
         bool AddToPlan(Plan plan, Request request, bool commit);
         List<Request> GetRequestsByStatuses(List<int> statuses);
    }
}

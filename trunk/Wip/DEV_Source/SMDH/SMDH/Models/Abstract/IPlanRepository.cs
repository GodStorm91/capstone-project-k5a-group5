using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface IPlanRepository
    {
        void UpdateStatus(Plan plan, int status);    

        bool Create(int[] orderIds);

        bool CreateCollectionPlan(Plan plan, int[] requestIds);
        
        void CalculateRoute(Plan plan);      

        void CalculateRoute(Plan plan, bool commit);        

        bool Cancel(Plan plan);        

        bool MarkAsFinished(Plan plan, bool removeUnfinishedOrders);

        List<Plan> GetDeliveryPlansByStatuses(List<int> statuses);

        List<Plan> GetCollectionPlansByStatuses(List<int> statuses);

        bool CreateDeliveryPlan(Plan plan, int[] orderIds);
      
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface IDeliveryMenRepository
    {
        int GetAvailableDeliveryMen();

        bool AssignDeliveryMenToPlan(int planId, List<int> deliveryMenIds);

        bool RemoveDeliveryMenFromPlan(int planId, List<int> deliveryMenIds);
    }
}

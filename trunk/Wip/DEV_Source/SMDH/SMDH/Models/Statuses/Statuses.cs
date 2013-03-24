using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.Statuses
{
    public enum RequestStatus
    {
        Draft = 0,
        New = 1,//using
        Approved = 2,//using
        PlannedForCollecting = 4,
        Collected = 6,//using
        Pricing = 7,//using
        Finished = 8,
        Canceled = 10//using
    }

    public enum OrderStatus
    {
        Draft = 0,
        New = 1,
        Approved = 2,
        Rejected = 5,
        Canceled = 3,
        PlannedForCollecting = 4,
        Collected = 6,
        ToBeReturned = 7,
        PlannedForDelivering = 8,
        Delivering = 9, // at hub
        Delivered = 11, //at hub
        Returned = 12,
        WaitingForReturn = 13, //at hub
        DeliveringToHub = 14, // at hub
        Expired = 15
    }

    public enum CollectionPlanStatus
    {
        New = 1,
        Assigned = 2,
        Canceled = 3,
        Finished = 4
    }

    public enum PlanStatus
    {
        New = 1,
        Assigned = 2,
        Canceled = 3,
        Finished = 4
    }

    public enum DeliveryPlanStatus
    {
        New = 1,
        Assigned = 2,
        Canceled = 3,
        Finished = 4
    }

    public enum DeliveryMenStatus
    {
        Available = 1,
        Busy = 2,
        Offwork = 3,
        InActive = 4
    }

    public enum HubStatus
    {
        SendingToHub = 14,
        InHub = 9,
        Delivered =11,
        Expired = 15,
        WaitingForReturn = 13,
        Return = 12
    }

    //public enum ItemStatus
    //{
    //    New = 1,
    //    Verified = 2,
    //    Canceled = 3,
    //    PlannedForCollecting = 4,
    //    //Collecting = 5,
    //    Collected = 6,
    //    ToBeReturned = 7,
    //    PlannedForDelivering = 8,
    //    //Delivering = 9,
    //    //Postponed = 10,
    //    Delivered = 11,
    //    Returned = 12,
    //    //Finished = 13
    //}
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HDMS.Models.Statuses
{
    public enum RequestStatus
    {
        Draft = 0,
        New = 1,
        Approved = 2,
        //Planning = 3,
        PlannedForCollecting = 4,
        //Collecting = 5,
        Collected = 6,
        //Delivering = 7,
        Finished = 8,
        //Finished = 9,
        Canceled = 10
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
        //Delivering = 9,
        //Postponed = 10,
        Delivered = 11,
        Returned = 12,
        //Finished = 13
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
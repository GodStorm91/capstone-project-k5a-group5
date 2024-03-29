﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMDH.Models;
using SMDH.Models.ViewModels;

namespace SMDH.Models.Abstract
{
    public interface IOrderRepository
    {
        IQueryable<Order> Orders { get;}
        IQueryable<CityProvince> CityProvinces { get; }
        IQueryable<District> Districts { get; }
        IQueryable<Ward> Wards { get; }
        IQueryable<DeliveryOption> DeliveryOptions { get; }
        IQueryable<OrderPaymentType> OrderPaymentTypes { get; }
        IQueryable<Request> Requests { get; }

        bool AddToRequest(Request request, Order order);
        Order Find(int orderId);
        Request FindRequestById(int? requestId);
        List<ItemViewModel> GetItemsInOrder(int orderId);
        Order ConfirmEdit(Order order);
         bool Cancel(Order order);
         bool Cancel(Order order, bool commit);
         bool Approve(Order order);
         bool Reject(Order order);
         bool CustomerCancel(Order order);
         bool CustomerCancel(Order order, bool commit);
         bool MarkAsCollected(Order order);
         bool MarkAsCollected(Order order, bool commit);
         bool MarkAsReturned(Order order);
         bool MarkAsDelivered(Order order);
         bool MarkAsDelivered(Order order, bool commit);
         bool MarkOrderAsFinished(Order order);
         bool MarkAsReturnedReducePrice(Order order);
         bool AddToPlan(Plan plan, Order order, bool commit);
         bool AddToPlan(Plan plan, Order order);
         bool RemoveFromPlan(Plan plan, Order order);
         bool RemoveFromPlan(Plan plan, Order order, bool commit);
         bool UpdateLocation(Order order, decimal latitude, decimal longitude);
         bool BackToDraft(Order order);
         bool BackToDraft(Order order, bool commit);
         bool DisApprove(Order order);
         bool ConfirmAdd(Order order);
         bool ChangeOrderStatus(Order order);
         bool MarkAsWaitingForReturn(Order order);
         List<Order> GetOrdersByStatuses(List<int> statuses);

        //Plan
         Plan FindPlan(Order order);


    }
   
}

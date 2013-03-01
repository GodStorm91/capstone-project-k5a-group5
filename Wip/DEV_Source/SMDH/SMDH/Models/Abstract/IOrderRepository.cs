using System;
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
        Request FindRequestById(int requestId);
        List<ItemViewModel> GetItemsInOrder(int orderId);
        Order ConfirmEdit(Order order);
         bool Cancel(Order order);
         bool Cancel(Order order, bool commit);

    }
   
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;

namespace SMDH.Models.Concrete
{
    public class EFOrdersRepository : IOrderRepository
    {
        private EFDBbContext context = new EFDBbContext();

        public IQueryable<Order> Orders
        {
            get { return context.Orders; }
        }

        public IQueryable<CityProvince> CityProvinces
        {
            get { return context.CityProvinces; }
        }

        public IQueryable<District> Districts
        {
            get { return context.Districts; }
        }

        public IQueryable<Ward> Wards
        {
            get { return context.Wards; }
        }

        public IQueryable<OrderPaymentType> OrderPaymentTypes
        {
            get { return context.OrderPaymentTypes; }
        }

        public IQueryable<DeliveryOption> DeliveryOptions
        {
            get { return context.DeliveryOptions; }
        }

        public Order Find(int id)
        {
            return context.Orders.Find(id);
        }        

        /// <summary>
        /// Get Items in Order
        /// </summary>
        /// <param name="orderId">orderId: int</param>
        /// <returns></returns>
        public List<ItemViewModel> GetItemsInOrder(int orderId)
        {
            var items = context.Items.Where(o => o.OrderId == orderId);
            List<ItemViewModel> resultList = new List<ItemViewModel>();

            //Create the models by looping all items in list
            foreach(Item item in items)
            {                
                var itemDetails = new ItemViewModel
                {
                    ItemId = item.ItemId,
                    OrderId = item.OrderId,
                    Name = context.Products.Find(item.ProductId).Name,
                    Quantity = item.Quantity,
                    IsFragile = item.IsFragile,
                    HasHighValue = item.HasHighValue,
                    Note = item.Note
                };
                resultList.Add(itemDetails);
            }

            return resultList;
        }

        public bool AddToRequest(Request request, Order order)
        {
            try
            {
                context.Orders.Add(order);
                request.Orders.Add(order);
                order.OrderStatus = (int)RequestStatus.Draft;
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public Order ConfirmEdit(Order order)
        {            
            order.OrderStatus = (int)OrderStatus.Draft;
            context.Entry(order).State = System.Data.EntityState.Modified;
            context.SaveChanges();
            var myContext = new EFDBbContext();
            order = myContext.Orders.Find(order.OrderId);

            return order;

        }

        public bool Cancel(Order order)
        {
            return Cancel(order, true);
        }

        public bool Cancel(Order order, bool commit)
        {
            try
            {
                if (order.OrderStatus == (int)OrderStatus.Returned ||
                    order.OrderStatus == (int)OrderStatus.Delivered ||
                    order.OrderStatus == (int)OrderStatus.ToBeReturned ||
                    order.OrderStatus == (int)OrderStatus.Canceled)
                {
                    return false;
                }

                if (order.Request.RequestStatus == (int)RequestStatus.Draft)
                    return Delete(order, commit);
                if (order.OrderStatus == (int)OrderStatus.New ||
                    order.OrderStatus == (int)OrderStatus.Approved ||
                    order.OrderStatus == (int)OrderStatus.PlannedForCollecting)
                {
                    order.OrderStatus = (int)OrderStatus.Canceled;
                    //if (Request.ValidOrders.Count == 0) Request.Cancel(context, false);
                }
                else
                {
                    order.OrderStatus = (int)OrderStatus.ToBeReturned;
                }

                if (commit)
                {
                    context.SaveChanges();
                }

                return true;

            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }        

        public bool Delete(Order order)
        {
            return Delete(order, true);
        }

        public bool Delete(Order order, bool commit)
        {
            try
            {
                if (order.Request.RequestStatus != (int)RequestStatus.Draft) return false;
                var itemsArray = order.Items.ToArray();
                for (var i = 0; i < itemsArray.Length; i++)
                {
                    context.Items.Remove(itemsArray[i]);
                }
                context.Orders.Remove(order);
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public IQueryable<Request> Requests
        {
            get { throw new NotImplementedException(); }
        }

        public Request FindRequestById(int requestId)
        {
            throw new NotImplementedException();
        }
    }

}
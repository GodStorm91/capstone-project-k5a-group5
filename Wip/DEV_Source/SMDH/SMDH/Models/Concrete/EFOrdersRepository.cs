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
        private SMDHDataContext context = new SMDHDataContext();

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
            return context.Orders.Single(o => o.OrderId == id);
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
            foreach (Item item in items)
            {
                var itemDetails = new ItemViewModel
                {
                    ItemId = item.ItemId,
                    OrderId = item.OrderId,
                    Name = context.Products.Single(o => o.ProductId == item.ProductId).Name,
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
                 order.RequestId = request.RequestId;
                 context.Orders.InsertOnSubmit(order);
                 //request.Orders.Add(order);                    
                 order.OrderStatus = (int)RequestStatus.Draft;
                 context.SubmitChanges();
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
            context.SubmitChanges();
            var myContext = new EFDbContext();
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
                    context.SubmitChanges();
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
                if (!(order.Request.RequestStatus == (int)RequestStatus.Draft || order.Request.RequestStatus == (int)RequestStatus.Pricing)) return false;
                var itemsArray = order.Items.ToArray();
                for (var i = 0; i < itemsArray.Length; i++)
                {
                    context.Items.DeleteOnSubmit(itemsArray[i]);
                }
                var myOrder = context.Orders.Single(o => o.OrderId == order.OrderId);
                context.Orders.DeleteOnSubmit(myOrder);
                if (commit) context.SubmitChanges();
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
            get { return context.Requests; }
        }

        public Request FindRequestById(int? requestId)
        {
            return context.Requests.Single(o => o.RequestId == requestId);
        }


        public bool Approve(Order order)
        {
            try
            {
                if (order.OrderStatus != (int)OrderStatus.New) return false;  
                //check condition if exist pricecategory for this order
                if (order.PriceCategories.Count == 0) return false;
                order.Fee = (int)order.PriceCategories.Sum(r => r.Price);
                order.OrderStatus = (int)OrderStatus.Approved;
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool Reject(Order order)
        {
            try
            {
                if (order.OrderStatus != (int)OrderStatus.New) return false;
                order.OrderStatus = (int)OrderStatus.Rejected;
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool DisApprove(Order order)
        {
            try
            {
                if (order.OrderStatus != (int)OrderStatus.Approved) return false;
                order.DueDate = null;
                order.DueDate = null;
                order.OrderStatus = (int)OrderStatus.New;
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool CustomerCancel(Order order)
        {
            return CustomerCancel(order, true);
        }

        public bool CustomerCancel(Order order, bool commit)
        {
            try
            {
                if (order.OrderStatus == (int)OrderStatus.Draft ||
                    order.OrderStatus == (int)OrderStatus.New)
                    
                {
                    return Delete(order, commit);
                }

                return false;
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool MarkAsCollected(Order order)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsReturned(Order order)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsDelivered(Order order)
        {
            try
            {
                var myOrder = context.Orders.Single(o => o.OrderId == order.OrderId);
                myOrder.OrderStatus = (int)OrderStatus.Delivered;
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }

        public bool MarkAsDelivered(Order order, bool commit)
        {
            throw new NotImplementedException();
        }

        public bool AddToPlan(Plan plan, Order order, bool commit)
        {
            try
            {
				
                Cargo cargo = new Cargo();
                cargo.Plan = plan;
                cargo.PlanId = plan.PlanId;
                cargo.OrderId = order.OrderId;
                context.Cargos.InsertOnSubmit(cargo);
				
				if (commit)
				{
					context.SubmitChanges();
				}
                
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool AddToPlan(Plan plan, Order order)
        {
            return AddToPlan(plan, order, true);
        }

        public bool UpdateLocation(Order order, decimal latitude, decimal longitude)
        {
            throw new NotImplementedException();
        }

        public bool BackToDraft(Order order)
        {
            throw new NotImplementedException();
        }

        public bool BackToDraft(Order order, bool commit)
        {
            throw new NotImplementedException();
        }


        public bool MarkAsCollected(Order order, bool commit)
        {
            throw new NotImplementedException();
        }


        public Plan FindPlan(Order order)
        {
            var cargoes = context.Cargos.Where(o => o.OrderId == order.OrderId);
            Plan plan = null;
            foreach (Cargo cargo in cargoes)
            {
                plan = context.Plans.Single(o => o.PlanId == cargo.PlanId);

                //Only return when plan status is New
                if (plan.Status == (int)PlanStatus.New)
                    break;
            }

            if (plan.Status == (int)PlanStatus.New)
            {
                return plan;
            }
            else
            {
                return null;
            }
        }


        public bool RemoveFromPlan(Plan plan, Order order)
        {
            return RemoveFromPlan(plan, order, true);
        }

        public bool RemoveFromPlan(Plan plan, Order order, bool commit)
        {
            try
            {
                var cargoes = context.Cargos.Where(p => p.PlanId == plan.PlanId &&
                p.OrderId == order.OrderId);

                var myOrder = context.Orders.Single(o => o.OrderId == order.OrderId);
                foreach (Cargo cargo in cargoes)
                {
                    //plan.Cargos.Remove(cargo);
                }

                myOrder.OrderStatus = (int)OrderStatus.Collected;
                if (commit) context.SubmitChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }


        public List<Order> GetOrdersByStatuses(List<int> statuses)
        {
            return context.Orders.Where(o => statuses.Contains(o.OrderStatus) && o.RequestId != null).ToList();
        }

        public bool ConfirmSave(Order order)
        {
            return false;
        }

        public bool ConfirmAdd(Order order)
        {
            try
            {
                context.Orders.InsertOnSubmit(order);
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }


        }
		
		public bool AddToPlan(Plan plan, List<Order> orders)
        {
            return AddToPlan(plan, orders, true);
        }

        public bool AddToPlan(Plan plan, List<Order> orders, bool commit)
        {            
            try
            {
                foreach (var order in orders)
                {
                    if (!AddToPlan(plan, order, false)) return false;
                }

                if (commit) context.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                string message = e.Message;
                return false;
                throw;
            }
        }

        public bool MarkOrderAsFinished(Order order)
        {
            try
            {
                if (order.DeliveryTypeId == (int)DeliveryTypeId.Buffer)
                {
                    order.OrderStatus = (int)OrderStatus.Delivering;
                }
                else
                {
                    order.OrderStatus = (int)OrderStatus.Delivered;
                }

                context.SubmitChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
    }

}
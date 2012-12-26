

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using HDMS.Models.Statuses;
using HDMS.Models.Utilities;
using System.Linq;

namespace HDMS.Models
{
    [MetadataType(typeof(OrderMetadata))]
    public partial class Order
    {
        public OrderStatus Status
        {
            get
            {
                return (OrderStatus)OrderStatus;
            }
            set { this.OrderStatus = (int)value; }
        }

        public string FullAddress
        {
            get { return AddressHelper.GetFullAddress(this); }
        }

        public bool AddToRequest(HDMSEntities context, Request request)
        {
            try
            {
                GoogleMapsHelper.UpdateMapLocation(context,this,false);
                context.Orders.Add(this);
                request.Orders.Add(this);
                Status = Statuses.OrderStatus.Draft;
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Approve(HDMSEntities context, DateTime dueDate, int fee)
        {
            try
            {
                if (Status != Statuses.OrderStatus.New) return false;
                DueDate = dueDate;
                Fee = fee;
                Status = Statuses.OrderStatus.Approved;
                context.SaveChanges();
                //try
                //{
                //    if(Latitude != null && Longitude != null)
                //    {
                //        DistanceHelper.CalculateDistanceFrom(this);
                //    }
                //}
                //catch (Exception e)
                //{
                    
                //}
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Reject(HDMSEntities context)
        {
            try
            {
                if (Status != Statuses.OrderStatus.New) return false;
                Status = Statuses.OrderStatus.Rejected;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Disapprove(HDMSEntities context)
        {
            try
            {
                if (Status != Statuses.OrderStatus.Approved || Request.Status != RequestStatus.New) return false;
                DueDate = null;
                Fee = null;
                Status = Statuses.OrderStatus.New;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Cancel(HDMSEntities context)
        {
            return Cancel(context, true);
        }

        public bool Cancel(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status == Statuses.OrderStatus.Returned || Status == Statuses.OrderStatus.Delivered
                    || Status == Statuses.OrderStatus.ToBeReturned || Status == Statuses.OrderStatus.Canceled)
                {
                    return false;
                }
                if (Request.Status == RequestStatus.Draft) return Delete(context,commit);
                if (Status == Statuses.OrderStatus.New || 
                    Status == Statuses.OrderStatus.Approved ||
                    Status == Statuses.OrderStatus.PlannedForCollecting)
                {
                    Status = Statuses.OrderStatus.Canceled;
                    if (Request.ValidOrders.Count == 0) Request.Cancel(context, false);
                }
                else
                {
                    Status = Statuses.OrderStatus.ToBeReturned;
                }

                if (commit)
                {
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool CustomerCancel(HDMSEntities context)
        {
            return CustomerCancel(context, true);
        }

        public bool CustomerCancel(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.Draft && Status != Statuses.OrderStatus.Rejected)
                {
                    return false;
                }
                return Delete(context,commit);
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool MarkAsCollected(HDMSEntities context)
        {
            return MarkAsCollected(context, true);
        }

        public bool MarkAsCollected(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.PlannedForCollecting) return false;
                Status = Statuses.OrderStatus.Collected;
                if(Request.ValidOrders.All(o => o.OrderStatus != (int)Statuses.OrderStatus.PlannedForCollecting))
                {
                    Request.Status = RequestStatus.Collected;
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
            }
        }

        public static bool MarkAsDelivered(HDMSEntities context, List<Order> orders)
        {
            foreach (var order in orders)
            {
                if (!order.MarkAsDelivered(context, false)) return false;
            }
            context.SaveChanges();
            return true;
        }
        
        public bool MarkAsDelivered(HDMSEntities context)
        {
            return MarkAsDelivered(context, true);
        }

        public bool MarkAsDelivered(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.PlannedForDelivering) return false;
                Status = Statuses.OrderStatus.Delivered;
                if (Request.ValidOrders.All(o => o.OrderStatus != (int)Statuses.OrderStatus.PlannedForDelivering))
                {
                    Request.Status = RequestStatus.Finished;
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
            }
        }

        public bool MarkAsReturned(HDMSEntities context)
        {
            try
            {
                if (Status != Statuses.OrderStatus.ToBeReturned) return false;
                Status = Statuses.OrderStatus.Returned;
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool AddToDeliveryPlan(HDMSEntities context, DeliveryPlan deliveryPlan)
        {
            return AddToDeliveryPlan(context, deliveryPlan, true);
        }

        public bool AddToDeliveryPlan(HDMSEntities context, DeliveryPlan deliveryPlan, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.Collected) return false;
                deliveryPlan.Orders.Add(this);
                Status = Statuses.OrderStatus.PlannedForDelivering;
                if(commit) context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Delete(HDMSEntities context)
        {
            return Delete(context, true);
        }

        public bool Delete(HDMSEntities context, bool commit)
        {
            try
            {
                if (Request.Status != RequestStatus.Draft) return false;
                var itemsArray = Items.ToArray();
                for (var i = 0; i < itemsArray.Length; i++)
                {
                    itemsArray[i].Delete(context,false);
                }
                context.Orders.Remove(this);
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool AddToDeliveryPlan(HDMSEntities context, DeliveryPlan deliveryPlan, List<Order> orders)
        {
            return AddToDeliveryPlan(context, deliveryPlan, orders, true);
        }

        public static bool AddToDeliveryPlan(HDMSEntities context, DeliveryPlan deliveryPlan, List<Order> orders, bool commit)
        {
            try
            {
                foreach (var order in orders)
                {
                    if (!order.AddToDeliveryPlan(context, deliveryPlan, false)) return false;
                }
                if(commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool RemoveFromDeliveryPlan(HDMSEntities context, List<Order> orders)
        {
            try
            {
                foreach (var order in orders)
                {
                    if (!order.RemoveFromDeliveryPlan(context, false)) return false;
                }
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
                throw;
            }
        }

        public bool RemoveFromDeliveryPlan(HDMSEntities context)
        {
            return RemoveFromDeliveryPlan(context, true);
        }

        public bool RemoveFromDeliveryPlan(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.PlannedForDelivering) return false;
                Status = Statuses.OrderStatus.Collected;
                DeliveryPlan.Orders.Remove(this);
                DeliveryPlan.DeliveryOrder = null;
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool UpdateLocation(HDMSEntities context,  decimal latitude, decimal longitude)
        {
            try
            {
                Latitude = latitude;
                Longitude = longitude;
                context.SaveChanges();
                //try
                //{
                //    if (Latitude != null && Longitude != null)
                //    {
                //        DistanceHelper.CalculateDistanceFrom(this);
                //    }
                //}
                //catch (Exception e)
                //{

                //}
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool BackToDraft(HDMSEntities context)
        {
            return BackToDraft(context, true);
        }

        public bool BackToDraft(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.OrderStatus.New && Status != Statuses.OrderStatus.Approved) return false;
                DueDate = null;
                Fee = null;
                if (Status != Statuses.OrderStatus.Rejected) Status = Statuses.OrderStatus.Draft;
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public partial class OrderMetadata
    {

        [DisplayName("Order Id")]
        [Required]
        public int OrderId { get; set; }

        [DisplayName("Request Id")]
        [Required]
        public int RequestId { get; set; }

        [DisplayName("Delivery Option Id")]
        [Required(ErrorMessage = "The Delivery Option is required.")]
        public int DeliveryOptionId { get; set; }

        [DisplayName("Order Payment Type Id")]
        [Required(ErrorMessage = "The Payent Type is required.")]
        public int OrderPaymentTypeId { get; set; }

        [DisplayName("Delivery Plan Id")]
        public Nullable<int> DeliveryPlanId { get; set; }

        [DisplayName("Due Date")]
        public Nullable<System.DateTime> DueDate { get; set; }

        [DisplayName("Collected Date")]
        public Nullable<System.DateTime> CollectedDate { get; set; }

        [DisplayName("Delivery Date")]
        public Nullable<System.DateTime> DeliveryDate { get; set; }

        [DisplayName("Receiver Name")]
        [MaxLength(255)]
        public string ReceiverName { get; set; }

        [DisplayName("Receiver Phone")]
        [Required(ErrorMessage = "The Receiver Phone Number is required.")]
        [MaxLength(255)]
        public string ReceiverPhone { get; set; }

        [DisplayName("Receiver Address")]
        [Required(ErrorMessage = "The Address is required.")]
        [MaxLength(255)]
        public string ReceiverAddress { get; set; }

        [DisplayName("Receiver Address Ward Id")]
        public Nullable<int> ReceiverAddressWardId { get; set; }

        [DisplayName("Receiver Address District Id")]
        [Required(ErrorMessage = "The District is required.")]
        public int ReceiverAddressDistrictId { get; set; }

        [DisplayName("Fee")]
        public int Fee { get; set; }

        [DisplayName("Amount To Be Collected From Receiver")]
        [Required(ErrorMessage = "The Amount is required.")]
        public int AmountToBeCollectedFromReceiver { get; set; }

        [DisplayName("Order Status")]
        [Required]
        public int OrderStatus { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }


        [DisplayName("Delivery Option")]
        public virtual DeliveryOption DeliveryOption { get; set; }

        [DisplayName("Delivery Plan")]
        public virtual DeliveryPlan DeliveryPlan { get; set; }

        [DisplayName("District")]
        public virtual District District { get; set; }

        [DisplayName("Items")]
        public virtual ICollection<Item> Items { get; set; }

        [DisplayName("Request")]
        public virtual Request Request { get; set; }

        [DisplayName("Ward")]
        public virtual Ward Ward { get; set; }

        [DisplayName("Order Payment Type")]
        public virtual OrderPaymentType OrderPaymentType { get; set; }
    }
}


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Transactions;
using System.Web.Security;
using HDMS.Models.Statuses;
using System.Linq;
using HDMS.Models.Utilities;
using HDMS.Models.Tsp;

namespace HDMS.Models
{
    [MetadataType(typeof(DeliveryPlanMetadata))]
    public partial class DeliveryPlan
    {
        public DeliveryPlanStatus Status
        {
            get
            {
                return (DeliveryPlanStatus)this.DeliveryPlanStatus;
            }
            set { this.DeliveryPlanStatus = (int)value; }
        }

        public UserInfo CreatedByUserInfo
        {
            get
            {
                var context = new HDMSEntities();
                return context.UserInfoes.Find(CreatedByUserId);
            }
        }

        public UserInfo AssignedUserInfo
        {
            get
            {
                var context = new HDMSEntities();
                return context.UserInfoes.Find(AssignedDeliveryStaffId);
            }
        }

        public MembershipUser CreatedByUser
        {
            get
            {
                return Membership.GetUser(CreatedByUserId);
            }
        }

        public MembershipUser AssignedUser
        {
            get
            {
                return Membership.GetUser(AssignedDeliveryStaffId);
            }
        }

        public void UpdateStatus(DeliveryPlanStatus status)
        {
            Status = status;
        }

        public bool Create(HDMSEntities context, int[] orderIds)
        {
            try
            {
                CreatedByUserId = (Guid)Membership.GetUser().ProviderUserKey;
                CreatedDate = DateTime.Now;
                UpdateStatus(Statuses.DeliveryPlanStatus.New);
                using (var trans = new TransactionScope())
                {
                    context.DeliveryPlans.Add(this);

                    var orders = context.Orders.Where(o => orderIds.Contains(o.OrderId)
                                                               && o.OrderStatus == (int)OrderStatus.Collected).ToList();
                    if (orders.Count == orderIds.Length && Order.AddToDeliveryPlan(context, this, orders, false))
                    {
                        context.SaveChanges();
                        CalculateRoute(context, false);
                        context.SaveChanges();
                        trans.Complete();
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public void CalculateRoute(HDMSEntities context)
        {
            CalculateRoute(context, true);
        }

        public void CalculateRoute(HDMSEntities context, bool commit)
        {
            var hub = context.Hubs.Find(1);
            var distances = DistanceHelper.CalculateDistance(hub, Orders.ToArray());
            CalculateOrderList(context, distances, false);
            if(commit) context.SaveChanges();
        }

        public bool Cancel(HDMSEntities context)
        {
            try
            {
                if (Status == Statuses.DeliveryPlanStatus.Finished || Status == Statuses.DeliveryPlanStatus.Canceled) return false;
                if (Orders.Any(o => o.Status != OrderStatus.PlannedForDelivering)) return false;
                var orders = Orders.ToArray();
                for (int i = 0; i < orders.Length; i++)
                {
                    orders[i].RemoveFromDeliveryPlan(context, false);
                }
                Status = Statuses.DeliveryPlanStatus.Canceled;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool MarkAsFinished(HDMSEntities context, bool removeUnfinishedOrders)
        {
            try
            {
                if (Status != Statuses.DeliveryPlanStatus.Assigned) return false;
                if (!removeUnfinishedOrders && Orders.Any(r => r.OrderStatus == (int)OrderStatus.PlannedForDelivering))
                {
                    return false;
                }
                var unFinishedOrders = Orders.Where(r => r.Status == OrderStatus.PlannedForDelivering).ToArray();
                for (int i = 0; i < unFinishedOrders.Length; i++)
                {
                    unFinishedOrders[i].RemoveFromDeliveryPlan(context, false);
                }
                Status = Statuses.DeliveryPlanStatus.Finished;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        private void CalculateOrderList(HDMSEntities context, List<Distance> distances, bool commit)
        {
            var orders = Orders.ToList();
            var cities = new Tsp.Cities();
            var hub = context.Hubs.Find(1);

            cities.Add(new City(hub.HubId));
            foreach (var order in orders)
            {
                var city = new Tsp.City(order.OrderId);
                cities.Add(city);
            }
            cities.CalculateCityDistances(distances);
            var tsp = new Tsp.Tsp();
            var orderedIdList = tsp.Begin(cities);
            DeliveryOrder = string.Join(",", orderedIdList);
            if (Orders.Count == 1) DeliveryOrder = Orders.FirstOrDefault().OrderId.ToString();
            if (commit) context.SaveChanges();
        }
    }

    public partial class DeliveryPlanMetadata
    {

        [DisplayName("Delivery Plan Id")]
        [Required]
        public int DeliveryPlanId { get; set; }

        [DisplayName("Created Date")]
        [Required]
        public System.DateTime CreatedDate { get; set; }

        [DisplayName("Created By User Id")]
        [Required]
        public System.Guid CreatedByUserId { get; set; }

        [DisplayName("Assigned Delivery Staff Id")]
        public Nullable<System.Guid> AssignedDeliveryStaffId { get; set; }

        [DisplayName("Finished Date")]
        public Nullable<System.DateTime> FinishedDate { get; set; }

        [DisplayName("Delivery Status")]
        [Required]
        public int DeliveryPlanStatus { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }
        
        [DisplayName("Orders")]
        public virtual ICollection<Order> Orders { get; set; }

        public string DeliveryOrder { get; set; }
    }
}


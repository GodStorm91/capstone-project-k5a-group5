

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Security;
using HDMS.Models.Statuses;
using HDMS.Models.Utilities;

namespace HDMS.Models
{
    [MetadataType(typeof(RequestMetadata))]
    public partial class Request
    {
        public RequestStatus Status
        {
            get
            {
                return (RequestStatus)RequestStatus;
            }
            set { this.RequestStatus = (int)value; }
        }

        public string CollectionAddress
        {
            get { return AddressHelper.GetFullAddress(this.CustomerAddress); }
        }

        public int TotalFee
        {
            get
            {
                return ValidOrders.Where(order => order.Fee != null).Sum(order => (int)order.Fee);
            }
        }

        public int TotalAmountToBeCollected
        {
            get
            {
                return Orders.Where(order => order.AmountToBeCollectedFromReceiver != null).Sum(order => (int)order.AmountToBeCollectedFromReceiver);
            }
        }

        public int NumberOfItems
        {
            get
            {
                return ValidOrders.Sum(order => order.Items.Count);
            }
        }

        public List<Order> ValidOrders
        {
            get
            {
                var validOrderStatuses = new List<int>();
                switch (Status)
                {
                    case Statuses.RequestStatus.Draft:
                        validOrderStatuses.Add((int)OrderStatus.Draft);
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                    case Statuses.RequestStatus.New:
                        validOrderStatuses.Add((int)OrderStatus.New);
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                    case Statuses.RequestStatus.Approved:
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        break;
                    case Statuses.RequestStatus.PlannedForCollecting:
                        validOrderStatuses.Add((int)OrderStatus.PlannedForCollecting);
                        break;
                    case Statuses.RequestStatus.Collected:
                        validOrderStatuses.Add((int)OrderStatus.Collected);
                        validOrderStatuses.Add((int)OrderStatus.PlannedForDelivering);
                        validOrderStatuses.Add((int)OrderStatus.Delivered);
                        validOrderStatuses.Add((int)OrderStatus.ToBeReturned);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                    case Statuses.RequestStatus.Finished:
                        validOrderStatuses.Add((int)OrderStatus.Delivered);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                    case Statuses.RequestStatus.Canceled:
                        validOrderStatuses.Add((int)OrderStatus.Canceled);
                        validOrderStatuses.Add((int)OrderStatus.ToBeReturned);
                        validOrderStatuses.Add((int)OrderStatus.Returned);
                        break;
                }
                return Orders.Where(o => validOrderStatuses.Contains(o.OrderStatus)).ToList();
            }
        }

        public static bool AddToCollectionPlan(HDMSEntities context, CollectionPlan collectionPlan, List<Request> requests)
        {
            return AddToCollectionPlan(context, collectionPlan, requests, true);
        }

        public static bool AddToCollectionPlan(HDMSEntities context, CollectionPlan collectionPlan, List<Request> requests, bool commit)
        {
            try
            {
                foreach (var request in requests)
                {
                    if (!request.AddToCollectionPlan(context, collectionPlan, false)) return false;
                }
                if(commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool AddToCollectionPlan(HDMSEntities context, CollectionPlan collectionPlan)
        {
            return AddToCollectionPlan(context, collectionPlan, true);
        }

        public bool AddToCollectionPlan(HDMSEntities context, CollectionPlan collectionPlan, bool commit)
        {
            try
            {
                if (Status != Statuses.RequestStatus.Approved) return false;
                collectionPlan.Requests.Add(this);
                foreach (var validOrder in ValidOrders)
                {
                    validOrder.Status = OrderStatus.PlannedForCollecting;
                }
                Status = Statuses.RequestStatus.PlannedForCollecting;
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

        public static bool RemoveFromCollectionPlan(HDMSEntities context, List<Request> requests)
        {
            try
            {
                foreach (var request in requests)
                {
                    if (!request.RemoveFromCollectionPlan(context, false)) return false;
                }
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool RemoveFromCollectionPlan(HDMSEntities context)
        {
            return RemoveFromCollectionPlan(context, true);
        }

        public bool RemoveFromCollectionPlan(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.RequestStatus.PlannedForCollecting) return false;
                foreach (var order in ValidOrders)
                {
                    order.Status = OrderStatus.Approved;
                }
                Status = Statuses.RequestStatus.Approved;
                CollectionPlan.Requests.Remove(this);
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Create(HDMSEntities context)
        {
            try
            {
                Status = Statuses.RequestStatus.Draft;
                CreatedByUserId = (Guid)Membership.GetUser().ProviderUserKey;
                context.Requests.Add(this);
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Confirm(HDMSEntities context)
        {
            try
            {
                if (Status != Statuses.RequestStatus.Draft) return false;
                foreach (var validOrder in ValidOrders.Where(o => o.OrderStatus == (int)OrderStatus.Draft))
                {
                    validOrder.Status = OrderStatus.New;
                }
                Status = Statuses.RequestStatus.New;
                RequestedDate = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Approve(HDMSEntities context)
        {
            try
            {
                if (Status != Statuses.RequestStatus.New) return false;
                if (ValidOrders.Where(o => o.OrderStatus != (int)OrderStatus.Approved).Count() > 0) return false;
                Status = Statuses.RequestStatus.Approved;
                context.SaveChanges();
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
                if (Status != Statuses.RequestStatus.New) return false;
                BackToDraft(context);
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
                if (Status == Statuses.RequestStatus.Finished || Status == Statuses.RequestStatus.Canceled) return false;
                if (Orders.Any(o => o.OrderStatus == (int)OrderStatus.Delivered)) return false;
                if (Status == Statuses.RequestStatus.Draft) return Delete(context,commit);
                foreach (var validOrder in ValidOrders)
                {
                    validOrder.Cancel(context, false);
                }
                Status = Statuses.RequestStatus.Canceled;
                if(commit) context.SaveChanges();
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
                if (Status != Statuses.RequestStatus.Draft) return false;
                return Delete(context,commit);
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool MarkAsCollected(HDMSEntities context, List<Request> requests)
        {
            foreach (var request in requests)
            {
                if (!request.MarkAsCollected(context, false)) return false;
            }
            context.SaveChanges();
            return true;
        }

        public bool MarkAsCollected(HDMSEntities context)
        {
            return MarkAsCollected(context, true);
        }

        public bool MarkAsCollected(HDMSEntities context, bool commit)
        {
            try
            {
                if (Status != Statuses.RequestStatus.PlannedForCollecting) return false;
                foreach (var validOrder in ValidOrders)
                {
                    validOrder.Status = OrderStatus.Collected;
                }
                Status = Statuses.RequestStatus.Collected;
                if(commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
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
                if (Status != Statuses.RequestStatus.Draft) return false;
                var ordersArray = Orders.ToArray();
                for (var i = 0; i < ordersArray.Length; i++)
                {
                    if (!ordersArray[i].Delete(context, false)) return false;
                }
                context.Requests.Remove(this);
                if (commit) context.SaveChanges();
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
                if (Status != Statuses.RequestStatus.New) return false;
                foreach (var validOrder in ValidOrders)
                {
                    validOrder.BackToDraft(context, false);
                }
                RequestedDate = null;
                Status = Statuses.RequestStatus.Draft;
                if (commit) context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public partial class RequestMetadata
    {

        [DisplayName("Request Id")]
        [Required]
        public int RequestId { get; set; }

        [DisplayName("Customer Id")]
        [Required(ErrorMessage = "The Customer is required.")]
        public int CustomerId { get; set; }

        [DisplayName("Collection Address Id")]
        [Required(ErrorMessage = "The Collection Address is required.")]
        public int CollectionAddressId { get; set; }

        [DisplayName("Requested Date")]
        public Nullable<System.DateTime> RequestedDate { get; set; }

        [DisplayName("Collection Plan Id")]
        public Nullable<int> CollectionPlanId { get; set; }

        [DisplayName("Request Status")]
        [Required]
        public int RequestStatus { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }

        [DisplayName("Collection Plan")]
        public virtual CollectionPlan CollectionPlan { get; set; }

        [DisplayName("Customer")]
        public virtual Customer Customer { get; set; }

        [DisplayName("Customer Address")]
        public virtual CustomerAddress CustomerAddress { get; set; }

        [DisplayName("Orders")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}


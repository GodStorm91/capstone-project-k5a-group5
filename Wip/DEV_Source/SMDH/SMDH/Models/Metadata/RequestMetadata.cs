using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Security;
using SMDH.Models.Statuses;

namespace SMDH.Models
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
            set
            {
                this.RequestStatus = (int)value;
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
                    case Statuses.RequestStatus.RePricing:
                        validOrderStatuses.Add((int)OrderStatus.New);
                        validOrderStatuses.Add((int)OrderStatus.Requested);
                        validOrderStatuses.Add((int)OrderStatus.Approved);
                        validOrderStatuses.Add((int)OrderStatus.Rejected);
                        break;
                }
                return Orders.Where(o => validOrderStatuses.Contains(o.OrderStatus)).ToList();
            }
        }

        public int NumberOfItems
        {
            get
            {
                return ValidOrders.Sum(order => order.Items.Count);
            }
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

        //[DisplayName("Collection Plan")]
        //public virtual Plan Plan { get; set; }

        [DisplayName("Customer")]
        public virtual Customer Customer { get; set; }

        [DisplayName("Customer Address")]
        public virtual CustomerAddress CustomerAddress { get; set; }

        [DisplayName("Orders")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
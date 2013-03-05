using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Utilities;
using SMDH.Models.Statuses;

namespace SMDH.Models
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
}

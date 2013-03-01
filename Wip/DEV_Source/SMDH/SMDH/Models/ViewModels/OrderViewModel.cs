using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;
using SMDH.Models;

namespace SMDH.Models.ViewModels
{
    public class OrderViewModel
    {
        public int OrderId { get; set; }
        public int RequestId { get; set; }
        public string DeliveryOption { get; set; }
        public string OrderPaymentType { get; set; }
        public DateViewModel DueDate { get; set; }
        public DateViewModel CollectedDate { get; set; }
        public DateViewModel DeliveryDate { get; set; }
        public string ReceiverName { get; set; }
        public string ReceiverPhone { get; set; }
        public string ReceiverAddress { get; set; }
        public string AddressFromWard { get; set; }
        public Nullable<int> Fee { get; set; }
        public int AmountToBeCollected { get; set; }
        public string Status { get; set; }
        public string Note { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public Nullable<int> HubId;

        public List<ItemViewModel> Items { get; set; }

    }
}
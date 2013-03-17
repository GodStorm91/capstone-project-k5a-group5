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
        public int ItemNo { get; set; }
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
        public string Amount { get; set; }
        public string Status { get; set; }
        public string Note { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public Nullable<int> HubId;
        public string DueDateString { get; set; }

        public List<ItemViewModel> Items { get; set; }

        public OrderViewModel(Order order)
        {
            OrderId = order.OrderId;
            ItemNo = order.Items.Count;
            RequestId = order.RequestId.Value;
            DeliveryOption = order.DeliveryOption.Name;
            OrderPaymentType = order.OrderPaymentType.Name;
            DueDate = new DateViewModel(order.DueDate);
            CollectedDate = new DateViewModel(order.CollectedDate);
            DeliveryDate = new DateViewModel(order.DeliveryDate);
            ReceiverName = order.ReceiverName;
            ReceiverPhone = order.ReceiverPhone;
            //ReceiverAddress = AddressHelper.GetFullAddress(order);
            Latitude = order.Latitude;
            Longitude = order.Longitude;
            Fee = order.Fee;
            //Status = Regex.Replace(order.Status.ToString(), "(\\B[A-Z])", " $1");
            AmountToBeCollected = order.AmountToBeCollectedFromReceiver;
            Amount = order.AmountToBeCollectedFromReceiver.ToString("N3");
            Note = order.Note;
            DueDateString = String.Format("{0:dd/MM/yyyy hh:mm tt}", DueDate);
            //AddressFromWard = AddressHelper.GetAddressFromWard(order);
        }
    }
}
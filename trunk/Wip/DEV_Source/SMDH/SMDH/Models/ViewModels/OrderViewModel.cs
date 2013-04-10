using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.Concrete;
using SMDH.Models;
using SMDH.Models.Utilities;
using System.Text.RegularExpressions;
using SMDH.Models.Statuses;
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
        public string CreatedDate { get; set; }
        public float WeightedScore { get; set; }
        public List<ItemViewModel> Items { get; set; }
        public string DeliverAddress { get; set; }
        public string Customer { get; set; }
        public string AmountToBeCollectedString { get; set; }

        public OrderViewModel(Order order)
        {
            var context = new SMDHDataContext();
            EFHubsRepository hubRepo = new EFHubsRepository();
            
            OrderId = order.OrderId;
            ItemNo = order.Items.Count;
            RequestId = !order.RequestId.HasValue ? -1 : order.RequestId.Value;
            DeliveryOption = order.DeliveryOption.Name;
            OrderPaymentType = order.OrderPaymentType.Name;
            DueDate = new DateViewModel(order.DueDate);
            CollectedDate = new DateViewModel(order.CollectedDate);
            DeliveryDate = new DateViewModel(order.DeliveryDate);
            ReceiverName = order.ReceiverName;
            ReceiverPhone = order.ReceiverPhone;
            ReceiverAddress = AddressHelper.GetFullAddress(order);
            Latitude = order.Latitude;
            Longitude = order.Longitude;
            Fee = order.Fee;
            Status = ((OrderStatus)order.OrderStatus).ToString();
            AmountToBeCollected = order.AmountToBeCollectedFromReceiver;
            Amount = order.AmountToBeCollectedFromReceiver.ToString("N0");
            Note = order.Note;
            DueDateString = String.Format("{0:dd-MM-yyyy hh:mm tt}", DueDate);
            CreatedDate = string.Format("{0:dd/MM/yyyy HH:mm:ss}", order.CreatedDate);
            DeliverAddress = order.HubId != null ? AddressHelper.GetFullAddress(context.Hubs.Single(h => h.HubId == order.HubId)) : ReceiverAddress;
            Customer = !order.RequestId.HasValue ? context.Customers.Single(c=> c.CustomerId == order.CustomerId).DisplayName : order.Request.Customer.DisplayName;
            AddressFromWard = AddressHelper.GetAddressFromWard(order);
        }

        public OrderViewModel(Order order, double weightedDeliveryTypeScore, double weightedDateScore)
        {
            EFHubsRepository hubRepo = new EFHubsRepository();
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
            ReceiverAddress = AddressHelper.GetFullAddress(order);
            Latitude = order.Latitude;
            Longitude = order.Longitude;
            Fee = order.Fee;
            Status = Regex.Replace(order.Status.ToString(), "(\\B[A-Z])", " $1");
            AmountToBeCollected = order.AmountToBeCollectedFromReceiver;
            Amount = order.AmountToBeCollectedFromReceiver.ToString("N3");
            Note = order.Note;
            DueDateString = String.Format("{0:dd-MM-yyyy hh:mm tt}", DueDate);
            CreatedDate = string.Format("{0:dd/MM/yyyy HH:mm:ss}", order.CreatedDate);
            System.TimeSpan diff = System.DateTime.Now.Subtract(DateTime.Parse(CreatedDate, new System.Globalization.CultureInfo("fr-FR", false)));
            WeightedScore = (float)(weightedDateScore * diff.Days + weightedDeliveryTypeScore);
            DeliverAddress = order.HubId != null ? order.Hub.FullAddress : ReceiverAddress;
            Customer = order.Request.Customer.DisplayName;            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using HDMS.Models;
using HDMS.Models.Utilities;
using HDMS.Models.ViewModels;

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

    public List<ItemViewModel> Items { get; set; }

    public OrderViewModel(Order order)
    {
        OrderId = order.OrderId;
        RequestId = order.RequestId;
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
        Note = order.Note;
        AddressFromWard = AddressHelper.GetAddressFromWard(order);
    }
}
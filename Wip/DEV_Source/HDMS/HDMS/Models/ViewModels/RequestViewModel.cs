using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using HDMS.Models;
using HDMS.Models.Utilities;
using HDMS.Models.ViewModels;

public partial class RequestViewModel
{
    public int RequestId { get; set; }
    public string Customer { get; set; }
    public string CollectionAddress { get; set; }
    public string RequestedDate { get; set; }
    public string Status { get; set; }
    public string Note { get; set; }
    public Nullable<decimal> Latitude { get; set; }
    public Nullable<decimal> Longitude { get; set; }
    public string AddressFromWard { get; set; }
    public float WeightedScore { get; set; }

    public RequestViewModel(Request request)
    {
        RequestId = request.RequestId;
        Customer = request.Customer.DisplayName;
        CollectionAddress = request.CustomerAddress.FullAddress;
        RequestedDate = string.Format("{0:dd/MM/yyyy tt}", request.RequestedDate);
        Status = Regex.Replace(request.Status.ToString(), "(\\B[A-Z])", " $1");
        Note = request.Note;
        Latitude = request.CustomerAddress.Latitude;
        Longitude = request.CustomerAddress.Longitude;
        AddressFromWard = AddressHelper.GetAddressFromWard(request.CustomerAddress);
    }

    public RequestViewModel(Request request, float weightedDeliveryTypeScore, float weightedDateScore)
    {
        RequestId = request.RequestId;
        Customer = request.Customer.DisplayName;
        CollectionAddress = request.CustomerAddress.FullAddress;
        RequestedDate = string.Format("{0:dd/MM/yyyy tt}", request.RequestedDate);
        Status = Regex.Replace(request.Status.ToString(), "(\\B[A-Z])", " $1");
        Note = request.Note;
        Latitude = request.CustomerAddress.Latitude;
        Longitude = request.CustomerAddress.Longitude;
        AddressFromWard = AddressHelper.GetAddressFromWard(request.CustomerAddress);
        System.TimeSpan diff = System.DateTime.Now.Subtract(DateTime.Parse(RequestedDate, new System.Globalization.CultureInfo("fr-FR", false)));
        WeightedScore = weightedDateScore * diff.Days + weightedDeliveryTypeScore;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HDMS.Models.Utilities
{
    public class AddressHelper
    {
        public static string GetFullAddress(CustomerAddress hub)
        {
            if (hub.Address == null || hub.DistrictId == null) return null;

            var context = new HDMSEntities();
            var address = hub.Address;
            var ward = new Ward() { Name = "" };
            if (hub.WardId != null) ward = context.Wards.Find(hub.WardId);
            var district = context.Districts.Find(hub.DistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (hub.WardId != null) fullAddress = fullAddress + ", " + ward.Name;
            fullAddress = fullAddress + ", " + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }

        public static string GetFullAddress(Order order)
        {
            if (order.ReceiverAddress == null || order.ReceiverAddressDistrictId == null) return null;

            var context = new HDMSEntities();
            var address = order.ReceiverAddress;
            var ward = new Ward() {Name = ""};
            if (order.ReceiverAddressWardId != null) ward = context.Wards.Find(order.ReceiverAddressWardId);
            var district = context.Districts.Find(order.ReceiverAddressDistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (order.ReceiverAddressWardId != null) fullAddress = fullAddress + ", " + ward.Name;
            fullAddress = fullAddress + ", " + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }

        public static string GetFullAddress(Hub hub)
        {
            if (hub.Address == null || hub.DistrictId == null) return null;

            var context = new HDMSEntities();
            var address = hub.Address;
            var ward = new Ward() { Name = "" };
            if (hub.WardId != null) ward = context.Wards.Find(hub.WardId);
            var district = context.Districts.Find(hub.DistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (hub.WardId != null) fullAddress = fullAddress + ", " + ward.Name;
            fullAddress = fullAddress + ", " + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }

        public static string GetAddressFromWard(Order order)
        {
            if (order.ReceiverAddressDistrictId == null) return null;

            var context = new HDMSEntities();
            var address = "";
            var ward = new Ward() { Name = "" };
            if (order.ReceiverAddressWardId != null) ward = context.Wards.Find(order.ReceiverAddressWardId);
            var district = context.Districts.Find(order.ReceiverAddressDistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (order.ReceiverAddressWardId != null) fullAddress = ward.Name + ", ";
            fullAddress = fullAddress + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }

        public static string GetAddressFromWard(CustomerAddress hub)
        {
            if (hub.DistrictId == null) return null;

            var context = new HDMSEntities();
            var address = "";
            var ward = new Ward() { Name = "" };
            if (hub.WardId != null) ward = context.Wards.Find(hub.WardId);
            var district = context.Districts.Find(hub.DistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (hub.WardId != null) fullAddress = ward.Name + ", ";
            fullAddress = fullAddress + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }

        public static string GetAddressFromWard(Hub hub)
        {
            if (hub.DistrictId == null) return null;

            var context = new HDMSEntities();
            var address = "";
            var ward = new Ward() { Name = "" };
            if (hub.WardId != null) ward = context.Wards.Find(hub.WardId);
            var district = context.Districts.Find(hub.DistrictId);
            var cityProvince = district.CityProvince;

            var fullAddress = address;
            if (hub.WardId != null) fullAddress = ward.Name + ", ";
            fullAddress = fullAddress + district.Name + ", " + cityProvince.Name;

            return fullAddress;
        }
    }
}
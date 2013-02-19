using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Google.Api.Maps.Service.Geocoding;
using HDMS.Models;

namespace HDMS.Models.Utilities
{
    public class GoogleMapsHelper
    {
        public static void UpdateMapLocation(HDMSEntities context, Order order)
        {
            UpdateMapLocation(context,order,true);
        }

        public static void UpdateMapLocation(HDMSEntities context, Order order, bool commit)
        {
            try
            {
                var geocodingRequest = new GeocodingRequest();
                geocodingRequest.Sensor = "false";
                geocodingRequest.Address = order.FullAddress == null
                                               ? order.FullAddress
                                               : AddressHelper.GetFullAddress(order);
                var response = GeocodingService.GetResponse(geocodingRequest);
                if (response.Results.Length > 0)
                {
                    var result = response.Results.First();
                    order.Latitude = result.Geometry.Location.Latitude;
                    order.Longitude = result.Geometry.Location.Longitude;
                }
                if (commit)
                {
                    context.Entry(order).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                return;
            }
        }

        public static void UpdateMapLocation(HDMSEntities context, CustomerAddress hub, bool commit)
        {
            try
            {
                var geocodingRequest = new GeocodingRequest();
                geocodingRequest.Sensor = "false";
                geocodingRequest.Address = hub.FullAddress == null
                                               ? hub.FullAddress
                                               : AddressHelper.GetFullAddress(hub);
                var response = GeocodingService.GetResponse(geocodingRequest);
                if (response.Results.Length > 0)
                {
                    var result = response.Results.First();
                    hub.Latitude = result.Geometry.Location.Latitude;
                    hub.Longitude = result.Geometry.Location.Longitude;
                }
                if (commit)
                {
                    context.Entry(hub).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                return;
            }
        }

        public static void UpdateMapLocation(HDMSEntities context, Hub hub, bool commit)
        {
            try
            {
                var geocodingRequest = new GeocodingRequest();
                geocodingRequest.Sensor = "false";
                geocodingRequest.Address = hub.FullAddress == null
                                               ? hub.FullAddress
                                               : AddressHelper.GetFullAddress(hub);
                var response = GeocodingService.GetResponse(geocodingRequest);
                if (response.Results.Length > 0)
                {
                    var result = response.Results.First();
                    hub.Latitude = result.Geometry.Location.Latitude;
                    hub.Longitude = result.Geometry.Location.Longitude;
                }
                if (commit)
                {
                    context.Entry(hub).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
            catch (Exception e)
            {
                return;
            }
        }
    }
}
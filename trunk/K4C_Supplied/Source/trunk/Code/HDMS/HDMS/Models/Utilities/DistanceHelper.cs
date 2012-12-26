using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using HDMS.Models.Statuses;
using Newtonsoft.Json.Linq;

namespace HDMS.Models.Utilities
{
    public class DistanceHelper
    {
        //public static void CalculateDistanceFrom(Order order)
        //{
        //    var context = new HDMSEntities();
        //    if (order.Latitude != null && order.Longitude != null)
        //    {
        //        var origins = order.Latitude + "," + order.Longitude;
        //        var destinations = "";
        //        var destinationList = new List<Order>();
        //        var distanceList = new List<int>();
        //        var orders = context.Orders.Where(o => o.OrderId != order.OrderId
        //                                            && o.DeliveryPlanId == null
        //                                            && o.OrderStatus == (int)OrderStatus.Collected
        //                                            ).ToArray();
        //        for (int k = 0; k < orders.Length; k++)
        //        {
        //            if (orders[k].Latitude != null && orders[k].Longitude != null)
        //            {
        //                //var fromOrderId = order.OrderId;
        //                //var toOrderId = orders[k].OrderId;
        //                //var distanceCalculated =
        //                //    context.Distances.Any(
        //                //        dbo => (dbo.FromOrderId == fromOrderId && dbo.ToOrderId == toOrderId)
        //                //               || (dbo.FromOrderId == toOrderId && dbo.ToOrderId == fromOrderId)
        //                //               && dbo.Distance >= 0);
        //                //if (!distanceCalculated)
        //                //{
        //                if (destinations.Length > 0) destinations += "|";
        //                destinations += orders[k].Latitude + "," + orders[k].Longitude;
        //                destinationList.Add(orders[k]);
        //                //}
        //            }
        //        }
        //        var url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=" + origins + "&destinations=" + destinations + "&sensor=false";
        //        WebRequest request = WebRequest.Create(url);

        //        request.Method = "GET";
        //        request.ContentType = "application/json; charset=utf-8";

        //        //get response-stream, and use a streamReader to read the content
        //        using (Stream s = request.GetResponse().GetResponseStream())
        //        {
        //            using (StreamReader sr = new StreamReader(s))
        //            {
        //                var jsonData = sr.ReadToEnd();
        //                var obj = JObject.Parse(jsonData);
        //                if ((string)obj["status"] == "OK")
        //                {
        //                    var rows = obj["rows"].ToArray();
        //                    for (int k = 0; k < rows.Length; k++)
        //                    {
        //                        var elements = rows[k]["elements"].ToArray();
        //                        for (int l = 0; l < elements.Length; l++)
        //                        {
        //                            var distance = new Distance()
        //                            {
        //                                FromId = order.OrderId,
        //                                ToId = destinationList[l].OrderId
        //                            };
        //                            var status = (string)elements[l]["status"];
        //                            if (status == "OK")
        //                            {
        //                                var distanceObj = (JObject)elements[l]["distance"];
        //                                var distanceValue = (int)distanceObj["value"];
        //                                distanceList.Add(distanceValue);
        //                                distance.DistanceValue = distanceValue;
        //                            }
        //                            else
        //                            {
        //                                distanceList.Add(-1);
        //                                distance.DistanceValue = -1;
        //                            }
        //                            context.Distances.Add(distance);
        //                            context.SaveChanges();
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }

        //}

        public static List<Distance> CalculateDistance(Hub hub, Order[] orders)
        {
            var distances = new List<Distance>();
            {
                var origins = hub.Latitude + "," + hub.Longitude;
                var destinations = "";
                var destinationList = new List<Order>();
                foreach (var order in orders)
                {
                    if (order.Latitude != null && order.Longitude != null)
                    {
                        if (destinations.Length > 0) destinations += "|";
                        destinations += order.Latitude + "," + order.Longitude;
                        destinationList.Add(order);
                    }
                }

                var url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=" + origins +
                              "&destinations=" + destinations + "&sensor=false";
                WebRequest request = WebRequest.Create(url);

                request.Method = "GET";
                request.ContentType = "application/json; charset=utf-8";

                using (Stream s = request.GetResponse().GetResponseStream())
                {
                    using (StreamReader sr = new StreamReader(s))
                    {
                        var jsonData = sr.ReadToEnd();
                        var obj = JObject.Parse(jsonData);
                        if ((string)obj["status"] == "OK")
                        {
                            var rows = obj["rows"].ToArray();
                            for (int k = 0; k < rows.Length; k++)
                            {
                                var elements = rows[k]["elements"].ToArray();
                                for (int l = 0; l < elements.Length; l++)
                                {
                                    var toOrder = destinationList[l];
                                    
                                    var toOrderId = toOrder.OrderId;
                                    //var oldDistances = context.Distances.Where(dbo => (dbo.FromId == hub.HubId && dbo.ToId == toOrderId)).ToArray();
                                    //foreach (var oldDistance in oldDistances)
                                    //{
                                    //    context.Distances.Remove(oldDistance);
                                    //}
                                    var distance = new Distance()
                                    {
                                        Type = DistanceType.HUB_TO_ORDER,
                                        FromId = hub.HubId,
                                        ToId = toOrder.OrderId
                                    };
                                    var status = (string)elements[l]["status"];
                                    if (status == "OK")
                                    {
                                        var distanceObj = (JObject)elements[l]["distance"];
                                        var distanceValue = (int)distanceObj["value"];
                                        distance.DistanceValue = distanceValue;
                                    }
                                    else
                                    {
                                        distance.DistanceValue = -1;
                                    }
                                    distances.Add(distance);
                                }
                            }
                        }
                    }
                }
            }

            for (int i = 0; i < orders.Length; i++)
            {
                var fromOrder = orders[i];
                if (fromOrder.Latitude != null && fromOrder.Longitude != null)
                {
                    var origins = fromOrder.Latitude + "," + fromOrder.Longitude;
                    var destinations = "";
                    var destinationList = new List<Order>();

                    for (int k = i + 1; k < orders.Length; k++)
                    {
                        var toOrder = orders[k];
                        if (toOrder.Latitude != null && toOrder.Longitude != null && toOrder.OrderId != fromOrder.OrderId)
                        {
                            if (destinations.Length > 0) destinations += "|";
                            destinations += toOrder.Latitude + "," + toOrder.Longitude;
                            destinationList.Add(toOrder);

                        }
                    }
                    var url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=" + origins +
                              "&destinations=" + destinations + "&sensor=false";
                    WebRequest request = WebRequest.Create(url);

                    request.Method = "GET";
                    request.ContentType = "application/json; charset=utf-8";

                    //get response-stream, and use a streamReader to read the content
                    using (Stream s = request.GetResponse().GetResponseStream())
                    {
                        using (StreamReader sr = new StreamReader(s))
                        {
                            var jsonData = sr.ReadToEnd();
                            var obj = JObject.Parse(jsonData);
                            if ((string)obj["status"] == "OK")
                            {
                                var rows = obj["rows"].ToArray();
                                for (int k = 0; k < rows.Length; k++)
                                {
                                    var elements = rows[k]["elements"].ToArray();
                                    for (int l = 0; l < elements.Length; l++)
                                    {
                                        var toOrder = destinationList[l];
                                        var fromOrderId = fromOrder.OrderId;
                                        var toOrderId = toOrder.OrderId;
                                        //var oldDistances = context.Distances.Where(dbo => (dbo.FromId == fromOrderId && dbo.ToId == toOrderId)
                                        //                                        || (dbo.FromId == toOrderId && dbo.ToId == fromOrderId)).ToArray();
                                        //foreach (var oldDistance in oldDistances)
                                        //{
                                        //    context.Distances.Remove(oldDistance);
                                        //}
                                        var distance = new Distance()
                                                           {
                                                               Type = DistanceType.ORDER_TO_ORDER,
                                                               FromId = fromOrder.OrderId,
                                                               ToId = toOrder.OrderId
                                                           };
                                        var status = (string)elements[l]["status"];
                                        if (status == "OK")
                                        {
                                            var distanceObj = (JObject)elements[l]["distance"];
                                            var distanceValue = (int)distanceObj["value"];
                                            distance.DistanceValue = distanceValue;
                                        }
                                        else
                                        {
                                            distance.DistanceValue = -1;
                                        }
                                        distances.Add(distance);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return distances;
        }
    }
}
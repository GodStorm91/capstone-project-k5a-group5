using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OsmSharp.Tools.Math.Geo;

namespace SMDH.Models.ViewModels
{
    public class ListRequestsJsonModel
    {
        public int Id { get; set; }
        public List<int> listRequests { get; set; }
        public double Distance { get; set; }
        public List<double> WaypointsLongitudeList { get; set; }
        public List<double> WaypointsLatitudeList { get; set; }
        public List<double> SegmentsLongitudeList { get; set; }
        public List<double> SegmentsLatitudeList { get; set; }
    }
}
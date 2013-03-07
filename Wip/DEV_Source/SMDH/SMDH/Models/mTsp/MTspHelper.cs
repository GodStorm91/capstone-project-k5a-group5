using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using OsmSharp.Osm.Routing.Interpreter;
using OsmSharp.Routing.Core.Graph.Memory;
using OsmSharp.Osm.Routing.Data.Processing;
using OsmSharp.Osm.Routing.Data;
using OsmSharp.Osm.Data.Core.Processor;
using OsmSharp.Osm.Core;
using OsmSharp.Osm.Data.XML.Raw.Processor;
using OsmSharp.Routing.Core;
using OsmSharp.Routing.Core.Graph.Router.Dykstra;
using OsmSharp.Osm.Map.Layers.Tiles;
using OsmSharp.Osm.Map.Layers.Custom;
using OsmSharp.Tools.Math.Geo;
using OsmSharp.Tools.Math.Shapes;
using OsmSharp.Osm.Map.Elements;
using OsmSharp.Osm.Data.Core.Processor.Progress;
using OsmSharp.Osm.Renderer.Gdi.Targets.UserControlTarget;
using OsmSharp.Routing.Core.Route;
using OsmSharp.Osm.Map.Layers.Routing;
using OsmSharp.Routing.CH.PreProcessing;
using OsmSharp.Routing.CH.Routing;
using OsmSharp.Routing.CH.PreProcessing.Witnesses;
using OsmSharp.Routing.CH.PreProcessing.Ordering;
using System.Threading;
using OsmSharp.Routing.Core.Graph.DynamicGraph.SimpleWeighed;
using OsmSharp.Osm.Data.PostgreSQL.Raw;
using OsmSharp.Osm.Routing.Core.TSP;
using OsmSharp.Osm.Data.Raw.XML.OsmSource;
using System.Reflection;
using OsmSharp.Routing.Core;
using OsmSharp.Osm.Routing.Interpreter;
using OsmSharp.Osm.Core;
using OsmSharp.Routing.Core.Graph.Memory;
using OsmSharp.Osm.Routing.Data;
using OsmSharp.Osm.Routing.Data.Processing;
using OsmSharp.Osm.Data.Core.Processor.Filter.Sort;
using OsmSharp.Osm.Data.XML.Raw.Processor;
using OsmSharp.Routing.Core.Graph.Router.Dykstra;
using OsmSharp.Osm.Routing.Core.TSP.Genetic;
using OsmSharp.Routing.Core.Route;
using OsmSharp.Routing.Core.Graph.DynamicGraph.PreProcessed;
using SMDH.Models.mTsp;

namespace SMDH.Models.mTsp
{
    public static class MTspHelper
    {
        private static SMDHDataContext context = new SMDHDataContext();
        
        public static List<List<GeoCoordinate>> segmentsLists;

        public static List<List<GeoCoordinate>> waypointLists;
        /// <summary>
        /// The box the routing is limited to.
        /// </summary>
        private static GeoCoordinateBox _box;

        /// <summary>
        /// Holds the router.
        /// </summary>
        private static IRouter<RouterPoint> _router;

        /// <summary>
        /// Holds the route layer.
        /// </summary>
        private static OsmSharpRouteLayer _route_layer;

        /// <summary>
        /// Holds the latest location.
        /// </summary>
        private static GeoCoordinate _latest_location;

        /// <summary>
        /// Holds the point that we click
        /// </summary>
        private static CustomLayer _points_layer;

        private static CustomLayer _waypoints_layer;       

        private static List<GeoCoordinate> _points;

        private static List<GeoCoordinate> _waypoints;

        private static PointCollection _pointCollection;

        private static bool _flag = false;

        private static int _numCluster = 0;

        private static OsmTagsIndex tags_index = new OsmTagsIndex();
        private static MemoryRouterDataSource<PreProcessedEdge> osm_data;
        private static OsmRoutingInterpreter interpreter;
        private static List<RouterPoint> resolvedPoints;

        public  static void initialize()
        {
            // get the xml from the embedded resource.
            //Stream stream = new FileInfo(@"c:\OSM\bin\flanders_highway.osm").OpenRead();
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.eeklo.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.HoChiMinh.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.schendelbeke.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.test_network.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.matrix_big_area.osm");            

            // create the interpreter: interprets the OSM data.
            interpreter = new OsmRoutingInterpreter();

            // create the tags index: keeps tags at one location
            tags_index = new OsmTagsIndex();

            resolvedPoints = new List<OsmSharp.Routing.Core.RouterPoint>();
            Stream data_stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(@"SMDH.Models.mTsp.HoChiMinh.osm");
            List<GeoCoordinate> waypointList = new List<GeoCoordinate>();

            //OsmRoutingInterpreter interpreter = new OsmRoutingInterpreter();
            //OsmTagsIndex tags_index = new OsmTagsIndex();

            //do data processing
            osm_data = new MemoryRouterDataSource<PreProcessedEdge>(tags_index);
            PreProcessedDataGraphProcessingTarget targetData = new PreProcessedDataGraphProcessingTarget
            (osm_data, interpreter, osm_data.TagsIndex);

            XmlDataProcessorSource data_processor_source = new XmlDataProcessorSource(data_stream);
            DataProcessorFilterSort sorter = new DataProcessorFilterSort();
            sorter.RegisterSource(data_processor_source);
            targetData.RegisterSource(sorter);
            targetData.Pull();

            _points = new List<GeoCoordinate>();
        }

        public static void solveTsp(List<GeoCoordinate> points, int numPlans)
        {
            _points = points;
            _numCluster = numPlans;
            List<List<GeoCoordinate>> listGeo = new List<List<GeoCoordinate>>(_numCluster);
            segmentsLists = new List<List<GeoCoordinate>>(_numCluster);
            waypointLists = new List<List<GeoCoordinate>>(_numCluster);

            for (int i = 0; i < _numCluster; i++)
            {
                segmentsLists.Add(new List<GeoCoordinate>());                
            }

            List<PointCollection> allClusters = PerformKMeans();
            for (int i = 0; i < _numCluster; i++)
            {
               
                //get points in cluster
                PointCollection collection = allClusters[i];
                //list
                List<GeoCoordinate> pointsList = new List<GeoCoordinate>();
                waypointLists.Add(pointsList);
                //Add Tiktak Headquarters to Route
                var headquarter = context.Hubs.Single(o=> o.HubId == 1);
                pointsList.Add(new GeoCoordinate((double)headquarter.Latitude, (double)headquarter.Longitude));

                for (int j = 0; j < collection.Count; j++)
                {
                    pointsList.Add(_points[collection[j].Id]);
                    
                }                
                
                doTspCalculation(pointsList, VehicleEnum.Car,segmentsLists.ElementAt(i), waypointLists.ElementAt(i));
            }
        }

        public static string doTspCalculation(List<GeoCoordinate> points, VehicleEnum vehicle, List<GeoCoordinate> segments, List<GeoCoordinate> waypoints)
        {
            _waypoints = new List<GeoCoordinate>();
            List<RouterPoint> resolvedPoints = new List<OsmSharp.Routing.Core.RouterPoint>();
            IRouter<RouterPoint> router = new Router<PreProcessedEdge>(osm_data, interpreter, new DykstraRoutingPreProcessed(osm_data.TagsIndex));

            //Add point from _points to routerpoints
            for (int i = 0; i < points.Count; i++)
            {
                RouterPoint resolved = router.Resolve(VehicleEnum.Car, points.ElementAt<GeoCoordinate>(i));
                if (resolved != null && router.CheckConnectivity(VehicleEnum.Car, resolved, 100)) ;
                {
                    resolvedPoints.Add(resolved);
                }
            }
            //Start to solve
            RouterTSPGenetic<RouterPoint> tsp_solver = new RouterTSPGenetic<RouterPoint>(router);
            OsmSharpRoute tsp = tsp_solver.CalculateTSP(VehicleEnum.Car, resolvedPoints.ToArray());

            //double totalTime = 0;
            //double totalDistance = 0;
            //int order = 0;          
            for (int i = 0; i < tsp.Entries.Length; i++)
            {
                RoutePointEntry entry = tsp.Entries[i];

                //Initialize a new segment if needded 
                
                if (entry.Points != null)
                {
                    //loop for all points to create the way
                    for (int p_idx = 0; p_idx < entry.Points.Length; p_idx++)
                    {
                        RoutePoint point = entry.Points[p_idx];
                        //waypoints.Add(new GeoCoordinate(point.Latitude, point.Longitude));
                    }
                }

                segments.Add(new GeoCoordinate(entry.Latitude, entry.Longitude));
            }

            byte[] streamByte = tsp.SaveToByteArray();
            string tempString = System.Text.Encoding.Default.GetString(streamByte);
            return tempString;
        }

        //Perform Kmeans with the given points
        private static List<PointCollection> PerformKMeans()
        {
            //Create the collections of Point
            _pointCollection = new PointCollection();
            for (int i = 0; i < _points.Count; i++)
            {
                Point point = new Point(i, _points[i].Latitude, _points[i].Longitude);
                _pointCollection.AddPoint(point);
            }

            return (DoKMeans(_pointCollection, _numCluster));

        }

        public static  List<List<T>> SplitList<T>(List<T> items, int groupCount)
        {
            List<List<T>> allGroups = new List<List<T>>();

            //split into equal groups
            int startIndex = 0;
            int groupLength = (int)Math.Round((double)items.Count / (double)groupCount, 0);
            while (startIndex < items.Count)
            {
                List<T> group = new List<T>();
                group.AddRange(items.GetRange(startIndex, groupLength));
                startIndex += groupLength;

                //adjust group-length for last group
                if (startIndex + groupLength > items.Count)
                {
                    groupLength = items.Count - startIndex;
                }

                allGroups.Add(group);
            }

            //merge last two groups, if more than required groups are formed
            if (allGroups.Count > groupCount && allGroups.Count > 2)
            {
                allGroups[allGroups.Count - 2].AddRange(allGroups.Last());
                allGroups.RemoveAt(allGroups.Count - 1);
            }
            return allGroups;

        }

        public static  List<PointCollection> DoKMeans(PointCollection points, int clusterCount)
        {
            //divide points into equal clusters
            List<PointCollection> allClusters = new List<PointCollection>();
            List<List<Point>> allGroups = SplitList<Point>(points, clusterCount);
            foreach (List<Point> group in allGroups)
            {
                PointCollection cluster = new PointCollection();
                cluster.AddRange(group);
                allClusters.Add(cluster);
            }

            //start k-means clustering
            int movements = 1;
            while (movements > 0)
            {
                movements = 0;

                foreach (PointCollection cluster in allClusters) //for all clusters
                {
                    for (int pointIndex = 0; pointIndex < cluster.Count; pointIndex++) //for all points in each cluster
                    {
                        Point point = cluster[pointIndex];

                        int nearestCluster = FindNearestCluster(allClusters, point);
                        if (nearestCluster != allClusters.IndexOf(cluster)) //if point has moved
                        {
                            if (cluster.Count > 1) //cluster shall have minimum one point
                            {
                                Point removedPoint = cluster.RemovePoint(point);
                                allClusters[nearestCluster].AddPoint(removedPoint);
                                movements += 1;
                            }
                        }
                    }
                }
            }

            return (allClusters);
        }

        public static int FindNearestCluster(List<PointCollection> allClusters, Point point)
        {
            double minimumDistance = 0.0;
            int nearestClusterIndex = -1;

            for (int k = 0; k < allClusters.Count; k++) //find nearest cluster
            {
                double distance = Point.FindDistance(point, allClusters[k].Centroid);
                if (k == 0)
                {
                    minimumDistance = distance;
                    nearestClusterIndex = 0;
                }
                else if (minimumDistance > distance)
                {
                    minimumDistance = distance;
                    nearestClusterIndex = k;
                }
            }

            return (nearestClusterIndex);
        }

    }
}
﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;
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



namespace RoutingSpeedSample
{
    /// <summary>
    /// A map form.
    /// </summary>
    public partial class Map : Form
    {
        /// <summary>
        /// Creates a new map form.
        /// </summary>
        public Map()
        {
            InitializeComponent();
        }

        /// <summary>
        /// OnLoad event.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            _points = new List<GeoCoordinate>();

            // register the log screen as the output stream.
            OsmSharp.Tools.Core.Output.OutputStreamHost.RegisterOutputStream(
                this.mapEditorUserControl1.logControl1);

            // define the routable bounding box.
            _box = new GeoCoordinateBox( // lebbeke
                new GeoCoordinate(10.7529, 106.5923),
                new GeoCoordinate(10.8524, 106.732));
            //_box = new GeoCoordinateBox( // eeklo
            //    new GeoCoordinate(51.10800, 3.46400),
            //    new GeoCoordinate(51.24100, 3.67300));
            //_box = new GeoCoordinateBox( // gent
            //    new GeoCoordinate(50.93000, 3.48700),
            //    new GeoCoordinate(51.12400, 3.90700));
            //_box = new GeoCoordinateBox( // gent
            //    new GeoCoordinate(50.73298,3.70661),
            //    new GeoCoordinate(50.93571,4.07355));            
            //_box = new GeoCoordinateBox( // test network
            //    new GeoCoordinate(51.0582602,3.7187392),
            //    new GeoCoordinate(51.0575297,3.7206793));

            // create the map and all it's layers.
            OsmSharp.Osm.Map.Map map = new OsmSharp.Osm.Map.Map();
            map.Layers.Add(new TilesLayer());
            CustomLayer box_layer = new CustomLayer();
            map.Layers.Add(box_layer);            

            _route_layer = new OsmSharpRouteLayer();
            map.Layers.Add(_route_layer);

            //Layer that contains all the points
            _points_layer = new CustomLayer();
            map.Layers.Add(_points_layer);

            // center and zoom!
            this.mapEditorUserControl1.Map = map;
            this.mapEditorUserControl1.mapTarget.DisplayCardinalDirections = false;
            this.mapEditorUserControl1.Center = _box.Center;
            this.mapEditorUserControl1.ZoomFactor = 16;

            // show the data bouding box.
            List<GeoCoordinate> corners = new List<GeoCoordinate>();
            corners.Add(_box.Corners[3]);
            corners.Add(_box.Corners[1]);
            corners.Add(_box.Corners[0]);
            corners.Add(_box.Corners[2]);
            ElementPolygon box_element = new ElementPolygon(
                        new ShapePolyGonF<GeoCoordinate, GeoCoordinateBox, GeoCoordinateLine>(
                    OsmSharp.Tools.Math.Geo.Factory.PrimitiveGeoFactory.Instance, corners.ToArray()),
                    Color.FromArgb(125, Color.Orange).ToArgb(), 10, false, true);
            box_layer.AddElement(box_element);
            
            // start the pre-processing on another thread.
            Thread thread = new Thread(new ThreadStart(StartPreProcessing));
            thread.Start();
        }

        /// <summary>
        /// Starts the pre-processing.
        /// </summary>
        private void StartPreProcessing()
        {
            // get the xml from the embedded resource.
            //Stream stream = new FileInfo(@"c:\OSM\bin\flanders_highway.osm").OpenRead();
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.eeklo.osm");
            Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.HoChiMinh.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.schendelbeke.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.test_network.osm");
            //Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("RoutingSpeedSample.matrix_big_area.osm");

            bool ch = false;

            // create the interpreter: interprets the OSM data.
            OsmRoutingInterpreter interpreter = new OsmRoutingInterpreter();

            // create the tags index: keeps tags at one location
            OsmTagsIndex tags_index = new OsmTagsIndex();            

            if (ch)
            {
                // do the data processing.
                MemoryRouterDataSource<CHEdgeData> osm_data =
                    new MemoryRouterDataSource<CHEdgeData>(tags_index);
                CHEdgeDataGraphProcessingTarget target_data = new CHEdgeDataGraphProcessingTarget(
                    osm_data, interpreter, osm_data.TagsIndex);
                DataProcessorSource data_processor_source = new XmlDataProcessorSource(stream);                
                data_processor_source = new ProgressDataProcessorSource(data_processor_source);
                target_data.RegisterSource(data_processor_source);
                target_data.Pull();

                // create the contraction hierarchy.
                INodeWitnessCalculator witness_calculator = new DykstraWitnessCalculator(osm_data);
                //CHPreProcessor pre_processor = new CHPreProcessor(osm_data,
                //    new SparseOrdering(osm_data), witness_calculator);
                CHPreProcessor pre_processor = new CHPreProcessor(osm_data,
                    new EdgeDifferenceContractedSearchSpace(osm_data, witness_calculator), witness_calculator);
                pre_processor.Start();

                // create the router.
                _router = new Router<CHEdgeData>(osm_data, interpreter,
                    new CHRouter(osm_data));
            }
            else
            {
                // do the data processing.
                MemoryRouterDataSource<SimpleWeighedEdge> osm_data =
                    new MemoryRouterDataSource<SimpleWeighedEdge>(tags_index);
                SimpleWeighedDataGraphProcessingTarget target_data = new SimpleWeighedDataGraphProcessingTarget(
                    osm_data, interpreter, osm_data.TagsIndex);
                DataProcessorSource data_processor_source = new XmlDataProcessorSource(stream);
                data_processor_source = new ProgressDataProcessorSource(data_processor_source);
                target_data.RegisterSource(data_processor_source);
                target_data.Pull();

                // create the router.
                _router = new Router<SimpleWeighedEdge>(osm_data, interpreter,
                    new DykstraRoutingLive(osm_data.TagsIndex));
            }

            // start the timer.
            timer1.Enabled = true;
        }

        #region Output Little Movie

        private bool _output_little_movie = true;

        private int _frame = 0;

        private void SaveImage()
        {
            if (this._output_little_movie)
            {
                if (this.InvokeRequired)
                {
                    this.Invoke(new InvokeDelegate(SaveImage));
                    return;
                }
                lock (this.mapEditorUserControl1.Map)
                {
                    string file = string.Format("frame_{0}.png", _frame.ToString("00000"));
                    _frame++;

                    //getthe instance of the graphics from the control
                    Graphics g = this.mapEditorUserControl1.mapTarget.CreateGraphics();

                    //new bitmap object to save the image
                    Bitmap bmp = new Bitmap(
                        this.mapEditorUserControl1.mapTarget.Width, this.mapEditorUserControl1.mapTarget.Height);

                    //Drawing control to the bitmap
                    this.mapEditorUserControl1.mapTarget.DrawToBitmap(bmp, new Rectangle(0, 0,
                        this.mapEditorUserControl1.mapTarget.Width, this.mapEditorUserControl1.mapTarget.Height));

                    bmp.Save(file, System.Drawing.Imaging.ImageFormat.Png);
                    bmp.Dispose();
                }
            }
        }

        private delegate void InvokeDelegate();

        private void timer1_Tick(object sender, EventArgs e)
        {
            //this.SaveImage();
        }

        #endregion

        /// <summary>
        /// The box the routing is limited to.
        /// </summary>
        private GeoCoordinateBox _box;

        /// <summary>
        /// Holds the router.
        /// </summary>
        private IRouter<RouterPoint> _router;

        /// <summary>
        /// Holds the route layer.
        /// </summary>
        private OsmSharpRouteLayer _route_layer;

        /// <summary>
        /// Holds the latest location.
        /// </summary>
        private GeoCoordinate _latest_location;

        /// <summary>
        /// Holds the point that we click
        /// </summary>
        private CustomLayer _points_layer;

        private List<GeoCoordinate> _points;

        /// <summary>
        /// Called when the map is clicked.
        /// </summary>
        /// <param name="e"></param>
        private void mapEditorUserControl1_MapClick(UserControlTargetEventArgs e)
        {
            this.AddUiPoint(e.Position);

            _points.Add(e.Position);
            if (_points.Count > 10)
            {
                doTspCalculation(_points, VehicleEnum.Car);
            }
            
        }

        private void AddUiPoint(GeoCoordinate point)
        {
            _points_layer.AddImage(global::RoutingSpeedSample.Properties.Resources.house, point);
            this.Invoke(new InvokeDelegate(Refresh));
        }

        private void mapEditorUserControl1_MapMove(UserControlTargetEventArgs e)
        {
            //if (_router != null && _latest_location != null)
            //{
            //    RouterPoint point1 = _router.Resolve(VehicleEnum.Car, _latest_location);
            //    RouterPoint point2 = _router.Resolve(VehicleEnum.Car, e.Position);

            //    if (point1 != null && point2 != null)
            //    {
            //        OsmSharpRoute route = _router.Calculate(VehicleEnum.Car, point1, point2);

            //        if (route != null)
            //        {
            //            _route_layer.Clear();
            //            _route_layer.AddRoute(route, Color.Blue);
            //            this.Refresh();

            //            OsmSharp.Tools.Core.Output.OutputStreamHost.WriteLine(string.Format("Route found: {0}m {1}s",
            //                route.TotalDistance, route.TotalTime));
            //        }
            //    }
            //}
        }

        private void doTspCalculation(List<GeoCoordinate> points, VehicleEnum vehicle)
        {
            List<RouterPoint> resolvedPoints = new List<OsmSharp.Routing.Core.RouterPoint>();
            Stream data_stream = Assembly.GetExecutingAssembly().GetManifestResourceStream(@"RoutingSpeedSample.HoChiMinh.osm");

            
            OsmRoutingInterpreter interpreter = new OsmRoutingInterpreter();
            OsmTagsIndex tags_index = new OsmTagsIndex();

            //do data processing
            MemoryRouterDataSource<PreProcessedEdge> osm_data = new MemoryRouterDataSource<PreProcessedEdge>(tags_index);
            PreProcessedDataGraphProcessingTarget targetData = new PreProcessedDataGraphProcessingTarget
            (osm_data, interpreter, osm_data.TagsIndex);

            XmlDataProcessorSource data_processor_source = new XmlDataProcessorSource(data_stream);
            DataProcessorFilterSort sorter = new DataProcessorFilterSort();
            sorter.RegisterSource(data_processor_source);
            targetData.RegisterSource(sorter);
            targetData.Pull();

            IRouter<RouterPoint> router = new Router<PreProcessedEdge>(osm_data, interpreter, new DykstraRoutingPreProcessed(osm_data.TagsIndex));

            //Add point from _points to routerpoints
            for (int i=0; i<_points.Count;i++)
            {
                RouterPoint resolved= router.Resolve(VehicleEnum.Car, points.ElementAt<GeoCoordinate>(i)); 
                if (resolved !=null && router.CheckConnectivity(VehicleEnum.Car, resolved, 100));
                {
                    resolvedPoints.Add(resolved);
                }
            }
            //Start to solve
            RouterTSPGenetic<RouterPoint> tsp_solver = new RouterTSPGenetic<RouterPoint>(router);
            OsmSharpRoute tsp = tsp_solver.CalculateTSP(VehicleEnum.Car,resolvedPoints.ToArray());            
            ShowRoute(_route_layer, tsp);


            RoutePointEntry[] list = tsp.Entries;
            double totalTime = 0;
            double totalDistance = 0;

            for (int i = 0; i < list.Count<RoutePointEntry>() - 1; i++)
            {
                GeoCoordinate point1 = new GeoCoordinate(list.ElementAt<RoutePointEntry>(i).Latitude, list.ElementAt<RoutePointEntry>(i).Longitude);
                GeoCoordinate point2 = new GeoCoordinate(list.ElementAt<RoutePointEntry>(i+1).Latitude, list.ElementAt<RoutePointEntry>(i+1).Longitude);
                RouterPoint rpoint1 = _router.Resolve(VehicleEnum.Car, point1);
                RouterPoint rpoint2 = _router.Resolve(VehicleEnum.Car, point2);

                    if (point1 != null && point2 != null)
                   {
                       OsmSharpRoute route = _router.Calculate(VehicleEnum.Car, rpoint1, rpoint2);
                       if (route != null)
                       {
                           totalDistance += route.TotalDistance;
                           totalTime += route.TotalTime;
                       }
                       
                    }
            }

            tsp.SaveAsGpx(new FileInfo(@"c:\temp\tsp.gpx"));
        }

        public void ShowRoute(CustomLayer layer, OsmSharpRoute route)
        {
            // clear the routes layer and add it.
            _route_layer.Clear();
            _route_layer.AddRoute(route, Color.FromArgb(150, Color.Blue));

            // invoke the cross-thread refresh.
            this.Invoke(new InvokeDelegate(Refresh));
        }

    }
}
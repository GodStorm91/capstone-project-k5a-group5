//PointCollection.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RoutingSpeedSample
{
    public class PointCollection : List<Point>
    {
        #region Properties

        public Point Centroid { get; set; }

        #endregion

        #region Constructors

        public PointCollection()
            : base()
        {
            Centroid = new Point();
        }

        #endregion

        #region Methods

        public void AddPoint(Point p)
        {
            this.Add(p);
            UpdateCentroid();
        }

        public Point RemovePoint(int index)
        {
            Point removedPoint = new Point(this[index].Id, this[index].X, this[index].Y);
            this.RemoveAt(index);
            UpdateCentroid();

            return (removedPoint);
        }

        public Point RemovePoint(Point p)
        {
            Point removedPoint = new Point(p.Id, p.X, p.Y);
            this.Remove(p);
            UpdateCentroid();

            return (removedPoint);
        }

        public Point GetPointNearestToCentroid()
        {
            double minimumDistance = 0.0;
            int nearestPointIndex = -1;

            foreach (Point p in this)
            {
                double distance = Point.FindDistance(p, Centroid);

                if (this.IndexOf(p) == 0)
                {
                    minimumDistance = distance;
                    nearestPointIndex = this.IndexOf(p);
                }
                else
                {
                    if (minimumDistance > distance)
                    {
                        minimumDistance = distance;
                        nearestPointIndex = this.IndexOf(p);
                    }
                }
            }

            return (this[nearestPointIndex]);
        }

        #endregion

        #region Internal-Methods

        public void UpdateCentroid()
        {
            double xSum = (from p in this select p.X).Sum();
            double ySum = (from p in this select p.Y).Sum();
            Centroid.X = (xSum / (double)this.Count);
            Centroid.Y = (ySum / (double)this.Count);
        }

        #endregion
    }

    public class Point
    {
        #region Properties

        public int Id { get; set; }
        public double X { get; set; }
        public double Y { get; set; }

        #endregion

        #region Constructors

        public Point()
        {
            Id = -1;
            X = -1;
            Y = -1;
        }

        public Point(double x, double y)
        {
            this.Id = -1;
            this.X = x;
            this.Y = y;
        }

        public Point(int id, double x, double y)
        {
            this.Id = id;
            this.X = x;
            this.Y = y;
        }

        #endregion

        #region Methods

        public bool IsBetween(Point p1, Point p2)
        {
            if (this.X >= p1.X && this.X <= p2.X)
            {
                if (this.Y >= p1.Y && this.Y <= p2.Y)
                {
                    return (true);
                }
            }

            return (false);
        }

        public override bool Equals(object obj)
        {
            if (obj is Point)
            {
                Point point = (Point)obj;
                if (this.X == point.X && this.Y == point.Y)
                {
                    return (true);
                }
            }

            return (false);
        }

        public override string ToString()
        {
            return ("{" + this.X + "," + this.Y + "}");
        }

        #endregion

        #region Static-Methods

        public static double FindDistance(Point pt1, Point pt2)
        {
            double x1 = pt1.X, y1 = pt1.Y;
            double x2 = pt2.X, y2 = pt2.Y;

            //find euclidean distance
            double distance = Math.Sqrt(Math.Pow(x2 - x1, 2.0) + Math.Pow(y2 - y1, 2.0));
            return (distance);
        }

        #endregion
    }


}

//////////////////////////////////////////////////////////////////////////////////////////////////
// File Name: Cities.cs
//      Date: 06/01/2006
// Copyright (c) 2006 Michael LaLena. All rights reserved.  (www.lalena.com)
// Permission to use, copy, modify, and distribute this Program and its documentation,
//  if any, for any purpose and without fee is hereby granted, provided that:
//   (i) you not charge any fee for the Program, and the Program not be incorporated
//       by you in any software or code for which compensation is expected or received;
//   (ii) the copyright notice listed above appears in all copies;
//   (iii) both the copyright notice and this Agreement appear in all supporting documentation; and
//   (iv) the name of Michael LaLena or lalena.com not be used in advertising or publicity
//          pertaining to distribution of the Program without specific, written prior permission. 
///////////////////////////////////////////////////////////////////////////////////////////////////
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Objects;
using System.Text;
using System.Data;
using System.IO;
using System.Globalization;
using HDMS.Models;
using System.Linq;

namespace HDMS.Models.Tsp
{
    /// <summary>
    /// This class contains the list of cities for this test.
    /// Each city has a location and the distance information to every other city.
    /// </summary>
    public class Cities : List<City>
    {
        /// <summary>
        /// Determine the distances between each city.
        /// </summary>
        /// <param name="numberOfCloseCities">When creating the initial population of tours, this is a greater chance
        /// that a nearby city will be chosen for a link. This is the number of nearby cities that will be considered close.</param>
        public void CalculateCityDistances(List<Distance> distances)
        {
            //if(context == null) context = new HDMSEntities();
            int numberOfCloseCities = 5;
            this[0].Distances.Clear();
            this[0].Distances.Add(0);
            for (int i = 1; i < Count; i++)
            {
                int distance = 0;
                var fromCityId = this[0].Id;
                var toCityId = this[i].Id;
                distance = distances.Where(dbo => dbo.FromId == fromCityId && dbo.ToId == toCityId
                                                        && dbo.DistanceType == (int)DistanceType.HUB_TO_ORDER).FirstOrDefault().DistanceValue;

                this[0].Distances.Add(distance);
            }

            for (int j = 1; j < Count; j++)
            {
                var city = this[j];
                city.Distances.Clear();
                var fromCityId = city.Id;
                var hubId = this[0].Id;
                int distanceToHub = 0;
                distanceToHub = distances.Where(dbo => dbo.FromId == hubId && dbo.ToId == city.Id
                                                        && dbo.DistanceType == (int)DistanceType.HUB_TO_ORDER
                                                                        ).FirstOrDefault().DistanceValue;
                city.Distances.Add(distanceToHub);

                for (int i = 1; i < Count; i++)
                {
                    var toCityId = this[i].Id;
                    int distance = 0;
                    if(city.Id != this[i].Id)
                    {
                        distance = distances.Where(dbo => dbo.DistanceType == (int)DistanceType.ORDER_TO_ORDER
                                                                && ((dbo.FromId == fromCityId && dbo.ToId == toCityId)
                                                                    || (dbo.FromId == toCityId && dbo.ToId == fromCityId))).FirstOrDefault().DistanceValue;    
                    }
                    city.Distances.Add(distance);
                }
            }

            foreach (City city in this)
            {
                city.FindClosestCities(numberOfCloseCities);
            }
        }

        /// <summary>
        /// Open the XML file that contains the list of cities.
        /// </summary>
        /// <param name="fileName">Name of the XML file.</param>
        /// <returns>The city list.</returns>
        /// <exception cref="FileNotFoundException">fileName parameter is invalid.</exception>
        /// <exception cref="InvalidCastException">XML File is not properly formatted.</exception>
        //public void OpenCityList(string fileName)
        //{
        //    DataSet cityDS = new DataSet();

        //    try
        //    {
        //        this.Clear();

        //        cityDS.ReadXml(fileName);

        //        DataRowCollection cities = cityDS.Tables[0].Rows;

        //        foreach (DataRow city in cities)
        //        {
        //            this.Add(new City(Convert.ToInt32(city["X"], CultureInfo.CurrentCulture), Convert.ToInt32(city["Y"], CultureInfo.CurrentCulture)));
        //        }
        //    }
        //    finally
        //    {
        //        cityDS.Dispose();
        //    }
        //}
    }
}

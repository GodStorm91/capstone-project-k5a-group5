

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
    public class Distance
    {
        public DistanceType Type
        {
            get
            {
                return (DistanceType)DistanceType;
            }
            set { this.DistanceType = (int)value; }
        }

        public int DistanceType { get; set; }
        public int FromId { get; set; }
        public int ToId { get; set; }
        public int DistanceValue { get; set; }
    }

}


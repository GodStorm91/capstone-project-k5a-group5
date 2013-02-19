using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HDMS.Models
{
    public enum DistanceType
    {
        ORDER_TO_ORDER = 1,
        HUB_TO_ORDER = 2,
        REQUEST_TO_REQUEST = 3,
        HUB_TO_REQUEST = 4
    }
}
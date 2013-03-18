using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.ViewModels
{
    public class DateViewModel
    {
        public string Date { get; set; }
        public string Time { get; set; }

        public DateViewModel(Nullable<System.DateTime> datetime)
        {
            if (datetime != null)
            {
                Date = string.Format("{0:dd-MM-yyyy}", datetime);
                Time = string.Format("{0:t}", datetime);
            }
            else
            {
                Date = "";
                Time = "";
            }
        }

        public override string ToString()
        {
            return Date + " " + Time;
        }
    }
}
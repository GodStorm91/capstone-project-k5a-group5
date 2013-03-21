using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.ViewModels
{
    public class WardViewModel
    {
        public int WardId { get; set; }
        public string WardName { get; set; }

        public WardViewModel(Ward ward)
        {
            WardId = ward.WardId;
            WardName = ward.Name;
        }
    }
}
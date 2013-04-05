using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Concrete;

namespace SMDH.Models.ViewModels
{
    public class HubViewModel
    {
        public int HubId { get; set; }
        public string Name { get; set; }
        public string WardName { get; set; }
        public string DistrictName { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string HubCategoryName { get; set; }
        public int HubCategoryId { get; set; }
        public string Address { get; set; }
        public int DistrictId { get; set; }
        public int WardId { get; set; }


        private EFHubsRepository repo = new EFHubsRepository();


        public HubViewModel(Hub hub)
        {
            Name = hub.Name;    
            HubId = hub.HubId;
            Longitude = (double)hub.Longitude;
            Latitude = (double)hub.Latitude;
            WardId = hub.WardId.Value;
            DistrictId = hub.DistrictId;
            WardName = hub.Ward.Name;
            DistrictName = hub.District.Name;
            HubCategoryId = hub.HubCategoryId==null ? -1 : (int)hub.HubCategoryId;
            Address = hub.Address;
        }
    }

    
}

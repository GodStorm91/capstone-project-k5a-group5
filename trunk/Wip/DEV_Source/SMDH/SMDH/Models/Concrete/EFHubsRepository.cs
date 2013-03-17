using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;
namespace SMDH.Models.Concrete
{
    public class EFHubsRepository
    {
        private SMDHDataContext context = new SMDHDataContext();

        public HubViewModel GetNearestHub(double lat, double lon)
        {
            List<Hub> listHub = context.Hubs.Where(o => o.IsActive == true).ToList();
            Hub minHub = null;
            double distance = double.MaxValue;

            for (int i = 0; i < listHub.Count; i++)
            {
                double curDistance = Math.Pow((lat - (double)listHub.ElementAt(i).Latitude), 2) + Math.Pow((lon - (double)listHub.ElementAt(i).Longitude), 2);
                if (curDistance < distance)
                {
                    distance = curDistance;
                    minHub = listHub.ElementAt(i);
                }
            }

            return new HubViewModel(minHub);

        }

        public HubViewModel Find(int id)
        {
            Hub hub = context.Hubs.Where(o => o.HubId == id).Single();
            return new HubViewModel(hub);

        }
    }
}

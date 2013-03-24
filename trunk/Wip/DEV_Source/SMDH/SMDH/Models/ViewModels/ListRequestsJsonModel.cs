using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.ViewModels
{
    public class ListRequestsJsonModel
    {
        public int Id { get; set; }
        public List<int> listRequests { get; set; }
        public double Distance { get; set; }
    }
}
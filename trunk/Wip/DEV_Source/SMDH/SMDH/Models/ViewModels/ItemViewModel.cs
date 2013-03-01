using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.ViewModels
{
    public class ItemViewModel
    {
        public int ItemId { get; set; }
        public int ProductId { get; set; }
        public int OrderId { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public bool IsFragile { get; set; }
        public bool HasHighValue { get; set; }                
        public string Note { get; set; }
    }
}
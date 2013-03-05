using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMDH.Models.ViewModels
{
    public class ProductViewModel
    {
        public int ProductId { get; set; }
        public int ProductCategory { get; set; }
        public string Name { get; set; }
        public string ProductWidth { get; set; }
        public string ProductHeight { get; set; }
        public string ProductLength { get; set; }
        public string ProductWeight { get; set; }
        public string ProductPrice { get; set; }
        public int CustomerId { get; set; }
        public bool IsPermanent { get; set; }
        public string ImageURL { get; set; }
    }
}
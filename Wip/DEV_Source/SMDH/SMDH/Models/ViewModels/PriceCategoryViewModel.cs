﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SMDH.Models.ViewModels
{
    public class PriceCategoryViewModel
    {
        public decimal Price { get; set; }
        public string PriceContent { get; set; }
        public string StaffName { get; set; }
        public DateTime EditDate { get; set; }
        public int PriceCategoryId { get; set; }

        public PriceCategoryViewModel(PriceCategory pc)
        {
            Price = pc.Price.Value;
            PriceContent = pc.PriceContent;
            EditDate = pc.EditDate.Value;
            PriceCategoryId = pc.PriceCategoryId;
        }
    }

    
}

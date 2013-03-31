

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Utilities;

namespace SMDH.Models
{
    [MetadataType(typeof(PriceCategoryMetadata))]
    public partial class PriceCategory
    {
        
    }

    public partial class PriceCategoryMetadata
    {       

        [DisplayName("Price Content")]
        [Required]
        [MaxLength(255)]
        public string PriceContent { get; set; }

        [DisplayName("Price")]
        [Required]
        public decimal Price { get; set; }
    }
}


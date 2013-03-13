﻿

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Statuses;

namespace SMDH.Models
{
    [MetadataType(typeof(ItemMetadata))]
    public partial class Item
    {
        public string Name
        {
            get
            {
                return this.Product.Name;
            }
        }

        public string Size
        {
            get
            {
                return this.Product.ProductHeight + "x" + this.Product.ProductWidth + "x" + this.Product.ProductLength;
            }
        }

        public string Weight
        {
            get
            {
                return this.Product.ProductWeight.ToString();
            }
        }
    }

    public partial class ItemMetadata
    {

        [DisplayName("Item Id")]
        [Required]
        public int ItemId { get; set; }

        [DisplayName("Order Id")]
        [Required]
        public int OrderId { get; set; }

        [DisplayName("Name")]
        [Required(ErrorMessage = "The Name of Item is required.")]
        [MaxLength(255)]
        public string Name { get; set; }

        [DisplayName("Quantity")]
        [Required(ErrorMessage = "The Quantity is required.")]
        public int Quantity { get; set; }

        [DisplayName("Is Fragile")]
        [Required]
        public bool IsFragile { get; set; }

        [DisplayName("Has High Value")]
        [Required]
        public bool HasHighValue { get; set; }

        [DisplayName("Size")]
        [Required(ErrorMessage = "The Size is required.")]
        [MaxLength(255)]
        public string Size { get; set; }

        [DisplayName("Weight")]
        [Required(ErrorMessage = "The Weight is required.")]
        [MaxLength(255)]
        public string Weight { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }


        [DisplayName("Order")]
        public virtual Order Order { get; set; }
    }
}

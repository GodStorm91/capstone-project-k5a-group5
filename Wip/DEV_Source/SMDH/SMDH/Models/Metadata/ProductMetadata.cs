using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Utilities;

namespace SMDH.Models
{
    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {

    }

    public partial class ProductMetadata
    {
        [DisplayName("Product Id")]
        [Required(ErrorMessage = "The Product Id of Product is required.")]
        public int ProductId { get; set; }

        [DisplayName("Product Category")]
        [Required(ErrorMessage = "The Product Category of Product is required.")]
        public string ProductCategory { get; set; }

        [DisplayName("Name")]
        [Required(ErrorMessage = "The Name of Product is required.")]
        public string Name { get; set; }

        [DisplayName("Size")]
        public string Size { get; set; }

        [DisplayName("Product Weight")]
        public string ProductWeight { get; set; }

        [DisplayName("Product Price")]
        [Required(ErrorMessage = "The Price of Product is required.")]
        public int ProductPrice { get; set; }

        [DisplayName("Customer Id")]
        [Required(ErrorMessage = "The Customer Id of Product is required.")]
        public int CustomerId { get; set; }

        [DisplayName("IsPermanent")]
        [Required(ErrorMessage = "The IsPermanent of Product is required.")]
        public bool IsPermanent { get; set; }

        [DisplayName("ImageURL")]
        public string ImageURL { get; set; }

        [DisplayName("Description")]
        public string Description { get; set; }

        [DisplayName("Is Active")]
        [Required]
        public bool Active { get; set; }	
    }
}

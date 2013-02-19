

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
[MetadataType(typeof(DeliveryOptionMetadata))]
public partial class DeliveryOption { }

public partial class DeliveryOptionMetadata
    {
  
    [DisplayName("Delivery Option Id")]
    [Required]
    public int DeliveryOptionId { get; set; }	
  
    [DisplayName("Name")]
    [Required(ErrorMessage = "The Delivery Option is required.")]
    [MaxLength(255)]
    public string Name { get; set; }	
  
    [DisplayName("Description")]
    public string Description { get; set; }	
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }	

  
    [DisplayName("Orders")]
    public virtual ICollection<Order> Orders { get; set; }	
    }
}


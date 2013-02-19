

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
[MetadataType(typeof(OrderPaymentTypeMetadata))]
public partial class OrderPaymentType { }

public partial class OrderPaymentTypeMetadata
    {
  
    [DisplayName("Order Payment Type Id")]
    [Required]
    public int OrderPaymentTypeId { get; set; }	
  
    [DisplayName("Name")]
    [Required(ErrorMessage = "The Payment Type is required.")]
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


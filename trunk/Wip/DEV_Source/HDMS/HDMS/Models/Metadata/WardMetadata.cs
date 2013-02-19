

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
[MetadataType(typeof(WardMetadata))]
public partial class Ward { }

public partial class WardMetadata
    {
  
    [DisplayName("Ward Id")]
    [Required]
    public int WardId { get; set; }	
  
    [DisplayName("District Id")]
    [Required(ErrorMessage = "The District is required.")]
    public int DistrictId { get; set; }

    
    [DisplayName("Name")]
    [Required(ErrorMessage = "The Ward is required.")]
    [MaxLength(255)]
    public string Name { get; set; }	
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }

    [DisplayName("Display Order")]
    public Nullable<int> DisplayOrder { get; set; }

    [DisplayName("Customer Addresses")]
    public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }	
  
    [DisplayName("District")]
    public virtual District District { get; set; }

    [DisplayName("Orders")]
    public virtual ICollection<Order> Orders { get; set; }	
    }
}


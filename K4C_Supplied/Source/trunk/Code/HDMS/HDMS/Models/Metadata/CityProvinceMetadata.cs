

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
[MetadataType(typeof(CityProvinceMetadata))]
public partial class CityProvince { }

public partial class CityProvinceMetadata
    {
  
    [DisplayName("City Province Id")]
    [Required]
    public int CityProvinceId { get; set; }	
  
    [DisplayName("Name")]
    [Required(ErrorMessage = "The City/Province is required.")]
    [MaxLength(255)]
    public string Name { get; set; }	
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }

    [DisplayName("Display Order")]
    public Nullable<int> DisplayOrder { get; set; }

    [DisplayName("Districts")]
    public virtual ICollection<District> Districts { get; set; }	
    }
}


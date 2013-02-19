

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HDMS.Models
{
[MetadataType(typeof(DistrictMetadata))]
public partial class District
{
}

public partial class DistrictMetadata
    {
  
    [DisplayName("District Id")]
    [Required]
    public int DistrictId { get; set; }

    [DisplayName("City/Province")]
    [Required(ErrorMessage = "The City/Province is required.")]
    public int CityProvinceId { get; set; }	
  
    [DisplayName("District")]
    [Required(ErrorMessage = "The District is required.")]
    [MaxLength(255)]
    public string Name { get; set; }	
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }

    [DisplayName("Display Order")]
    public Nullable<int> DisplayOrder { get; set; }

  
    [DisplayName("City Province")]
    public virtual CityProvince CityProvince { get; set; }	
  
    [DisplayName("Wards")]
    public virtual ICollection<Ward> Wards { get; set; }	
    }
}


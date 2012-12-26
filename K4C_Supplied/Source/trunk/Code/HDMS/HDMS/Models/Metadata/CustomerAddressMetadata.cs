

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using HDMS.Models.Utilities;

namespace HDMS.Models
{
[MetadataType(typeof(CustomerAddressMetadata))]
public partial class CustomerAddress
{
    public string FullAddress
    {
        get { return AddressHelper.GetFullAddress(this); }
    }

    public bool UpdateLocation(HDMSEntities context, decimal latitude, decimal longitude)
    {
        try
        {
            Latitude = latitude;
            Longitude = longitude;
            context.SaveChanges();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }
}

public partial class CustomerAddressMetadata
    {
  
    [DisplayName("Customer Address Id")]
    [Required]
    public int CustomerAddressId { get; set; }	
  
    [DisplayName("Customer Id")]
    [Required]
    public int CustomerId { get; set; }	
  
    [DisplayName("Address")]
    [Required(ErrorMessage = "The Address is required.")]
    [MaxLength(255)]
    public string Address { get; set; }	
  
    [DisplayName("Ward Id")]
    public int WardId { get; set; }

    [DisplayName("District Id")]
    [Required(ErrorMessage = "The District is required.")]
    public int DistrictId { get; set; }
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }	
  
    [DisplayName("Note")]
    public string Note { get; set; }

    [DisplayName("Latitude")]
    public Nullable<decimal> Latitude { get; set; }

    [DisplayName("Longitude")]
    public Nullable<decimal> Longitude { get; set; }
  
    [DisplayName("Requests")]
    public virtual ICollection<Request> Requests { get; set; }	
  
    [DisplayName("Customer")]
    public virtual Customer Customer { get; set; }	
  
    [DisplayName("Ward")]
    public virtual Ward Ward { get; set; }

    [DisplayName("District")]
    public virtual District District { get; set; }
    }
}


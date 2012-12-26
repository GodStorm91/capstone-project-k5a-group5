

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace HDMS.Models
{
[MetadataType(typeof(ContactMetadata))]
public partial class Contact { }

public partial class ContactMetadata
    {
  
    [DisplayName("Contact Id")]
    [Required]
    public int ContactId { get; set; }	
  
    [DisplayName("Customer Id")]
    [Required]
    public int CustomerId { get; set; }	
  
    [DisplayName("Title")]
    [MaxLength(255)]
    [Required]
    public string Title { get; set; }	
  
    [DisplayName("Name")]
    [MaxLength(255)]
    [Required(ErrorMessage = "The Full Name is required.")]
    public string Name { get; set; }	
  
    [DisplayName("Position")]
    [MaxLength(255)]
    public string Position { get; set; }	
  
    [DisplayName("Email Address")]
    [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter a valid e-mail adress")]
    [DataType(DataType.EmailAddress)]
    [Required(ErrorMessage = "The Email Address is required.")]
    [MaxLength(255)]
    public string EmailAddress { get; set; }	
  
    [DisplayName("Phone Number")]
    [Required(ErrorMessage = "The Phone Number is required.")]
    [MaxLength(255)]
    public string PhoneNumber { get; set; }	
  
    [DisplayName("Is Active")]
    [Required]
    public bool IsActive { get; set; }	

  
    [DisplayName("Customer")]
    public virtual Customer Customer { get; set; }	
    }
}


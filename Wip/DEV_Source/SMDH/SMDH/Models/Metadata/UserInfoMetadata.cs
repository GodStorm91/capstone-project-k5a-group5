using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SMDH.Models
{
    [MetadataType(typeof(UserInfoMetadata))]
    public partial class UserInfo { }

    public partial class UserInfoMetadata
    {

        [DisplayName("User Id")]
        [Required]
        public System.Guid UserId { get; set; }

        [DisplayName("Full Name")]
        [Required(ErrorMessage = "The Full Name is required.")]
        [MaxLength(255)]
        public string FullName { get; set; }

        [DisplayName("Customer Id")]
        public Nullable<int> CustomerId { get; set; }

        [DisplayName("Customer")]
        public virtual Customer Customer { get; set; }
    }
}


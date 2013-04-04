

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Utilities;

namespace SMDH.Models
{
    [MetadataType(typeof(HubMetadata))]
    public partial class Hub
    {
        public string FullAddress
        {
            get { return AddressHelper.GetFullAddress(this); }
        }
        public bool UpdateLocation(SMDHDataContext context, decimal latitude, decimal longitude)
        {
            try
            {
                Latitude = latitude;
                Longitude = longitude;
                context.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public partial class HubMetadata
    {

        [DisplayName("Hub Id")]
        [Required]
        public int HubId { get; set; }

        [DisplayName("Address")]
        [Required]
        [MaxLength(255)]
        public string Address { get; set; }

        [DisplayName("Ward Id")]
        public int WardId { get; set; }

        [DisplayName("District Id")]
        [Required]
        public int DistrictId { get; set; }

        [DisplayName("HubCategory Id")]
        [Required]
        public int HubCategoryId { get; set; }

        [DisplayName("Is Active")]
        [Required]
        public bool IsActive { get; set; }

        [DisplayName("Latitude")]
        public Nullable<decimal> Latitude { get; set; }

        [DisplayName("Longitude")]
        public Nullable<decimal> Longitude { get; set; }

        [DisplayName("Ward")]
        public virtual Ward Ward { get; set; }

        [DisplayName("District")]
        public virtual District District { get; set; }
    }
}


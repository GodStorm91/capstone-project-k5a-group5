
using System;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using SMDH.Models.Statuses;
using SMDH.Models;
using SMDH.Models.Concrete;

namespace SMDH.Models
{
    [MetadataType(typeof(CustomerMetadata))]
    public partial class Customer
    {
        public bool Delete(SMDHDataContext context)
        {
            
            try
            {
                var orders = context.Orders.Where(o => o.Request.CustomerId == this.CustomerId
                                                       && o.OrderStatus != (int)OrderStatus.Draft
                                                       && o.OrderStatus != (int)OrderStatus.Canceled
                                                       && o.OrderStatus != (int)OrderStatus.Delivered
                                                       && o.OrderStatus != (int)OrderStatus.Returned).ToList();
                if (orders.Count > 0) return false;
                this.IsActive = false;
                foreach (var contact in Contacts)
                {
                    contact.IsActive = false;
                }
                foreach (var address in CustomerAddresses)
                {
                    address.IsActive = false;
                }
                var draftRequests = Requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).ToArray();
                EFRequestsRepository requestRepo = new EFRequestsRepository();
                for (int i = 0; i < draftRequests.Length; i++)
                {
                    requestRepo.Cancel(draftRequests[i]);
                }
                context.SubmitChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
       
    }

    public partial class CustomerMetadata
    {

        [DisplayName("Customer Id")]
        [Required]
        public int CustomerId { get; set; }

        [DisplayName("Company Name")]
        [Required(ErrorMessage = "The Company Name is required.")]
        [MaxLength(1000)]
        public string CompanyName { get; set; }      

        [DisplayName("Phone Number")]
        [Required(ErrorMessage = "The Phone Number is required.")]
        [MaxLength(255)]
        public string PhoneNumber { get; set; }

        [DisplayName("Current Contract Code")]
        [Required(ErrorMessage = "The Contract Code is required.")]
        [MaxLength(255)]
        public string CurrentContractCode { get; set; }

        [DisplayName("Is Active")]
        [Required]
        public bool IsActive { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }


        [DisplayName("Contacts")]
        public virtual ICollection<Contact> Contacts { get; set; }

        [DisplayName("Customer Addresses")]
        public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }

        [DisplayName("Requests")]
        public virtual ICollection<Request> Requests { get; set; }

        [DisplayName("User Infoes")]
        public virtual ICollection<UserInfo> UserInfos { get; set; }
    }
}


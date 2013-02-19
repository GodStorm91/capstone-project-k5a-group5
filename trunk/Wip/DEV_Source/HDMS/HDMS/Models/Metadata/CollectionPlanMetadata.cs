

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Transactions;
using System.Web.Security;
using HDMS.Models.Statuses;
using System.Linq;

namespace HDMS.Models
{
    [MetadataType(typeof(CollectionPlanMetadata))]
    public partial class CollectionPlan
    {
        public CollectionPlanStatus Status
        {
            get
            {
                return (CollectionPlanStatus)this.CollectionPlanStatus;
            }
            set { this.CollectionPlanStatus = (int)value; }
        }

        public UserInfo CreatedByUserInfo
        {
            get
            {
                var context = new HDMSEntities();
                return context.UserInfoes.Find(CreatedByUserId);
            }
        }

        public UserInfo AssignedUserInfo
        {
            get
            {
                var context = new HDMSEntities();
                return context.UserInfoes.Find(CreatedByUserId);
            }
        }

        public MembershipUser CreatedByUser
        {
            get
            {
                return Membership.GetUser(CreatedByUserId);
            }
        }

        public MembershipUser AssignedUser
        {
            get
            {
                return Membership.GetUser(AssignedDeliveryStaffId);
            }
        }

        public void UpdateStatus(CollectionPlanStatus status)
        {
            Status = status;
        }

        public bool Create(HDMSEntities context, int[] requestIds)
        {
            try
            {
                CreatedByUserId = (Guid)Membership.GetUser().ProviderUserKey;
                CreatedDate = DateTime.Now;
                UpdateStatus(Statuses.CollectionPlanStatus.New);
                using (var trans = new TransactionScope())
                {
                    context.CollectionPlans.Add(this);
                    context.SaveChanges();

                    var requests = context.Requests.Where(r => requestIds.Contains(r.RequestId)
                                                               && r.RequestStatus == (int)RequestStatus.Approved).ToList();
                    if (requests.Count == requestIds.Length && Request.AddToCollectionPlan(context, this, requests))
                    {
                        trans.Complete();
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool Cancel(HDMSEntities context)
        {
            try
            {
                if (Status == Statuses.CollectionPlanStatus.Finished || Status == Statuses.CollectionPlanStatus.Canceled) return false;
                if (Requests.Any(r => r.Status != RequestStatus.PlannedForCollecting)) return false;
                var requests = Requests.ToArray();
                for (int i = 0; i < requests.Length; i++)
                {
                    requests[i].RemoveFromCollectionPlan(context, false);
                }
                Status = Statuses.CollectionPlanStatus.Canceled;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }


        public bool MarkAsFinished(HDMSEntities context, bool removeUncollectedRequests)
        {
            try
            {
                if (Status != Statuses.CollectionPlanStatus.Assigned) return false;
                if (!removeUncollectedRequests && Requests.Any(r => r.RequestStatus == (int)RequestStatus.PlannedForCollecting))
                {
                    return false;
                }
                var uncollectedRequests = Requests.Where(r => r.Status == RequestStatus.PlannedForCollecting).ToArray();
                for (int i = 0; i < uncollectedRequests.Length; i++)
                {
                    uncollectedRequests[i].RemoveFromCollectionPlan(context, false);
                }
                Status = Statuses.CollectionPlanStatus.Finished;
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }

    public partial class CollectionPlanMetadata
    {

        [DisplayName("Collection Plan Id")]
        [Required]
        public int CollectionPlanId { get; set; }

        [DisplayName("Created Date")]
        [Required]
        public System.DateTime CreatedDate { get; set; }

        [DisplayName("Created By User Id")]
        [Required]
        public System.Guid CreatedByUserId { get; set; }

        [DisplayName("Assigned Delivery Staff Id")]
        public Nullable<System.Guid> AssignedDeliveryStaffId { get; set; }

        [DisplayName("Finished Date")]
        public Nullable<System.DateTime> FinishedDate { get; set; }

        [DisplayName("Collection Plan Status")]
        [Required]
        public int CollectionPlanStatus { get; set; }

        [DisplayName("Note")]
        public string Note { get; set; }
        
        [DisplayName("Requests")]
        public virtual ICollection<Request> Requests { get; set; }

        public string CollectionOrder { get; set; }
    }
}


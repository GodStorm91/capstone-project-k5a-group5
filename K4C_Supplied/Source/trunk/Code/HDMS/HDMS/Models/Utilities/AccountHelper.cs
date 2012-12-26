using System;
using System.Linq;
using System.Web.Security;

namespace HDMS.Models.Utilities
{
    public class AccountHelper
    {
        public static string GetName(Guid userId)
        {
            var context = new HDMSEntities();
            var fullname = context.UserInfoes.Find(userId).FullName;
            return fullname + " (" + Membership.GetUser(userId).UserName + ")";
        }
    }
}
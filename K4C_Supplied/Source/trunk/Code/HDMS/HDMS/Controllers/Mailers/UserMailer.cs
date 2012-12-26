using System.Net.Mail;
using System.Web.Mvc;
using System.Web.Security;
using Mvc.Mailer;
using HDMS.Models;

namespace HDMS.Mailers
{
    public class UserMailer : MailerBase, IUserMailer
    {
        private HDMSEntities context = new HDMSEntities();
        public UserMailer()
        {
            //MasterName = "_Layout";
        }

        public virtual MvcMailMessage Welcome()
        {
            //ViewBag.Data = someObject;
            return Populate(x =>
            {
                x.Subject = "Welcome";
                x.ViewName = "Welcome";
                x.To.Add("some-email@example.com");
            });
        }

        public virtual MvcMailMessage PasswordReset(string userName, string passWord, string email)
        {
            var mailMessage = new MvcMailMessage{Subject = "Reset password"};
            var user = Membership.GetUser(userName);
            var userInfo = context.UserInfoes.Find(user.ProviderUserKey);
            ViewBag.FullName = userInfo.FullName;
            //ViewBag.Data = someObject;
            ViewBag.UserName = userName;
            ViewBag.Password = passWord;
            mailMessage.To.Add(email);
            PopulateBody(mailMessage, "PasswordReset",null);
            return mailMessage;
        }

        public virtual MvcMailMessage Register(string userName, string passWord, string email)
        {
            var mailMessage = new MvcMailMessage { Subject = "Register" };
            var user = Membership.GetUser(userName);
            var userInfo = context.UserInfoes.Find(user.ProviderUserKey);
            ViewBag.FullName = userInfo.FullName;
            //ViewBag.Data = someObject;
            ViewBag.UserName = userName;
            ViewBag.Password = passWord;
            mailMessage.To.Add(email);
            PopulateBody(mailMessage, viewName: "RegisterMailBody");
            return mailMessage;
        }
    }
}
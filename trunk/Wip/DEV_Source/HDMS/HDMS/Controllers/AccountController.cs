using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
//using HDMS.Mailers;
using HDMS.Mailers;
using HDMS.Models;
using Mvc.Mailer;

namespace HDMS.Controllers
{
    public partial class AccountController : Controller
    {

        private HDMSEntities context = new HDMSEntities();

        //Add reference for mailer
        private IUserMailer _userMailer = new UserMailer();
        public IUserMailer UserMailer
        {
            get { return _userMailer; }
            set { _userMailer = value; }
        }

        //
        // GET: /Account/LogOn

        public virtual ActionResult LogOn()
        {
            var roles = Roles.GetRolesForUser(User.Identity.Name).ToList();
            if (roles.Contains("Hub")) return Redirect("/Hub/");
            if (roles.Contains("Customer")) return Redirect("/Customer/");
            if (roles.Contains("Office Staff")) return RedirectToAction("Index", "Dashboard");
            if (roles.Contains("Admin")) return RedirectToAction("Index", "User");
            return View();
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public virtual ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (Membership.ValidateUser(model.UserName, model.Password))
                    {
                        FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                        if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                            && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                        {
                            return Redirect(returnUrl);
                        }
                        else
                        {
                            return RedirectToAction("Index", "Home");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "The user name or password provided is incorrect.");
                    }
                }

                // If we got this far, something failed, redisplay form
                return View(model);
            }
            catch (Exception)
            {
                return View(model);
            }
        }

        //
        // GET: /Account/LogOff

        public virtual ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register
        [Authorize(Roles = "Admin")]
        public virtual ActionResult Register()
        {
            //ViewBag.PossibleCustomers = new SelectList(context.Customers.ToArray(), "CustomerId", "CompanyName");
            ViewBag.PossibleCustomers = context.Customers.ToList();
            return View();
        }

        //
        // POST: /Account/Register
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public virtual ActionResult Register(RegisterModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // Attempt to register the user
                    MembershipCreateStatus createStatus;

                    string newPass = Membership.GeneratePassword(8, 0);
                    var user = Membership.CreateUser(model.UserName, newPass, model.Email, null, null, true, null, out createStatus);

                    var fullName = Request["FullName"];
                    if (string.IsNullOrWhiteSpace(fullName)) return RedirectToAction("Register");
                    var usertype = Request["Type"];

                    UserInfo userInfo = new UserInfo();
                    if (user != null && user.ProviderUserKey != null) userInfo.UserId = (Guid)user.ProviderUserKey;
                    userInfo.FullName = fullName;
                    context.UserInfoes.Add(userInfo);


                    if (usertype == "Customer")
                    {
                        var customer = Request["customer"];
                        userInfo.CustomerId = int.Parse(customer);
                        Roles.AddUserToRole(model.UserName, "Customer");
                    }
                    else
                    {
                        var checkDeliveryStaff = Request["deliveryStaff"];
                        var checkOfficeStaff = Request["officeStaff"];
                        var checkAdmin = Request["admin"];
                        //Delivery Staff
                        if (checkDeliveryStaff != null)
                        {
                            //DeliveryStaff deliveryStaff = new DeliveryStaff();
                            //if (user != null && user.ProviderUserKey != null) deliveryStaff.UserId = (Guid)user.ProviderUserKey;
                            //deliveryStaff.DeliveryStaffStatus = 1;
                            //deliveryStaff.IsActive = true;
                            //context.DeliveryStaffs.Add(deliveryStaff);
                            if (checkOfficeStaff == null && checkAdmin == null)
                            {
                                Roles.AddUserToRole(model.UserName, "Delivery Staff");
                            }
                            else if (checkOfficeStaff != null && checkAdmin == null)
                            {
                                Roles.AddUserToRole(model.UserName, "Delivery Staff");
                                Roles.AddUserToRole(model.UserName, "Office Staff");
                            }
                            else if (checkOfficeStaff != null && checkAdmin != null)
                            {
                                Roles.AddUserToRole(model.UserName, "Delivery Staff");
                                Roles.AddUserToRole(model.UserName, "Office Staff");
                                Roles.AddUserToRole(model.UserName, "Admin");
                            }
                            else if (checkOfficeStaff == null && checkAdmin != null)
                            {
                                Roles.AddUserToRole(model.UserName, "Delivery Staff");
                                Roles.AddUserToRole(model.UserName, "Admin");
                            }

                        }
                        else
                        {
                            if (checkOfficeStaff != null && checkAdmin == null)
                            {
                                Roles.AddUserToRole(model.UserName, "Office Staff");
                            }
                            else if (checkOfficeStaff == null && checkAdmin != null)
                            {
                                Roles.AddUserToRole(model.UserName, "Admin");
                            }
                            else if (checkOfficeStaff != null && checkAdmin != null)
                            {
                                Roles.AddUserToRole(model.UserName, "Admin");
                                Roles.AddUserToRole(model.UserName, "Office Staff");
                            }
                        }
                    }
                    context.SaveChanges();

                    var client = new SmtpClientWrapper();


                    client.SendCompleted += (sender, e) =>
                    {
                        if (e.Error != null || e.Cancelled)
                        {
                            // Handle Error
                        }

                        //Use e.UserState
                    };

                    UserMailer.PasswordReset(model.UserName, newPass, model.Email).SendAsync(null, client);
                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        //FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", ErrorCodeToString(createStatus));
                    }
                }

                // If we got this far, something failed, redisplay form
                return RedirectToAction("Register");
            }
            catch (Exception)
            {
                return RedirectToAction("Register");
            }
        }

        //
        // GET: /Account/ChangePassword

        [Authorize]
        public virtual ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/ChangePassword

        [Authorize]
        [HttpPost]
        public virtual ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {

                // ChangePassword will throw an exception rather
                // than return false in certain failure scenarios.
                bool changePasswordSucceeded;
                try
                {
                    MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
                    changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                }
                catch (Exception)
                {
                    changePasswordSucceeded = false;
                }

                if (changePasswordSucceeded)
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public virtual ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion


    }
}
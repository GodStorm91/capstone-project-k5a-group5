//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using System.Web.Security;
//using DemoDataTable.Controllers;
//using HDMS.Mailers;
//using HDMS.Models;
//using Mvc.Mailer;


//namespace HDMS.Controllers
//{
//    [Authorize(Roles = "Admin")]
//    public class UserController : Controller
//    {
//        private HDMSEntities context = new HDMSEntities();

//        //Add reference for mailer
//        private IUserMailer _userMailer = new UserMailer();
//        public IUserMailer UserMailer
//        {
//            get { return _userMailer; }
//            set { _userMailer = value; }
//        }



//        //
//        // GET: /User/

//        public ActionResult Index()
//        {
//            var showDisabledUsers = false;
//            if (!string.IsNullOrEmpty(Request["ShowDisabledUsers"]))
//            {
//                if (Request["ShowDisabledUsers"].ToLower() == "yes")
//                {
//                    showDisabledUsers = true;
//                }
//            }
//            var users = context.UserInfoes.Where(u => u.CustomerId == 1);
//            ViewBag.PossibleCustomers = context.Customers;
//            ViewBag.PossibleRoles = Roles.GetAllRoles();
//            ViewBag.ShowDisabledUsers = showDisabledUsers ? "true" : "false";

//            return View();
//        }


//        public ActionResult LoadUser(string searchUser, string roleName, JQueryDataTableParamModel param, bool showDisabledUsers)
//        {
//            try
//            {
//                //ViewBag.RolesForUser = "";
//                var allUser = Membership.GetAllUsers();
//                IEnumerable<MembershipUser> filteredUser = null;
//                if (!String.IsNullOrEmpty(searchUser))
//                {
//                    filteredUser = allUser.Cast<MembershipUser>().Where(c => c.UserName.Contains(searchUser));
//                }
//                else
//                {
//                    filteredUser = allUser.Cast<MembershipUser>();
//                }

//                var filterDecending = filteredUser.OrderBy(c => c.UserName);

//                if (showDisabledUsers)
//                {
//                    var query = (from c in filterDecending select c).ToList();

//                    var displayedCategory = filterDecending.Skip(param.iDisplayStart).Take(param.iDisplayLength);

//                    var model = from u in displayedCategory
//                                select
//                                new[]
//                            {
//                                u.UserName,u.Email,getRoleUserList(u.UserName),getCustomerName(u.UserName),
//                                u.CreationDate.ToString("dd/MM/yyyy"),"",Convert.ToString(u.IsApproved)
//                            };

//                    //  var result=  model.ToArray();
//                    return Json(new
//                    {

//                        sEcho = param.sEcho,
//                        iTotalRecords = filterDecending.Count(),
//                        iTotalDisplayRecords = query.Count(),
//                        aaData = model
//                    }, JsonRequestBehavior.AllowGet);
//                }
//                else
//                {
//                    var query = (from c in filterDecending select c).ToList();

//                    var displayedCategory = filterDecending.Where(c => c.IsApproved).Skip(param.iDisplayStart).Take(param.iDisplayLength);


//                    var model = from u in displayedCategory
//                                where u.IsApproved
//                                select
//                                new[]
//                            {
//                                u.UserName,u.Email,getRoleUserList(u.UserName),getCustomerName(u.UserName) ,
//                                u.CreationDate.ToString("dd/MM/yyyy"),"", u.IsApproved.ToString()
//                            };
//                    //  var result=  model.ToArray();
//                    return Json(new
//                    {
//                        sEcho = param.sEcho,
//                        iTotalRecords = filterDecending.Where(c => c.IsApproved).Count(),
//                        iTotalDisplayRecords = query.Where(c => c.IsApproved).Count(),
//                        aaData = model
//                    }, JsonRequestBehavior.AllowGet);
//                }
//            }
//            catch (Exception)
//            {
//                return Json(new
//                    {
//                    }, JsonRequestBehavior.AllowGet);
//            }

//        }


//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                context.Dispose();
//            }
//            base.Dispose(disposing);
//        }

//        private string getRoleUserList(string username)
//        {
//            try
//            {
//                var listUserRole = Roles.GetRolesForUser(username).ToList();
//                var rolelist = "";
//                foreach (var role in listUserRole)
//                {
//                    if (rolelist.Length > 0)
//                    {
//                        rolelist = rolelist + ", " + role;
//                    }
//                    else
//                    {
//                        rolelist = role;
//                    }
//                }
//                return rolelist;
//            }
//            catch (Exception)
//            {
//                return "";
//            }
//        }

//        private string getCustomerName(string username)
//        {
//            string customerName = "N/A";
//            try
//            {
//                var user = Membership.GetUser(username);
//                var userInfo = context.UserInfoes.Find(user.ProviderUserKey);
//                if (userInfo.CustomerId != null)
//                {
//                    Customer customer = context.Customers.Where(d => d.CustomerId == userInfo.CustomerId).SingleOrDefault();
//                    customerName = customer.CompanyName;
//                }

//                return customerName;
//            }
//            catch (Exception)
//            {
//                return customerName;
//            }
//        }


//        // POST: /User/ResetPassword
//        //[Authorize(Roles = "Admin")]
//        [HttpPost]
//        public virtual ActionResult ResetPassword(string username)
//        {
//            try
//            {
//                var client = new SmtpClientWrapper();


//                client.SendCompleted += (sender, e) =>
//                {
//                    if (e.Error != null || e.Cancelled)
//                    {
//                        // Handle Error
//                    }

//                    //Use e.UserState
//                };

//                MembershipUser user = Membership.GetUser(username);
//                //string newpass = Membership.GeneratePassword(5, 0);
//                //user.ChangePassword(user.GetPassword(), newpass);
//                string newpass = user.ResetPassword();
//                string email = user.Email;
//                context.SaveChanges();
//                UserMailer.PasswordReset(username, newpass, email).SendAsync(null, client);
//                return Json(new {ok = true }, JsonRequestBehavior.AllowGet);

//            }
//            catch (Exception ex)
//            {
//                return Json(new { ok = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
//            }
//        }

//        //POST: User/UpdateRole
//        [Authorize(Roles = "Admin")]
//        [HttpPost]
//        public ActionResult Update(string username)
//        {
//            try
//            {
//                MembershipUser user = Membership.GetUser(username);
//                aspnet_Users users = context.aspnet_Users.Single(x => x.UserName == username);
//                UserInfo userInfo = context.UserInfoes.Find((Guid)user.ProviderUserKey);
//                if (userInfo.CustomerId != null)
//                {
//                    ViewBag.CustomerName = userInfo.CustomerId;
//                }
//                else
//                {
//                    ViewBag.CustomerName = null;
//                }
//                ViewBag.UserName = username;
//                ViewBag.PossibleCustomers = context.Customers.ToList();
//                ViewBag.RolesForUser = Roles.GetRolesForUser(username).ToList();
//                // ViewBag.CustomerName = userInfo.Customer.CompanyName;
//                return View(users);
//            }
//            catch (Exception)
//            {
//                return Json(new
//                {
//                }, JsonRequestBehavior.AllowGet);
//            }
//        }

//        //POST
//        [Authorize(Roles = "Admin")]
//        [HttpPost]
//        public ActionResult UpdateUserRole(string username)
//        {
//            try
//            {
//                var rolename = Request["checkbox[]"].Split(',');

//                //string username = users.UserName;
//                //                var rolename = new string[];
//                string[] roles = Roles.GetRolesForUser(username);
//                ViewBag.RolesForUser = roles;

//                var user = Membership.GetUser(username);

//                Roles.RemoveUserFromRoles(username, roles);
//                var userType = Request["Type"];

//                UserInfo userInfo = context.UserInfoes.Find((Guid)user.ProviderUserKey);

//                userInfo.CustomerId = null;

//                if (userType == "Customer")
//                {
//                    var customer = Request["customerName"];
//                    userInfo.CustomerId = int.Parse(customer);
//                    Roles.AddUserToRole(username, "Customer");
//                    context.SaveChanges();
//                }
//                else
//                {
//                    foreach (var role in rolename)
//                    {
//                        Roles.AddUserToRole(username, role);
//                        context.SaveChanges();
//                    }
//                }


//                return RedirectToAction("Index");

//                //var result = new { ok = true, message = "" };

//                //return Json(result, JsonRequestBehavior.AllowGet);

//            }
//            catch (Exception ex)
//            {
//                return Json(new { ok = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
//            }
//        }

//        public ActionResult GetRoleList()
//        {
//            return Json(Roles.GetAllRoles(), JsonRequestBehavior.AllowGet);
//        }


//        //POST: DELETE USER
//        [Authorize(Roles = "Admin")]
//        public ActionResult DeleteUser(string username, string rolename)
//        {

//            try
//            {

//                var deleteUser = Membership.GetUser(username);
//                deleteUser.IsApproved = !deleteUser.IsApproved;

//                Membership.UpdateUser(deleteUser);

//                return Json(new { isActive = deleteUser.IsApproved }, JsonRequestBehavior.AllowGet);

//            }
//            catch (Exception ex)
//            {
//                return Json(new { ok = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
//            }
//        }
//    }
//}

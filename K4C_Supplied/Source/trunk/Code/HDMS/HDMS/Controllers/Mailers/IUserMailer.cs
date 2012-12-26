using Mvc.Mailer;

namespace HDMS.Mailers
{ 
    public interface IUserMailer
    {
			MvcMailMessage Welcome();
			MvcMailMessage PasswordReset(string userName, string passWord, string email);
            MvcMailMessage Register(string userName, string passWord, string email);
	}
}
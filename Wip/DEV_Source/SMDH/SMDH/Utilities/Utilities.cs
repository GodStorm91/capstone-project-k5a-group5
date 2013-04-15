using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using SMDH.Models;
using SMDH.Models.Statuses;
using System.Net.Mail;

namespace SMDH.Utilities
{
    public class Utilities
    {
        public static void SendMail(string passCode, string toEmail)
        {
            try
            {
                // Gmail Address from where you send the mail
                var fromAddress = " test.hdms@gmail.com";
                // any address where the email will be sending
                var toAddress = toEmail;
                //Password of your gmail address
                const string fromPassword = "HdmsTest1";
                // Passing the values and make a email formate to display
                string subject = "Order Passcode";
                string body = "From: " + "HDMS System" + "\n";
                body += "Email: " + "You have create new order: " + passCode + "\n";
                body += "Subject: " + "test" + "\n";

                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 20000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
            }
            catch (Exception exception)
            {

                throw;
            }
        }

        public static void sendmails(string passcode,string toemail)
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            mailMessage.From = new MailAddress("test.hdms@gmail.com");
            mailMessage.To.Add(new MailAddress(toemail));
            mailMessage.Subject = "Order Information";
            mailMessage.Body = "Thanks for shopping with us.<br/>Your passcode is : " + passcode +"<br/>.We will contact to you if your order in hub.";
            mailMessage.IsBodyHtml = true;
            SmtpClient smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("test.hdms@gmail.com", "HdmsTest1");
                smtp.Timeout = 20000;
            }
            Object userState = mailMessage;

            //Attach event handler for async callback
            smtp.SendCompleted += new SendCompletedEventHandler(smtpClient_SendCompleted);

            try
            {
                //Send the email asynchronously
                smtp.SendAsync(mailMessage, userState);
            }
            catch (SmtpException smtpEx)
            {
                //Error handling here
            }
            catch (Exception ex)
            {
                //Error handling here
            }
        }

        public static void smtpClient_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {

            //Get UserState as MailMessage instance from SendMail()
            MailMessage mailMessage = e.UserState as MailMessage;

            if (e.Cancelled)
            {
                string s = "Sending of email message was cancelled. Address=" + mailMessage.To[0].Address;
            }

            if (e.Error != null)
            {
                string s = "Error occured, info=" + e.Error.Message;
            }
            else
            {
                string s = "Mail sent successfully";
            }

        }

        public static void SendMailWithoutPasscode(string toEmail)
        {
            System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();
            mailMessage.From = new MailAddress("test.hdms@gmail.com");
            mailMessage.To.Add(new MailAddress(toEmail));
            mailMessage.Subject = "Order Information";
            mailMessage.Body = "Your Order in hub right now.<br/>Please come and take it after 7 days from now.<br/>.Thanks and best regards";
            mailMessage.IsBodyHtml = true;
            SmtpClient smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("test.hdms@gmail.com", "HdmsTest1");
                smtp.Timeout = 20000;
            }
            Object userState = mailMessage;

            //Attach event handler for async callback
            smtp.SendCompleted += new SendCompletedEventHandler(smtpClient_SendCompleted);

            try
            {
                //Send the email asynchronously
                smtp.SendAsync(mailMessage, userState);
            }
            catch (SmtpException smtpEx)
            {
                //Error handling here
            }
            catch (Exception ex)
            {
                //Error handling here
            }
        }

        public static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }

        public static string CreateRandomPw(string phone)
        {
            string second = DateTime.Now.Second.ToString();
            string date = DateTime.Now.Day.ToString();
            string month = DateTime.Now.Month.ToString();
            string year = DateTime.Now.Year.ToString();
            string passcode = second + date + month + year + phone.Substring(phone.Length - Math.Min(4, phone.Length));
            return passcode;
        }

        public static void UpdateOrderInHubStatus()
        {
            var context = new SMDHDataContext();
            var orderInHub = context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Delivering);
            foreach (var order in orderInHub)
            {
                if (order.DeliveryDate.Value.AddDays(7) > DateTime.Now)
                {
                    order.OrderStatus = (int)OrderStatus.Expired;
                    order.DueDate = DateTime.Now.AddDays(3);
                }
            }

            //user have three more days to configure 
            var orderExpired = context.Orders.Where(o => o.OrderStatus == (int)OrderStatus.Expired);
            foreach (var order in orderExpired)
            {
                if (order.DueDate > DateTime.Now)
                {
                    order.OrderStatus = (int)OrderStatus.WaitingForReturn;
                }
            }

            context.SubmitChanges();
        }        
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using SMDH.Models;
using SMDH.Models.Statuses;

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
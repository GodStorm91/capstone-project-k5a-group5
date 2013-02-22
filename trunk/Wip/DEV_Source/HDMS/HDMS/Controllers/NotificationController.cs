using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HDMS.Views.Shared;

namespace HDMS.Controllers
{
    public class NotificationController : AsyncController
    {
        //
        // GET: /Notification/

        public void IndexAsync()
        {
            AsyncManager.OutstandingOperations.Increment();
            AsyncNotificationChecker.CheckForNotificationAsync((hasNotifications, notificationInformation, linkToNotification) =>
                {
                    AsyncManager.Parameters["hasNotifications"] = hasNotifications;
                    AsyncManager.Parameters["notificationInformation"] = notificationInformation;
                    AsyncManager.Parameters["linkToNotification"] = linkToNotification;
                    AsyncManager.OutstandingOperations.Decrement();
                });
        }

        private class IndexResponse
        {
            public bool d { get; set; }
            public string content { get; set; }
            public string link { get; set; }
        }

        public JsonResult IndexCompleted(bool hasNotifications, string notificationInformation, string linkToNotification)
        {
            return this.Json(new IndexResponse() { d = hasNotifications, content = notificationInformation, link = linkToNotification });
        }

    }
}

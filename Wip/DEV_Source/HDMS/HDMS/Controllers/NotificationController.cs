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
            AsyncNotificationChecker.CheckForNotificationAsync(hasNotifications =>
                {
                    AsyncManager.Parameters["hasNotifications"] = hasNotifications;
                    AsyncManager.OutstandingOperations.Decrement();
                });
        }

        private class IndexResponse
        {
            public bool d { get; set; }
        }

        public JsonResult IndexCompleted(bool hasNotifications)
        {
            return this.Json(new IndexResponse() { d = hasNotifications });
        }

    }
}

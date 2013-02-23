using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using HDMS.Models;
using HDMS.Models.Configuration;

namespace HDMS.Views.Shared
{
    public static class AsyncNotificationChecker
    {

        public delegate void CheckForNotificationResponse(bool hasNotification, string notificationInformation, string linkToNotification);        

        public static IAsyncResult CheckForNotificationAsync(CheckForNotificationResponse resp)
        {
            return new MyAsyncResult(resp);
        }

        private class MyAsyncResult : IAsyncResult
        {
            private HDMSEntities context = new HDMSEntities();            
            private readonly CheckForNotificationResponse mCheckForNotificationResp;
            private readonly Thread mThread;
            private readonly AutoResetEvent mWait;
            bool hasNotification = false;
            string notificationInformation = "";
            string linkToNotification = "";

            public MyAsyncResult(CheckForNotificationResponse checkForNotificationResp)
            {
                mCheckForNotificationResp = checkForNotificationResp;

                CheckNotification();                

                mWait = new AutoResetEvent(false);

                mThread = new Thread(new ThreadStart(() =>
                {

                    Thread.Sleep(TimeSpan.FromSeconds(2));
                    // notify that the long operation is complete:
                    checkForNotificationResp(hasNotification,notificationInformation,linkToNotification);

                    mWait.Set();
                }));

                mThread.Start();

            }

            private void CheckNotification()
            {
                var requests = new List<Request>();
                requests = context.Requests.OrderBy(r => r.RequestId).ToList();
                requests = requests.Where(r => r.Status == Models.Statuses.RequestStatus.New).ToList();

                if ((requests.Count > ConfigurationModel.MaxRequest) && (requests.Count != ConfigurationModel.CurrentNewRequests))
                {
                    ConfigurationModel.CurrentNewRequests = requests.Count;
                    hasNotification =  true;
                    linkToNotification = "/CollectionPlans/AutoSchedulePlan";
                    notificationInformation = "You should create new Collection Plan now";
                }else 
                {
                    hasNotification =  false;
                }

            }

            public object AsyncState
            {
                get { return null; }
            }

            public System.Threading.WaitHandle AsyncWaitHandle
            {
                get { return mWait; }
            }

            public bool CompletedSynchronously
            {
                get { return false; }
            }

            public bool IsCompleted
            {
                get { return mThread.IsAlive; }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;

namespace HDMS.Views.Shared
{
    public static class AsyncNotificationChecker
    {

        public delegate void CheckForNotificationResponse(bool hasNotification);

        public static IAsyncResult CheckForNotificationAsync(CheckForNotificationResponse resp)
        {
            return new MyAsyncResult(resp);
        }

        private class MyAsyncResult : IAsyncResult
        {
            private static int mCount = 0;
            private readonly CheckForNotificationResponse mCheckForEmailResponse;
            private readonly Thread mThread;
            private readonly AutoResetEvent mWait;

            public MyAsyncResult(CheckForNotificationResponse checkForNotificationResp)
            {
                mCheckForEmailResponse = checkForNotificationResp;

                bool hasNotifications = true;

                //RequestModel.NumRequest = RequestModel.NumRequest > 5 ? 0 : RequestModel.NumRequest;

                mWait = new AutoResetEvent(false);

                mThread = new Thread(new ThreadStart(() =>
                {

                    Thread.Sleep(TimeSpan.FromSeconds(2));
                    // notify that the long operation is complete:
                    checkForNotificationResp(hasNotifications);

                    mWait.Set();
                }));

                mThread.Start();

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
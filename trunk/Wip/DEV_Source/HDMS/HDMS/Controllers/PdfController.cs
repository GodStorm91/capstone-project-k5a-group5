using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace HDMS.Controllers
{
    public class PdfController : Controller
    {
        //
        // GET: /Pdf/

        public string Index()
        {
            //// Render the view html to a string.
            //string htmlText = this.htmlViewRenderer.RenderViewToString(this, viewName, model);

            //// Let the html be rendered into a PDF document through iTextSharp.
            //byte[] buffer = standardPdfRenderer.Render(htmlText, pageTitle);

            //// Return the PDF as a binary stream to the client.
            //return new BinaryContentResult(buffer, "application/pdf");

            //var deliveryPlansController = new CustomersController();Request
            //var result = deliveryPlansController.Index();
            //return null;

            var url = Request.ApplicationPath + "Customers/";
            WebRequest request = WebRequest.Create(url);

            request.Method = "GET";
            //request.ContentType = "application/html; charset=utf-8";

            using (Stream s = request.GetResponse().GetResponseStream())
            {
                using (StreamReader sr = new StreamReader(s))
                {
                    var str = sr.ToString();
                    return str;
                }
            }
        }

    }
}

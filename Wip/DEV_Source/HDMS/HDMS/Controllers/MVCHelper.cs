using System;
using System.IO;
using System.Web.Mvc;

public class MVCHelper
{
    public static string RenderPartialViewToString(Controller controller, string viewName, object model)
    {
        controller.ViewData.Model = model;
        try
        {
            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);
                ViewContext viewContext = new ViewContext(controller.ControllerContext, viewResult.View, controller.ViewData, controller.TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
     }

    //public static string RenderPartialViewToString(Controller controller, string viewName, ViewDataDictionary viewData, object model)
    //{
    //    controller.ViewData.Model = model;
    //    try
    //    {
    //        using (StringWriter sw = new StringWriter())
    //        {
    //            ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);
    //            viewResult.View.Render(viewContext, sw);

    //            return sw.GetStringBuilder().ToString();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        return ex.ToString();
    //    }
    //}

    public static string RenderRazorViewToString(Controller controller, string viewName, object model, ViewContext viewContext)
    {
        viewContext.ViewData.Model = model;
        using (var sw = new StringWriter())
        {
            var viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);
            viewResult.View.Render(viewContext, sw);
            viewResult.ViewEngine.ReleaseView(controller.ControllerContext, viewResult.View);
            return sw.GetStringBuilder().ToString();
        }
    }
}
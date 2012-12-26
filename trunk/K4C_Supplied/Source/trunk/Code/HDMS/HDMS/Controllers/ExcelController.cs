using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.OleDb;
using System.Data;
using HDMS.Models;

namespace HDMS.Controllers
{
    public class ExcelController : Controller
    {
        private HDMSEntities context = new HDMSEntities();
        //
        // GET: /Excel/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase excelFile)
        {
            if (excelFile != null)
            {
                string savedFileName = "~/Excel/" + excelFile.FileName;
                excelFile.SaveAs(Server.MapPath(savedFileName));

                var connectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 12.0;", Server.MapPath(savedFileName));
                var adapter = new OleDbDataAdapter("SELECT * FROM [Orders$]", connectionString);
                var ds = new DataSet();
                adapter.Fill(ds, "results");
                DataTable data = new DataTable();
                data = ds.Tables["results"];

                var orders = new List<Order>();

                var adapterItem = new OleDbDataAdapter("SELECT * FROM [Items$]", connectionString);
                var dsItem = new DataSet();
                adapterItem.Fill(dsItem, "results");
                DataTable dataItem = new DataTable();
                dataItem = dsItem.Tables["results"];

                var items = new List<Item>();

                Request request = new Request();


                for (int i = 0; i < data.Rows.Count; i++)
                {
                    var no = data.Rows[i].Field<string>("No");
                    var drOption = data.Rows[i].Field<string>("DeliveryOption");
                    var orPaymentType = data.Rows[i].Field<string>("OrderPaymentType");
                    var districtName = data.Rows[i].Field<string>("District");
                    var amount = data.Rows[i].Field<string>("Amount");

                    var deliveryOption = context.DeliveryOptions.Single(dr => dr.Name == drOption);
                    var orderPaymentType = context.OrderPaymentTypes.Single(op => op.Name == orPaymentType);
                    var district = context.Districts.Single(di => di.Name == districtName);

                    Order order = new Order();
                    order.RequestId = 1;
                    order.DeliveryOptionId = deliveryOption.DeliveryOptionId;
                    order.OrderPaymentTypeId = orderPaymentType.OrderPaymentTypeId;
                    order.ReceiverName = data.Rows[i].Field<string>("ReceiverName");
                    order.ReceiverPhone = data.Rows[i].Field<string>("ReceiverPhone");
                    order.ReceiverAddress = data.Rows[i].Field<string>("ReceiverAddress");
                    order.ReceiverAddressDistrictId = district.DistrictId;
                    order.AmountToBeCollectedFromReceiver = int.Parse(amount);
                    //order.OrderStatus = 1;
                    order.Note = data.Rows[i].Field<string>("Note");


                    orders.Add(order);
                    context.Orders.Add(order);
                    //context.SaveChanges();

                    for (int j = 0; j < dataItem.Rows.Count; j++)
                    {
                        var orderNo = dataItem.Rows[j].Field<string>("OrderNo");
                        if (no == orderNo)
                        {
                            Item item = new Item();
                            //item.OrderId = int.Parse(orderNo);
                            item.OrderId = order.OrderId;
                            item.Name = dataItem.Rows[j].Field<string>("Name");
                            item.Quantity = int.Parse(dataItem.Rows[j].Field<string>("Quantity"));
                            if (dataItem.Rows[j].Field<string>("IsFragile") == "True")
                            {
                                item.IsFragile = true;
                            }
                            else
                            {
                                item.IsFragile = false;
                            }
                            if (dataItem.Rows[j].Field<string>("HasHighValue") == "True")
                            {
                                item.HasHighValue = true;
                            }
                            else
                            {
                                item.HasHighValue = false;
                            }
                            item.Size = dataItem.Rows[j].Field<string>("Size");
                            item.Weight = dataItem.Rows[j].Field<string>("Weight");
                            item.Note = dataItem.Rows[j].Field<string>("Note");

                            items.Add(item);
                            context.Items.Add(item);
                            context.SaveChanges();
                        }
                        //ViewBag.Items = context.Items.Where(it => it.OrderId == order.OrderId).ToList();
                    }
                }
                return View("UploadComplete", orders);
            }
            return RedirectToAction("Error", "Excel");
        }

        public ActionResult Error()
        {
            return View();
        }
    }
}

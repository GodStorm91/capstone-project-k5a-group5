using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;

namespace SMDH.Models.Concrete
{
    public class EFProductsRepository : IProductRepository
    {
        private SMDHDataContext context = new SMDHDataContext();

        public IQueryable<Product> Products
        {
            get { return context.Products; }
        }

        public IQueryable<Item> Items
        {
            get { return context.Items; }
        }

        public IQueryable<Customer> Customers
        {
            get { return context.Customers; }
        }


        public Product Find(int productId)
        {
            var product = context.Products.Where(p => p.ProductId == productId).FirstOrDefault();
            return product;
        }

        public bool Remove(int productID)
        {
            var product = Find(productID);
            context.Products.DeleteOnSubmit(product);
            context.SubmitChanges();
            return true;
        }

        public bool Create(Product product)
        {
            product.CustomerId = 1;
            product.IsPermanent = true;
            context.Products.InsertOnSubmit(product);
            context.SubmitChanges();
            return true;
        }

        public bool Edit(Product product)
        {
            Product pro = Find(product.ProductId);
            pro.Name = product.Name;
            pro.Size = product.Size;
            pro.ProductWeight = product.ProductWeight;
            pro.ProductPrice = product.ProductPrice;
            pro.ImageURL = product.ImageURL;
            context.SubmitChanges();
            return true;
        }




        public List<Product> GetProductsByCustomerId(int customerId)
        {
            return context.Products.Where(o => o.CustomerId == customerId).ToList();
        }
    }
}
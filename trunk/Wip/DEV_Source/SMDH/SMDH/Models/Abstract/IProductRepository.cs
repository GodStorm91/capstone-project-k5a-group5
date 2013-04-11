using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using SMDH.Models;
using SMDH.Models.ViewModels;

namespace SMDH.Models.Abstract
{
    public interface IProductRepository
    {
        IQueryable<Product> Products { get; }
        IQueryable<Item> Items { get; }
        IQueryable<Customer> Customers { get; }

        Product Find(int productId);

        bool Remove(int productId);
        bool Create(Product product,int customerid);
        bool Edit(Product product);

        List<Product> GetProductsByCustomerId(int customerId);
    }
}
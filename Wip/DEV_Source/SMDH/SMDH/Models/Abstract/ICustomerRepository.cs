using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMDH.Models.Abstract
{
    public interface ICustomerRepository
    {
        IQueryable<Customer> Customers { get;}

        bool Delete(Customer customer);

        List<Customer> GetActiveCustomer();

        Customer Find(int id);

        List<Contact> GetCustomerContacts(int customerId);

        List<CustomerAddress> GetCustomerAddresses(int customerId);

        void Add(Customer cust);

        void Save(Customer cust);        
    }
}

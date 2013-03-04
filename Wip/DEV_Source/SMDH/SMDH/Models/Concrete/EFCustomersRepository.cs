using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SMDH.Models.Abstract;
using SMDH.Models.ViewModels;
using SMDH.Models.Statuses;
namespace SMDH.Models.Concrete
{
    public class EFCustomersRepository: ICustomerRepository
    {
        private SMDHDataContext context = new SMDHDataContext();

        public IQueryable<Customer> Customers
        {
            get
            {
                return context.Customers;
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public bool Delete(Customer customer)
        {
            try
            {
                var orders = context.Orders.Where(o => o.Request.CustomerId == customer.CustomerId
                    && o.OrderStatus != (int)OrderStatus.Draft
                    && o.OrderStatus != (int)OrderStatus.Canceled
                    && o.OrderStatus != (int)OrderStatus.Delivered
                    && o.OrderStatus != (int)OrderStatus.Returned).ToList();
                if (orders.Count > 0) return false;
                customer.IsActive = false;
                foreach (var contact in customer.Contacts)
                {
                    contact.IsActive = false;
                }

                foreach (var address in customer.CustomerAddresses)
                {
                    address.IsActive = false;
                }

                var draftRequests = customer.Requests.Where(r => r.RequestStatus == (int)RequestStatus.Draft).ToArray();
                var requestRepo = new EFRequestsRepository();
                for (int i = 0; i < draftRequests.Length; i++)
                {
                    requestRepo.Cancel(draftRequests[i]);
                }
                context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }


        public List<Customer> GetActiveCustomer()
        {            
            return context.Customers.Where(o => o.IsActive == true).ToList();
        }

        public Customer Find(int id)
        {
            return context.Customers.Single(o => o.CustomerId == id);
        }

        public List<Contact> GetCustomerContacts(int customerId)
        {
            return context.Contacts.Where(ca => ca.CustomerId == customerId).ToList();

        }

        public List<CustomerAddress> GetCustomerAddresses(int customerId)
        {
            return context.CustomerAddresses.Where(ca => ca.CustomerId == customerId).ToList();
        }


        public void Add(Customer cust)
        {
            context.Customers.InsertOnSubmit(cust);
            context.SubmitChanges();
        }

        public void Save(Customer cust)
        {
            context.SubmitChanges();
        }
    }
}
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface ICustomerService
    {
        public List<Customer> GetAll();

        public List<Customer> GetAllActive();

        Customer AddCustomer(Customer obj);

        Customer UpdateCustomer(Customer obj);

        Customer GetCustomerByID(int id);
    }
}

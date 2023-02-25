using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomerRepository _repository;
        public CustomerService(ICustomerRepository repository)
        {
            _repository = repository;
        }

        public Customer AddCustomer(Customer obj)
        {
            return _repository.AddCustomer(obj);
        }

        public List<Customer> GetAll()
        {
            return _repository.GetAll();
        }

        public List<Customer> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public Customer GetCustomerByID(int id)
        {
            return _repository.GetCustomerByID(id);
        }

        public Customer UpdateCustomer(Customer obj)
        {
            return _repository.UpdateCustomer(obj);
        }
    }
}

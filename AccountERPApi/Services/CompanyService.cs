using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class CompanyService : ICompanyService
    {
        private readonly ICompanyRepository _repository;
        public CompanyService(ICompanyRepository repository)
        {
            _repository = repository;
        }

        public Company AddCompany(Company obj)
        {
            return _repository.AddCompany(obj);
        }

        public List<Company> GetAll()
        {
            return _repository.GetAll();
        }

        public Company GetCompanyByID(int id)
        {
            return _repository.GetCompanyByID(id);
        }

        public Company UpdateCompany(Company obj)
        {
            return _repository.UpdateCompany(obj);
        }
    }
}

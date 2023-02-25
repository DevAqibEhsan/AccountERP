using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface ICompanyService
    {
        public List<Company> GetAll();
        Company AddCompany(Company obj);
        Company UpdateCompany(Company obj);
        Company GetCompanyByID(int id);
    }
}

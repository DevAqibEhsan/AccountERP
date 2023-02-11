using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IBusinessTypeService
    {
        public List<BusinessType> GetAll();

        public List<BusinessType> GetAllActive();

        BusinessType AddBusinessType(BusinessType obj);

        BusinessType UpdateBusinessType(BusinessType obj);

        BusinessType GetBusinessTypeByID(int id);
    }
}

using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class BusinessTypeService : IBusinessTypeService
    {
        private readonly IBusinessTypeRepository _repository;

        public BusinessTypeService(IBusinessTypeRepository repository)
        {
            _repository = repository;
        }

        public BusinessType AddBusinessType(BusinessType obj)
        {
            return _repository.AddBusinessType(obj);
        }

        public List<BusinessType> GetAll()
        {
            return _repository.GetAll();
        }

        public List<BusinessType> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public BusinessType GetBusinessTypeByID(int id)
        {
            return _repository.GetBusinessTypeByID(id);
        }

        public BusinessType UpdateBusinessType(BusinessType obj)
        {
            return _repository.UpdateBusinessType(obj);
        }
    }
}

using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class DefaultAccountService : IDefaultAccountService
    {
        private readonly IDefaultAccountRepository _repository;
        public DefaultAccountService(IDefaultAccountRepository repository)
        {
            _repository = repository;
        }

        public DefaultAccount AddDefaultAccount(DefaultAccount obj)
        {
            return _repository.AddDefaultAccount(obj);
        }

        public List<DefaultAccount> GetAll()
        {
            return _repository.GetAll();
        }

        public List<DefaultAccount> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public DefaultAccount GetDefaultAccountByID(int id)
        {
            return _repository.GetDefaultAccountByID(id);
        }

        public DefaultAccount UpdateDefaultAccount(DefaultAccount obj)
        {
            return _repository.UpdateDefaultAccount(obj);
        }
    }
}

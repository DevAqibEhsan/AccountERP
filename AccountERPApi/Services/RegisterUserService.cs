using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class RegisterUserService : IRegisterUserService
    {
        private readonly IRegisterUserRepository _repository;
        public RegisterUserService(IRegisterUserRepository repository)
        {
            _repository = repository;
        }

        public object RegisterUser(RegisterUser obj)
        {
            return _repository.RegisterUser(obj);
        }
    }
}

using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly IAuthenticationRepository _repository;
        public AuthenticationService(IAuthenticationRepository repository)
        {
            _repository = repository;
        }
        public ClaimDTO Authenticate(LoginCredentials obj)
        {
            return _repository.Authenticate(obj);
        }
    }
}

using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
    public interface IAuthenticationRepository
    {
        ClaimDTO Authenticate(LoginCredentials obj);
    }
}

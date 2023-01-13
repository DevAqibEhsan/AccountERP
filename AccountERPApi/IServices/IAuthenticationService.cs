using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
    public interface IAuthenticationService
    {
        ClaimDTO Authenticate(LoginCredentials obj);
    }
}

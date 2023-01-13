using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class AuthenticationRepository : IAuthenticationRepository
    {
        public ClaimDTO Authenticate(LoginCredentials obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("Email", obj.Email, DbType.String, ParameterDirection.Input);
            parameters.Add("Password", obj.Password, DbType.String, ParameterDirection.Input);




            throw new NotImplementedException();
        }
    }
}

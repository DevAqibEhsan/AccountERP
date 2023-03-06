using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class RegisterUserRepository : IRegisterUserRepository
    {
        private readonly IDapper _dapper;
        public RegisterUserRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public object RegisterUser(RegisterUser obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("FirstName", obj.FirstName, DbType.String, ParameterDirection.Input);
            parameters.Add("LastName", obj.LastName, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyName", obj.CompanyName, DbType.String, ParameterDirection.Input);
            parameters.Add("Email", obj.Email, DbType.String, ParameterDirection.Input);
            parameters.Add("Password", obj.Password, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<RegisterUser>(@"usp_Register_User", parameters);
        }

    }
}

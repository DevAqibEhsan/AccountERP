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
    public class RoleRepository : IRoleRepository
    {
        private readonly IDapper _dapper;
        public RoleRepository(IDapper dapper)
        {
            _dapper = dapper;
        }
        public Role AddRole(Role obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleName", obj.RoleName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Role>(@"usp_Role_Add", parameters);
        }

        public List<Role> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Role>(@"usp_Role_GetAll", parameters);
        }

        public Role GetRoleByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleID",id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Role>(@"usp_Role_GetRoleByID", parameters);
        }

        public Role UpdateRole(Role obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleID", obj.RoleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("RoleName", obj.RoleName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Role>(@"usp_Role_Update", parameters);
        }
    }
}

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
    public class AssignedPermissionRepository : IAssignedPermissionRepository
    {
        private readonly IDapper _dapper;
        public AssignedPermissionRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public AssignedPermission AddAssignedPermission(AssignedPermission obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleID", obj.RoleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModulePageActionIDs", obj.ModulePageActionIDs, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<AssignedPermission>(@"usp_AssignedPermission_Add", parameters);
        }

        public List<AssignedPermission> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<AssignedPermission>(@"usp_AssignedPermission_GetAll", parameters);
        }

        public AssignedPermission UpdateAssignedPermission(AssignedPermission obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleID", obj.RoleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModulePageActionIDs", obj.ModulePageActionIDs, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<AssignedPermission>(@"usp_AssignedPermission_Update", parameters);
        }
    }
}

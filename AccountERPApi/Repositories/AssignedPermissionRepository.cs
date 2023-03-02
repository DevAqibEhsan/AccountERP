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

        public object GetAllRole_Module_ModulePageAction_Data()
        {
            DynamicParameters parameters = new DynamicParameters();

            var tupple = _dapper.GetMultipleObjects(@"usp_Role_Module_ModulePageAction_GetAll", parameters, gr => gr.Read<Role>(), gr => gr.Read<ModulePages>(), gr => gr.Read<ModulePageAction>());

            List<Role> list_role = new List<Role>();
            foreach (var item in tupple.Item1)
            {
                Role obj_role = new Role();
                obj_role.RoleID = item.RoleID;
                obj_role.RoleName = item.RoleName;

                list_role.Add(obj_role);
            }

            List<ModulePages> list_modulePage = new List<ModulePages>();
            foreach (var item in tupple.Item2)
            {
                ModulePages obj_modulePage = new ModulePages();
                obj_modulePage.ModulePageID = item.ModulePageID;
                obj_modulePage.ModulePageName = item.ModulePageName;

                list_modulePage.Add(obj_modulePage);
            }

            List<ModulePageAction> list_modulePageAction = new List<ModulePageAction>();
            foreach (var item in tupple.Item3)
            {
                ModulePageAction obj_modulePageAction = new ModulePageAction();
                obj_modulePageAction.ModulePageActionID = item.ModulePageActionID;
                obj_modulePageAction.ModulePageID = item.ModulePageID;
                obj_modulePageAction.ModulePageActionName = item.ModulePageActionName;

                list_modulePageAction.Add(obj_modulePageAction);
            }

            return new
            {
                Role = list_role,
                ModulePages = list_modulePage,
                ModulePageAction = list_modulePageAction
            };
        }
    }
}

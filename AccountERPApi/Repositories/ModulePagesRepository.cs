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
    public class ModulePagesRepository : IModulePagesRepository
    {
        private readonly IDapper _dapper;

        public ModulePagesRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public List<ModulePages> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<ModulePages>(@"usp_ModulePages_GetAll", parameters);
        }

        public List<ModulePages> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<ModulePages>(@"usp_ModulePages_GetAllActive", parameters);
        }

        public ModulePages GetModulePageByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ModulePageID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<ModulePages>(@"usp_ModulePages_GetModulePageByID", parameters);
        }

        public ModulePages AddModulePge(ModulePages obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ModuleID", obj.ModuleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModulePageName", obj.ModulePageName, DbType.String, ParameterDirection.Input);
            parameters.Add("ControllerURL", obj.ControllerURL, DbType.String, ParameterDirection.Input);
            parameters.Add("ActionURL", obj.ActionURL, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("OrderN", obj.OrderN, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<ModulePages>(@"usp_ModulePage_Add", parameters);
        }

        public ModulePages UpdateModulePge(ModulePages obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ModulePageID", obj.ModulePageID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModuleID", obj.ModuleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModulePageName", obj.ModulePageName, DbType.String, ParameterDirection.Input);
            parameters.Add("ControllerURL", obj.ControllerURL, DbType.String, ParameterDirection.Input);
            parameters.Add("ActionURL", obj.ActionURL, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("OrderN", obj.OrderN, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<ModulePages>(@"usp_ModulePage_Update", parameters);
        }
    }
}

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
    public class ModulesRepository : IModulesRepository
    {
        private readonly IDapper _dapper;
        public ModulesRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public List<Modules> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Modules>(@"usp_Module_GetAll", parameters);
        }

        public Modules AddModule(Modules obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ModuleName", obj.ModuleName, DbType.String, ParameterDirection.Input);
            parameters.Add("Icon", obj.Icon, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("OrderN", obj.OrderN, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("NameAsModuleID", obj.NameAsModuleID, DbType.String, ParameterDirection.Input);
            
            return _dapper.Get<Modules>(@"usp_Module_Add", parameters);
        }

        public Modules UpdateModule(Modules obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ModuleID", obj.ModuleID, DbType.String, ParameterDirection.Input);
            parameters.Add("ModuleName", obj.ModuleName, DbType.String, ParameterDirection.Input);
            parameters.Add("Icon", obj.Icon, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("OrderN", obj.OrderN, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("NameAsModuleID", obj.NameAsModuleID, DbType.String, ParameterDirection.Input);

            return _dapper.Get<Modules>(@"usp_Module_Update", parameters);
        }
    }
}

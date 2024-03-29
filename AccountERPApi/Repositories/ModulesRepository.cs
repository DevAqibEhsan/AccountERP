﻿using AccountERPApi.DBManager;
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

        public List<Modules> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Modules>(@"usp_Module_GetAllActive", parameters);
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

        public Modules GetModuleByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ModuleID", id, DbType.Int32, ParameterDirection.Input);
            
            return _dapper.Get<Modules>(@"usp_Module_GetModuleByID", parameters);
        }

        public object GetAll_Modules_ModulePages_Data()
        {
            DynamicParameters parameters = new DynamicParameters();

            var tupple =  _dapper.GetMultipleObjects(@"usp_Modules_ModulePages_GetAll", parameters,gr=> gr.Read<Modules>(),gr=> gr.Read<ModulePages>());

            List<Modules> list_modules = new List<Modules>();
            foreach (var item in tupple.Item1)
            {
                Modules obj_modles = new Modules();
                obj_modles.ModuleID = item.ModuleID;
                obj_modles.ModuleName = item.ModuleName;

                list_modules.Add(obj_modles);
            }

            List<ModulePages> list_modulePages = new List<ModulePages>();
            foreach (var item in tupple.Item2)
            {
                ModulePages obj_modulePages = new ModulePages();
                obj_modulePages.ModuleID = item.ModuleID;
                obj_modulePages.ControllerURL = item.ControllerURL;

                list_modulePages.Add(obj_modulePages);
            }

            return new
            {
                Modules = list_modules,
                ModulePages = list_modulePages
            };
        }
    }
}

using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using System;
using System.Collections.Generic;
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
    }
}

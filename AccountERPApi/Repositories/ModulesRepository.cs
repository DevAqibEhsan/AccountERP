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
    }
}

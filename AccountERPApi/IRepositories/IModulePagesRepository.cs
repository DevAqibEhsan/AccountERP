using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
    public interface IModulePagesRepository
    {
        public List<ModulePages> GetAll();
    }
}

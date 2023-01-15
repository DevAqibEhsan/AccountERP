using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
    public interface IModulePagesService
    {
        public List<ModulePages> GetAll();
    }
}

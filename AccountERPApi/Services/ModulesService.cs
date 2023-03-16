using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ModulesService : IModulesService
    {
        private readonly IModulesRepository _repository;

        public ModulesService(IModulesRepository repository)
        {
            _repository = repository;
        }

        public List<Modules> GetAll()
        {
            return _repository.GetAll();
        }

        public List<Modules> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public Modules AddModule(Modules obj)
        {
            return _repository.AddModule(obj);
        }

        public Modules UpdateModule(Modules obj)
        {
            return _repository.UpdateModule(obj);
        }

        public Modules GetModuleByID(int id)
        {
            return _repository.GetModuleByID(id);
        }

        public object GetAll_Modules_ModulePages_Data()
        {
            return _repository.GetAll_Modules_ModulePages_Data();
        }
    }
}

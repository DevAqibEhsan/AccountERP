using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ModulePagesService : IModulePagesService
    {
        private readonly IModulePagesRepository _repository;

        public ModulePagesService(IModulePagesRepository repository)
        {
            _repository = repository;
        }

        public List<ModulePages> GetAll()
        {
            return _repository.GetAll();
        }

        public List<ModulePages> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public ModulePages GetModulePageByID(int id)
        {
            return _repository.GetModulePageByID(id);
        }

        public ModulePages AddModulePge(ModulePages obj)
        {
            return _repository.AddModulePge(obj);
        }    

        public ModulePages UpdateModulePge(ModulePages obj)
        {
            return _repository.UpdateModulePge(obj);
        }
    }
}

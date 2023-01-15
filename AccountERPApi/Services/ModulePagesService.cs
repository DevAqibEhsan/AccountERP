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
    }
}

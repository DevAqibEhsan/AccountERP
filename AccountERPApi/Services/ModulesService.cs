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
    }
}

using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class RoleService : IRoleService
    {
        private readonly IRoleRepository _repository;

        public RoleService(IRoleRepository repository)
        {
            _repository = repository;
        }
        public Role AddRole(Role obj)
        {
            return _repository.AddRole(obj);
        }

        public List<Role> GetAll()
        {
            return _repository.GetAll();
        }

        public Role GetRoleByID(int id)
        {
            return _repository.GetRoleByID(id);
        }

        public Role UpdateRole(Role obj)
        {
            return _repository.UpdateRole(obj);
        }
    }
}

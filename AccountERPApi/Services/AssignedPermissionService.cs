using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class AssignedPermissionService : IAssignedPermissionService
    {
        private readonly IAssignedPermissionRepository _repository;
        public AssignedPermissionService(IAssignedPermissionRepository repository)
        {
            _repository = repository;
        }

        public AssignedPermission AddAssignedPermission(AssignedPermission obj)
        {
            return _repository.AddAssignedPermission(obj);
        }

        public List<AssignedPermission> GetAll()
        {
            return _repository.GetAll();
        }

        public object GetAllRole_Module_ModulePageAction_Data()
        {
            return _repository.GetAllRole_Module_ModulePageAction_Data();
        }

        public AssignedPermission UpdateAssignedPermission(AssignedPermission obj)
        {
            return _repository.UpdateAssignedPermission(obj);
        }
    }
}

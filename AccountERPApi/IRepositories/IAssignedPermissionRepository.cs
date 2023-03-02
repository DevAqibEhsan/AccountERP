using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
    public interface IAssignedPermissionRepository
    {
        public List<AssignedPermission> GetAll();
        AssignedPermission AddAssignedPermission(AssignedPermission obj);
        AssignedPermission UpdateAssignedPermission(AssignedPermission obj);
        object GetAllRole_Module_ModulePageAction_Data();
    }
}

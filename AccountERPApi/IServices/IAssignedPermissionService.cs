using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IAssignedPermissionService
    {
        public List<AssignedPermission> GetAll();
        AssignedPermission AddAssignedPermission(AssignedPermission obj);
        AssignedPermission UpdateAssignedPermission(AssignedPermission obj);
    }
}

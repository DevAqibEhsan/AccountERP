using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IRoleService
    {
        public List<Role> GetAll();

        Role AddRole(Role obj);

        Role UpdateRole(Role obj);

        Role GetRoleByID(int id);
    }
}

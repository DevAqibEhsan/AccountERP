using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IBranchService
    {
        public List<Branch> GetAll();
        Branch AddBranch(Branch obj);
        Branch UpdateBranch(Branch obj);
        Branch GetBranchByID(int id);
        object GetAllCompany_Branch_Data();
    }
}

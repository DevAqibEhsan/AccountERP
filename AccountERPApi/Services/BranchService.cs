using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class BranchService : IBranchService
    {
        private readonly IBranchRepository _repository;
        public BranchService(IBranchRepository repository)
        {
            _repository = repository;
        }

        public Branch AddBranch(Branch obj)
        {
            return _repository.AddBranch(obj);
        }

        public List<Branch> GetAll()
        {
            return _repository.GetAll();
        }

        public object GetAllCompany_Branch_Data()
        {
            return _repository.GetAllCompany_Branch_Data();
        }

        public Branch GetBranchByID(int id)
        {
            return _repository.GetBranchByID(id);
        }

        public Branch UpdateBranch(Branch obj)
        {
            return _repository.UpdateBranch(obj);
        }
    }
}

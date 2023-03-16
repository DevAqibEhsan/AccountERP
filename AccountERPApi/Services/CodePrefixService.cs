using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class CodePrefixService : ICodePrefixService
    {
        private readonly ICodePrefixRepository _repository;
        public CodePrefixService(ICodePrefixRepository repository)
        {
            _repository = repository;
        }

        public CodePrefix AddCodePrefix(CodePrefix obj)
        {
            return _repository.AddCodePrefix(obj);
        }

        public List<CodePrefix> GetAll()
        {
            return _repository.GetAll();
        }

        public CodePrefix GetCodePrefixByID(int id)
        {
            return _repository.GetCodePrefixByID(id);
        }

        public CodePrefix UpdateCodePrefix(CodePrefix obj)
        {
            return _repository.UpdateCodePrefix(obj);
        }
    }
}

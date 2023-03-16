using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface ICodePrefixRepository
    {
        public List<CodePrefix> GetAll();

        CodePrefix AddCodePrefix(CodePrefix obj);

        CodePrefix UpdateCodePrefix(CodePrefix obj);

        CodePrefix GetCodePrefixByID(int id);
    }
}

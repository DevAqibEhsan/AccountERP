using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IDefaultAccountRepository
    {
        public List<DefaultAccount> GetAll();

        public List<DefaultAccount> GetAllActive();

        DefaultAccount AddDefaultAccount(DefaultAccount obj);

        DefaultAccount UpdateDefaultAccount(DefaultAccount obj);

        DefaultAccount GetDefaultAccountByID(int id);
    }
}

using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IUserRepository
    {
        public List<User> GetAll();

        public List<User> GetAllActive();

        User AddUser(User obj);

        User UpdateUser(User obj);

        User GetUserByID(int id);
    }
}

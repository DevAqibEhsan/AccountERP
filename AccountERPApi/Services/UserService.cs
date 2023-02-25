using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _repository;
        public UserService(IUserRepository repository)
        {
            _repository = repository;
        }

        public User AddUser(User obj)
        {
            return _repository.AddUser(obj);
        }

        public List<User> GetAll()
        {
            return _repository.GetAll();
        }

        public List<User> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public User GetUserByID(int id)
        {
            return _repository.GetUserByID(id);
        }

        public User UpdateUser(User obj)
        {
            return _repository.UpdateUser(obj);
        }
    }
}

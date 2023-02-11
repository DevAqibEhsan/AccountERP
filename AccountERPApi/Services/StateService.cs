using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class StateService:IStateService
    {
        private readonly IStateRepository _repository;
        public StateService(IStateRepository repository)
        {
            _repository = repository;
        }

        public State AddState(State obj)
        {
            return _repository.AddState(obj);
        }

        public List<State> GetAll()
        {
            return _repository.GetAll();
        }

        public State GetStateByID(int id)
        {
            return _repository.GetStateByID(id);
        }

        public State UpdateState(State obj)
        {
            return _repository.UpdateState(obj);
        }
    }
}

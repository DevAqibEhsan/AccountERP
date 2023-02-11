using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
    public interface IStateService
    {
        public List<State> GetAll();

        State AddState(State obj);

        State UpdateState(State obj);

        State GetStateByID(int id);
    }
}

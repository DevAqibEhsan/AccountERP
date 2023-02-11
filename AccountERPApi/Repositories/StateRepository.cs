using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class StateRepository : IStateRepository
    {
        private readonly IDapper _dapper;

        public StateRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public State AddState(State obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateCode", obj.StateCode, DbType.String, ParameterDirection.Input);
            parameters.Add("StateName", obj.StateName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<State>(@"usp_State_Add", parameters);
        }

        public List<State> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<State>(@"usp_State_GetAll", parameters);
        }

        public State GetStateByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("StateID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<State>(@"usp_State_GetStateByID", parameters);
        }

        public State UpdateState(State obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateCode", obj.StateCode, DbType.String, ParameterDirection.Input);
            parameters.Add("StateName", obj.StateName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<State>(@"usp_State_Update", parameters);
        }
    }
}

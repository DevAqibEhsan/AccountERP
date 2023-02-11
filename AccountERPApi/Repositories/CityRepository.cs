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
    public class CityRepository : ICityRepository
    {
        private readonly IDapper _dapper;

        public CityRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public City AddCity(City obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CityName", obj.CityName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<City>(@"usp_City_Add", parameters);
        }

        public List<City> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<City>(@"usp_City_GetAll", parameters);
        }

        public City GetCityByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CityID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<City>(@"usp_City_GetCityByID", parameters);
        }

        public City UpdateCity(City obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CityID", obj.CityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CityName", obj.CityName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<City>(@"usp_City_Update", parameters);
        }
    }
}
 
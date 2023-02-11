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
    public class CountryRepository : ICountryRepository
    {
        private readonly IDapper _dapper;

        public CountryRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public Country AddCountry(Country obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CountryCode", obj.CountryCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryName", obj.CountryName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<Country>(@"usp_Country_Add", parameters);
        }

        public List<Country> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Country>(@"usp_Country_GetAll", parameters);
        }

        public Country GetCountryByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CountryID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<Country>(@"usp_Country_GetCountryByID", parameters);
        }

        public Country UpdateCountry(Country obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CountryCode", obj.CountryCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryName", obj.CountryName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<Country>(@"usp_Country_Update", parameters);
        }
    }
}

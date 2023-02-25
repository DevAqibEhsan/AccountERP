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
    public class WareHouseRepository : IWareHouseRepository
    {
        private readonly IDapper _dapper;
        public WareHouseRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public WareHouse AddWareHouse(WareHouse obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("WareHouseName", obj.WareHouseName, DbType.String, ParameterDirection.Input);
            parameters.Add("Phone", obj.Phone, DbType.String, ParameterDirection.Input);
            parameters.Add("Address1", obj.Address1, DbType.String, ParameterDirection.Input);
            parameters.Add("Address2", obj.Address2, DbType.String, ParameterDirection.Input);
            parameters.Add("CityID", obj.CityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ZipCode", obj.ZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<WareHouse>(@"usp_WareHouse_Add", parameters);
        }

        public List<WareHouse> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<WareHouse>(@"usp_WareHouse_GetAll", parameters);
        }

        public WareHouse GetWareHouseByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("WareHouseID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<WareHouse>(@"usp_WareHouse_GetWareHouseByID", parameters);
        }

        public WareHouse UpdateWareHouse(WareHouse obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("WareHouseID", obj.WareHouseID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("WareHouseName", obj.WareHouseName, DbType.String, ParameterDirection.Input);
            parameters.Add("Phone", obj.Phone, DbType.String, ParameterDirection.Input);
            parameters.Add("Address1", obj.Address1, DbType.String, ParameterDirection.Input);
            parameters.Add("Address2", obj.Address2, DbType.String, ParameterDirection.Input);
            parameters.Add("CityID", obj.CityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ZipCode", obj.ZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<WareHouse>(@"usp_WareHouse_Update", parameters);
        }
    }
}

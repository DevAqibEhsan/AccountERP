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
    public class BusinessTypeRepository : IBusinessTypeRepository
    {
        private readonly IDapper _dapper;
        public BusinessTypeRepository(IDapper dapper)
        {
            _dapper = dapper;
        }
        public BusinessType AddBusinessType(BusinessType obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("BusinessTypeName", obj.BusinessTypeName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<BusinessType>(@"usp_BusinessType_Add", parameters);
        }

        public List<BusinessType> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<BusinessType>(@"usp_BusinessType_GetAll", parameters);
        }

        public List<BusinessType> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<BusinessType>(@"usp_BusinessType_GetAllActive", parameters);
        }

        public BusinessType GetBusinessTypeByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("BusinessTypeID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<BusinessType>(@"usp_BusinessType_GetBusinessTypeByID", parameters);
        }

        public BusinessType UpdateBusinessType(BusinessType obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("BusinessTypeID", obj.BusinessTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BusinessTypeName", obj.BusinessTypeName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<BusinessType>(@"usp_BusinessType_Update", parameters);
        }
    }
}

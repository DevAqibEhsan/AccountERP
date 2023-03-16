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
    public class ChartAccountRepository : IChartAccountRepository
    {
        private readonly IDapper _dapper;
        public ChartAccountRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ChartAccount AddChartAccount(ChartAccount obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountByCompanyBranchName", obj.AccountByCompanyBranchName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSubAccountOf", obj.IsSubAccountOf, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ChartAccount>(@"usp_AccountsByCompanyBranch_Add", parameters);
        }

        public List<ChartAccount> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ChartAccount>(@"usp_AccountsByCompanyBranch_GetAll", parameters);
        }

        public List<ChartAccount> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ChartAccount>(@"usp_AccountsByCompanyBranch_GetAllActive", parameters);
        }

        public ChartAccount GetChartAccountByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountByCompanyBranchID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<ChartAccount>(@"usp_AccountsByCompanyBranch_GetAccountsOfCompanyBranchByID", parameters);
        }

        public ChartAccount UpdateChartAccount(ChartAccount obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountByCompanyBranchID", obj.AccountByCompanyBranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("AccountByCompanyBranchName", obj.AccountByCompanyBranchName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSubAccountOf", obj.IsSubAccountOf, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ChartAccount>(@"usp_AccountsByCompanyBranch_Update", parameters);
        }
    }
}

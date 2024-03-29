﻿using AccountERPApi.DBManager;
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
    public class DefaultAccountRepository : IDefaultAccountRepository
    {
        private readonly IDapper _dapper;
        public DefaultAccountRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public DefaultAccount AddDefaultAccount(DefaultAccount obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountName", obj.AccountName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSubAccountOf", obj.IsSubAccountOf, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSystemAccount", obj.IsSystemAccount, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<DefaultAccount>(@"usp_Accounts_Add", parameters);
        }

        public List<DefaultAccount> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<DefaultAccount>(@"usp_Accounts_GetAll", parameters);
        }

        public List<DefaultAccount> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<DefaultAccount>(@"usp_Accounts_GetAllActive", parameters);
        }

        public DefaultAccount GetDefaultAccountByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<DefaultAccount>(@"usp_Accounts_GetAccountsByID", parameters);
        }

        public DefaultAccount UpdateDefaultAccount(DefaultAccount obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("AccountID", obj.AccountID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("AccountName", obj.AccountName, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSubAccountOf", obj.IsSubAccountOf, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("IsSystemAccount", obj.IsSystemAccount, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<DefaultAccount>(@"usp_Accounts_Update", parameters);
        }
    }
}

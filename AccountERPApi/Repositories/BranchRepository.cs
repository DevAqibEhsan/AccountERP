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
    public class BranchRepository : IBranchRepository
    {
        private readonly IDapper _dapper;
        public BranchRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public Branch AddBranch(Branch obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchName", obj.BranchName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Branch>(@"usp_Branch_Add", parameters);
        }

        public List<Branch> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Branch>(@"usp_Branch_GetAll", parameters);
        }

        public object GetAllCompany_Branch_Data()
        {
            DynamicParameters parameters = new DynamicParameters();

            var tupple = _dapper.GetMultipleObjects(@"usp_Company_Branch_GetAll", parameters, gr => gr.Read<Company>(), gr => gr.Read<Branch>());

            List<Company> list_company = new List<Company>();
            foreach (var item in tupple.Item1)
            {
                Company obj_company = new Company();
                obj_company.CompanyID = item.CompanyID;
                obj_company.CompanyName = item.CompanyName;

                list_company.Add(obj_company);
            }

            List<Branch> list_branch = new List<Branch>();
            foreach (var item in tupple.Item2)
            {
                Branch obj_branch = new Branch();
                obj_branch.BranchID = item.BranchID;
                obj_branch.CompanyID = item.CompanyID;
                obj_branch.BranchName = item.BranchName;

                list_branch.Add(obj_branch);
            }

            return new
            {
                Company = list_company,
                Branch = list_branch,
            };
        }

        public Branch GetBranchByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("BranchID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Branch>(@"usp_Branch_GetBranchByID", parameters);
        }

        public Branch UpdateBranch(Branch obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchName", obj.BranchName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Branch>(@"usp_Branch_Update", parameters);
        }
    }
}

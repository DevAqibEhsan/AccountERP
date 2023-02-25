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
    public class VendorRepository : IVendorRepository
    {
        private readonly IDapper _dapper;
        public VendorRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public Vendor AddVendor(Vendor obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("VendorName", obj.VendorName, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalPhone", obj.PostalPhone, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalAddress1", obj.PostalAddress1, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalAddress2", obj.PostalAddress2, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalCityID", obj.PostalCityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PostalStateID", obj.PostalStateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PostalZipCode", obj.PostalZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalCountryID", obj.PostalCountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingPhone", obj.BillingPhone, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingAddress1", obj.BillingAddress1, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingAddress2", obj.BillingAddress2, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingCityID", obj.BillingCityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingStateID", obj.BillingStateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingZipCode", obj.BillingZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingCountryID", obj.BillingCountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Vendor>(@"usp_Vendor_Add", parameters);
        }

        public List<Vendor> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Vendor>(@"usp_Vendor_GetAll", parameters);
        }

        public Vendor GetVendorByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("VendorID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Vendor>(@"usp_Vendor_GetVendorByID", parameters);
        }

        public Vendor UpdateVendor(Vendor obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("VendorID", obj.VendorID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("VendorName", obj.VendorName, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalPhone", obj.PostalPhone, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalAddress1", obj.PostalAddress1, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalAddress2", obj.PostalAddress2, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalCityID", obj.PostalCityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PostalStateID", obj.PostalStateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PostalZipCode", obj.PostalZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("PostalCountryID", obj.PostalCountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingPhone", obj.BillingPhone, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingAddress1", obj.BillingAddress1, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingAddress2", obj.BillingAddress2, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingCityID", obj.BillingCityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingStateID", obj.BillingStateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BillingZipCode", obj.BillingZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("BillingCountryID", obj.BillingCountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("BranchID", obj.BranchID, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Vendor>(@"usp_Vendor_Update", parameters);
        }
    }
}

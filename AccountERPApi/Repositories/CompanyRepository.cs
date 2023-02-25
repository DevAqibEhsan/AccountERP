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
    public class CompanyRepository : ICompanyRepository
    {
        private readonly IDapper _dapper;
        public CompanyRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public Company AddCompany(Company obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyName", obj.CompanyName, DbType.String, ParameterDirection.Input);
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
            parameters.Add("CompanyLogo", obj.CompanyLogo, DbType.String, ParameterDirection.Input);
            parameters.Add("NTN", obj.NTN, DbType.String, ParameterDirection.Input);
            parameters.Add("STN", obj.STN, DbType.String, ParameterDirection.Input);
            parameters.Add("WebsiteURL", obj.WebsiteURL, DbType.String, ParameterDirection.Input);
            parameters.Add("POSID", obj.POSID, DbType.String, ParameterDirection.Input);
            parameters.Add("BusinessTypeID", obj.BusinessTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("TimeZoneID", obj.TimeZoneID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("NoOfUsers", obj.NoOfUsers, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsAllowPowerBy", obj.IsAllowPowerBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PoweredBy", obj.PoweredBy, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Company>(@"usp_Company_Add", parameters);
        }

        public List<Company> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Company>(@"usp_Company_GetAll", parameters);
        }

        public Company GetCompanyByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<Company>(@"usp_Company_GetCompanyByID", parameters);
        }

        public Company UpdateCompany(Company obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyName", obj.CompanyName, DbType.String, ParameterDirection.Input);
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
            parameters.Add("CompanyLogo", obj.CompanyLogo, DbType.String, ParameterDirection.Input);
            parameters.Add("NTN", obj.NTN, DbType.String, ParameterDirection.Input);
            parameters.Add("STN", obj.STN, DbType.String, ParameterDirection.Input);
            parameters.Add("WebsiteURL", obj.WebsiteURL, DbType.String, ParameterDirection.Input);
            parameters.Add("POSID", obj.POSID, DbType.String, ParameterDirection.Input);
            parameters.Add("BusinessTypeID", obj.BusinessTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("TimeZoneID", obj.TimeZoneID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("NoOfUsers", obj.NoOfUsers, DbType.Int32, ParameterDirection.Input);
            parameters.Add("IsAllowPowerBy", obj.IsAllowPowerBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("PoweredBy", obj.PoweredBy, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Company>(@"usp_Company_Update", parameters);
        }
    }
}

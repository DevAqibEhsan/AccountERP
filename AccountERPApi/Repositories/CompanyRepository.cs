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
            parameters.Add("SiteThemeSetting", obj.SiteThemeSetting, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Company>(@"usp_Company_Add", parameters);
        }

        public List<Company> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<Company>(@"usp_Company_GetAll", parameters);
        }

        public object GetAllBusinessType_TimeZone_Country_State_City_Data()
        {
            DynamicParameters parameters = new DynamicParameters();

            var tupple = _dapper.GetMultipleObjects(@"usp_BusinessType_TimeZone_Country_State_City_GetAll", parameters, gr => gr.Read<BusinessType>(), gr => gr.Read<TimeZones>(), gr => gr.Read<Country>(), gr => gr.Read<State>(), gr => gr.Read<City>());

            List<BusinessType> list_businessType = new List<BusinessType>();
            foreach (var item in tupple.Item1)
            {
                BusinessType obj_businessType = new BusinessType();
                obj_businessType.BusinessTypeID = item.BusinessTypeID;
                obj_businessType.BusinessTypeName = item.BusinessTypeName;

                list_businessType.Add(obj_businessType);
            }

            List<TimeZones> list_timeZones = new List<TimeZones>();
            foreach (var item in tupple.Item2)
            {
                TimeZones obj_timeZones = new TimeZones();
                obj_timeZones.TimeZoneID = item.TimeZoneID;
                obj_timeZones.TimeZoneName = item.TimeZoneName;

                list_timeZones.Add(obj_timeZones);
            }

            List<Country> list_country = new List<Country>();
            foreach (var item in tupple.Item3)
            {
                Country obj_country = new Country();
                obj_country.CountryID = item.CountryID;
                obj_country.CountryName = item.CountryName;

                list_country.Add(obj_country);
            }

            List<State> list_State = new List<State>();
            foreach (var item in tupple.Item4)
            {
                State obj_State = new State();
                obj_State.StateID = item.StateID;
                obj_State.CountryID = item.CountryID;
                obj_State.StateName = item.StateName;

                list_State.Add(obj_State);
            }

            List<City> list_city = new List<City>();
            foreach (var item in tupple.Item5)
            {
                City obj_citye = new City();
                obj_citye.CityID = item.CityID;
                obj_citye.StateID = item.StateID;
                obj_citye.CityName = item.CityName;

                list_city.Add(obj_citye);
            }

            return new
            {
                BusinessType = list_businessType,
                TimeZones = list_timeZones,
                Country = list_country,
                State = list_State,
                City = list_city
            };
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
            parameters.Add("SiteThemeSetting", obj.SiteThemeSetting, DbType.String, ParameterDirection.Input);
            return _dapper.Get<Company>(@"usp_Company_Update", parameters);
        }
    }
}

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
    public class SiteConfigRepository : ISiteConfigRepository
    {
        private readonly IDapper _dapper;

        public SiteConfigRepository(IDapper dapper)
        {
            _dapper = dapper;
        }
        public SiteConfig AddSiteConfig(SiteConfig obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("Logo", obj.Logo, DbType.String, ParameterDirection.Input);
            parameters.Add("PoweredBy", obj.PoweredBy, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<SiteConfig>(@"usp_SiteConfig_Add", parameters);
        }

        public List<SiteConfig> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<SiteConfig>(@"usp_SiteConfig_GetAll", parameters);
        }

        public List<SiteConfig> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<SiteConfig>(@"usp_SiteConfig_GetAllActive", parameters);
        }

        public SiteConfig GetSiteConfigByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ConfigurationID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<SiteConfig>(@"usp_SiteConfig_GetSiteConfigByID", parameters);
        }

        public SiteConfig UpdateSiteConfig(SiteConfig obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ConfigurationID", obj.ConfigurationID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Logo", obj.Logo, DbType.String, ParameterDirection.Input);
            parameters.Add("PoweredBy", obj.PoweredBy, DbType.String, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<SiteConfig>(@"usp_SiteConfig_Update", parameters);
        }
    }
}

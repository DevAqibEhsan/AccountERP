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
    public class TimeZonesRepository : ITimeZonesRepository
    {
        private readonly IDapper _dapper;
        public TimeZonesRepository(IDapper dapper)
        {
            _dapper = dapper;
        }
        public TimeZones AddTimeZones(TimeZones obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("TimeZoneName", obj.TimeZoneName, DbType.String, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("RelativeToGMT", obj.RelativeToGMT, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<TimeZones>(@"usp_TimeZone_Add", parameters);
        }

        public List<TimeZones> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<TimeZones>(@"usp_TimeZone_GetAll", parameters);
        }

        public TimeZones GetTimeZonesByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("TimeZoneID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<TimeZones>(@"usp_TimeZone_GetTimeZoneByID", parameters);
        }

        public TimeZones UpdateTimeZones(TimeZones obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("TimeZoneID", obj.TimeZoneID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("TimeZoneName", obj.TimeZoneName, DbType.String, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("RelativeToGMT", obj.RelativeToGMT, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            return _dapper.Get<TimeZones>(@"usp_TimeZone_Update", parameters);
        }
    }
}

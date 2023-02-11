using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface ITimeZonesRepository
    {
        public List<TimeZones> GetAll();

        TimeZones AddTimeZones(TimeZones obj);

        TimeZones UpdateTimeZones(TimeZones obj);

        TimeZones GetTimeZonesByID(int id);
    }
}

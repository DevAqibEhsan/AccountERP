using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
  public  interface ITimeZonesService
    {
        public List<TimeZones> GetAll();

        TimeZones AddTimeZones(TimeZones obj);

        TimeZones UpdateTimeZones(TimeZones obj);

        TimeZones GetTimeZonesByID(int id);
    }
}

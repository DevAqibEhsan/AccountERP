using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class TimeZonesService : ITimeZonesService
    {
        private readonly ITimeZonesRepository _repository;

        public TimeZonesService(ITimeZonesRepository repository)
        {
            _repository = repository;
        }
        public TimeZones AddTimeZones(TimeZones obj)
        {
            return _repository.AddTimeZones(obj);
        }

        public List<TimeZones> GetAll()
        {
            return _repository.GetAll();
        }

        public TimeZones GetTimeZonesByID(int id)
        {
            return _repository.GetTimeZonesByID(id);
        }

        public TimeZones UpdateTimeZones(TimeZones obj)
        {
            return _repository.UpdateTimeZones(obj);
        }
    }
}

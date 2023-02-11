using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class CityService : ICityService
    {
        private readonly ICityRepository _repository;
        public CityService(ICityRepository repository)
        {
            _repository = repository;
        }

        public City AddCity(City obj)
        {
            return _repository.AddCity(obj);
        }

        public List<City> GetAll()
        {
            return _repository.GetAll();
        }

        public City GetCityByID(int id)
        {
            return _repository.GetCityByID(id);
        }

        public City UpdateCity(City obj)
        {
            return _repository.UpdateCity(obj);
        }
    }
}

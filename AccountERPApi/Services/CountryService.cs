using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class CountryService : ICountryService
    {
        private readonly ICountryRepository _repository;
        public CountryService(ICountryRepository repository)
        {
            _repository = repository;
        }
        public Country AddCountry(Country obj)
        {
           return _repository.AddCountry(obj);
        }

        public List<Country> GetAll()
        {
            return _repository.GetAll();
        }

        public Country GetCountryByID(int id)
        {
            return _repository.GetCountryByID(id);
        }

        public Country UpdateCountry(Country obj)
        {
            return _repository.UpdateCountry(obj);
        }
    }
}

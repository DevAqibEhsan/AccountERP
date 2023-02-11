using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
    public interface ICountryService
    {
        public List<Country> GetAll();

        Country AddCountry(Country obj);

        Country UpdateCountry(Country obj);

        Country GetCountryByID(int id);
    }
}

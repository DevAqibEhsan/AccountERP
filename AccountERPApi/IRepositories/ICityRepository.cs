using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface ICityRepository
    {
        public List<City> GetAll();

        City AddCity(City obj);

        City UpdateCity(City obj);

        City GetCityByID(int id);
    }
}

using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface ICityService
    {
        public List<City> GetAll();

        City AddCity(City obj);

        City UpdateCity(City obj);

        City GetCityByID(int id);
    }
}

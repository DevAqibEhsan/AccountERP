using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IWareHouseRepository
    {
        public List<WareHouse> GetAll();

        WareHouse AddWareHouse(WareHouse obj);

        WareHouse UpdateWareHouse(WareHouse obj);

        WareHouse GetWareHouseByID(int id);
    }
}

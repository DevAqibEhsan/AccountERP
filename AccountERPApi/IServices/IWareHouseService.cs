using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IWareHouseService
    {
        public List<WareHouse> GetAll();

        WareHouse AddWareHouse(WareHouse obj);

        WareHouse UpdateWareHouse(WareHouse obj);

        WareHouse GetWareHouseByID(int id);
    }
}

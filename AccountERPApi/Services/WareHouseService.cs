using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class WareHouseService : IWareHouseService
    {
        private readonly IWareHouseRepository _repository;
        public WareHouseService(IWareHouseRepository repository)
        {
            _repository = repository;
        }

        public WareHouse AddWareHouse(WareHouse obj)
        {
            return _repository.AddWareHouse(obj);
        }

        public List<WareHouse> GetAll()
        {
            return _repository.GetAll();
        }

        public WareHouse GetWareHouseByID(int id)
        {
            return _repository.GetWareHouseByID(id);
        }

        public WareHouse UpdateWareHouse(WareHouse obj)
        {
            return _repository.UpdateWareHouse(obj);
        }
    }
}

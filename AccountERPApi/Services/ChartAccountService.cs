using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ChartAccountService : IChartAccountService
    {
        private readonly IChartAccountRepository _repository;

        public ChartAccountService(IChartAccountRepository repository)
        {
            _repository = repository;
        }

        public ChartAccount AddChartAccount(ChartAccount obj)
        {
            return _repository.AddChartAccount(obj);
        }

        public List<ChartAccount> GetAll()
        {
            return _repository.GetAll();
        }

        public List<ChartAccount> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public ChartAccount GetChartAccountByID(int id)
        {
            return _repository.GetChartAccountByID(id);
        }

        public ChartAccount UpdateChartAccount(ChartAccount obj)
        {
            return _repository.UpdateChartAccount(obj);
        }
    }
}

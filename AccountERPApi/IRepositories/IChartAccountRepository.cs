using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
    public interface IChartAccountRepository
    {
        public List<ChartAccount> GetAll();

        public List<ChartAccount> GetAllActive();

        ChartAccount AddChartAccount(ChartAccount obj);

        ChartAccount UpdateChartAccount(ChartAccount obj);

        ChartAccount GetChartAccountByID(int id);
    }
}

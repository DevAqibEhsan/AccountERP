using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IVendorRepository
    {
        public List<Vendor> GetAll();

        Vendor AddVendor(Vendor obj);

        Vendor UpdateVendor(Vendor obj);

        Vendor GetVendorByID(int id);
    }
}

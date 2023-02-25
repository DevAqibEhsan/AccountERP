using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class VendorService : IVendorService
    {
        private readonly IVendorRepository _repository;
        public VendorService(IVendorRepository repository)
        {
            _repository = repository;
        }

        public Vendor AddVendor(Vendor obj)
        {
            return _repository.AddVendor(obj);
        }

        public List<Vendor> GetAll()
        {
            return _repository.GetAll();
        }

        public Vendor GetVendorByID(int id)
        {
            return _repository.GetVendorByID(id);
        }

        public Vendor UpdateVendor(Vendor obj)
        {
            return _repository.UpdateVendor(obj);
        }
    }
}

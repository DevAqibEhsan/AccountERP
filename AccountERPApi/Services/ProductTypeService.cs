using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ProductTypeService : IProductTypeService
    {
        private readonly IProductTypeRepository _repository;
        public ProductTypeService(IProductTypeRepository repository)
        {
            _repository = repository;
        }

        public ProductType AddProductType(ProductType obj)
        {
            return _repository.AddProductType(obj);
        }

        public List<ProductType> GetAll()
        {
            return _repository.GetAll();
        }

        public ProductType GetProductTypeByID(int id)
        {
            return _repository.GetProductTypeByID(id);
        }

        public ProductType UpdateProductType(ProductType obj)
        {
            return _repository.UpdateProductType(obj);
        }
    }
}

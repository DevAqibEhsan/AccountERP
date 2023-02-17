using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ProductAttributeService : IProductAttributeService
    {
        private readonly IProductAttributeRepository _repository;
        public ProductAttributeService(IProductAttributeRepository repository)
        {
            _repository = repository;
        }

        public ProductAttribute AddProductAttribute(ProductAttribute obj)
        {
            return _repository.AddProductAttribute(obj);
        }

        public List<ProductAttribute> GetAll()
        {
            return _repository.GetAll();
        }

        public ProductAttribute GetProductAttributeByID(int id)
        {
            return _repository.GetProductAttributeByID(id);
        }

        public ProductAttribute UpdateProductAttribute(ProductAttribute obj)
        {
            return _repository.UpdateProductAttribute(obj);
        }
    }
}

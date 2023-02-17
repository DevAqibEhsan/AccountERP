using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ProductBrandService: IProductBrandService
    {
        private readonly IProductBrandRepository _repository;
        public ProductBrandService(IProductBrandRepository repository)
        {
            _repository = repository;
        }

        public ProductBrand AddProductBrand(ProductBrand obj)
        {
            return _repository.AddProductBrand(obj);
        }

        public List<ProductBrand> GetAll()
        {
            return _repository.GetAll();
        }

        public ProductBrand GetProductBrandByID(int id)
        {
            return _repository.GetProductBrandByID(id);
        }

        public ProductBrand UpdateProductBrand(ProductBrand obj)
        {
            return _repository.UpdateProductBrand(obj);
        }
    }
}

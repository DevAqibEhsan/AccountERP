using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ProductCategoryService : IProductCategoryService
    {
        private readonly IProductCategoryRepository _repository;
        public ProductCategoryService(IProductCategoryRepository repository)
        {
            _repository = repository;
        }

        public ProductCategory AddProductCategory(ProductCategory obj)
        {
            return _repository.AddProductCategory(obj);
        }

        public List<ProductCategory> GetAll()
        {
            return _repository.GetAll();
        }

        public ProductCategory GetProductCategoryByID(int id)
        {
            return _repository.GetProductCategoryByID(id);
        }

        public ProductCategory UpdateProductCategory(ProductCategory obj)
        {
            return _repository.UpdateProductCategory(obj);
        }
    }
}

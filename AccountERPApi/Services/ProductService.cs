using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repository;
        public ProductService(IProductRepository repository)
        {
            _repository = repository;
        }

        public Product AddProduct(Product obj)
        {
            return _repository.AddProduct(obj);
        }

        public List<Product> GetAll()
        {
            return _repository.GetAll();
        }

        public List<Product> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public Product GetProductByID(int id)
        {
            return _repository.GetProductByID(id);
        }

        public Product UpdateProduct(Product obj)
        {
            return _repository.UpdateProduct(obj);
        }
    }
}

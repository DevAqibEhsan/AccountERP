using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IProductService
    {
        public List<Product> GetAll();

        public List<Product> GetAllActive();

        Product AddProduct(Product obj);

        Product UpdateProduct(Product obj);

        Product GetProductByID(int id);
    }
}

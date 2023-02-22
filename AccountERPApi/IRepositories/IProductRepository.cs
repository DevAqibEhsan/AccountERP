using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IProductRepository
    {
        public List<Product> GetAll();

        public List<Product> GetAllActive();

        Product AddProduct(Product obj);

        Product UpdateProduct(Product obj);

        Product GetProductByID(int id);

        object GetAllProduct_Attribute_Brand_Category_Type_Data();
    }
}

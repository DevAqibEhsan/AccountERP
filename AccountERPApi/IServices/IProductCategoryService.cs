using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IProductCategoryService
    {
        public List<ProductCategory> GetAll();

        ProductCategory AddProductCategory(ProductCategory obj);

        ProductCategory UpdateProductCategory(ProductCategory obj);

        ProductCategory GetProductCategoryByID(int id);
    }
}

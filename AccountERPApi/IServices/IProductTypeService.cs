using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IProductTypeService
    {
        public List<ProductType> GetAll();

        ProductType AddProductType(ProductType obj);

        ProductType UpdateProductType(ProductType obj);

        ProductType GetProductTypeByID(int id);
    }
}

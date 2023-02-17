using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IProductBrandService
    {
        public List<ProductBrand> GetAll();

        ProductBrand AddProductBrand(ProductBrand obj);

        ProductBrand UpdateProductBrand(ProductBrand obj);

        ProductBrand GetProductBrandByID(int id);
    }
}

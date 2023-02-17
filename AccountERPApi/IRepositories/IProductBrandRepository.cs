using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IProductBrandRepository
    {
        public List<ProductBrand> GetAll();

        ProductBrand AddProductBrand(ProductBrand obj);

        ProductBrand UpdateProductBrand(ProductBrand obj);

        ProductBrand GetProductBrandByID(int id);
    }
}

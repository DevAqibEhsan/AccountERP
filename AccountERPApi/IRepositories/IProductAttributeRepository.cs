using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface IProductAttributeRepository
    {
        public List<ProductAttribute> GetAll();

        ProductAttribute AddProductAttribute(ProductAttribute obj);

        ProductAttribute UpdateProductAttribute(ProductAttribute obj);

        ProductAttribute GetProductAttributeByID(int id);
    }
}

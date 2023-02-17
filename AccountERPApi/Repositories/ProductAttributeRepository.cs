using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class ProductAttributeRepository : IProductAttributeRepository
    {
        private readonly IDapper _dapper;
        public ProductAttributeRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ProductAttribute AddProductAttribute(ProductAttribute obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductAttributeName", obj.ProductAttributeName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductAttribute>(@"usp_ProductAttribute_Add", parameters);
        }

        public List<ProductAttribute> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ProductAttribute>(@"usp_ProductAttribute_GetAll", parameters);
        }

        public ProductAttribute GetProductAttributeByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductAttributeID", id, DbType.Int32, ParameterDirection.Input);
            
            return _dapper.Get<ProductAttribute>(@"usp_ProductAttribute_GetProductAttributeByID", parameters);
        }

        public ProductAttribute UpdateProductAttribute(ProductAttribute obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductAttributeID", obj.ProductAttributeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductAttributeName", obj.ProductAttributeName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductAttribute>(@"usp_ProductAttribute_Update", parameters);
        }
    }
}

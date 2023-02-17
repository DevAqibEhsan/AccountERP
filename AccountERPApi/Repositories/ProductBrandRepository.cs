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
    public class ProductBrandRepository : IProductBrandRepository
    {
        private readonly IDapper _dapper;
        public ProductBrandRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ProductBrand AddProductBrand(ProductBrand obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductBrandName", obj.ProductBrandName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductBrand>(@"usp_ProductBrand_Add", parameters);
        }

        public List<ProductBrand> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ProductBrand>(@"usp_ProductBrand_GetAll", parameters);
        }

        public ProductBrand GetProductBrandByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductBrandID", id, DbType.Int32, ParameterDirection.Input);
            
            return _dapper.Get<ProductBrand>(@"usp_ProductBrand_GetProductBrandByID", parameters);
        }

        public ProductBrand UpdateProductBrand(ProductBrand obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductBrandID", obj.ProductBrandID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductBrandName", obj.ProductBrandName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductBrand>(@"usp_ProductBrand_Update", parameters);
        }
    }
}

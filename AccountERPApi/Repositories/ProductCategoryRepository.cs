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
    public class ProductCategoryRepository : IProductCategoryRepository
    {
        private readonly IDapper _dapper;
        public ProductCategoryRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ProductCategory AddProductCategory(ProductCategory obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductCategoryName", obj.ProductCategoryName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductCategory>(@"usp_ProductCategory_Add", parameters);
        }

        public List<ProductCategory> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ProductCategory>(@"usp_ProductCategory_GetAll", parameters);
        }

        public ProductCategory GetProductCategoryByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductCategoryID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<ProductCategory>(@"usp_ProductCategory_GetProductCategoryByID", parameters);
        }

        public ProductCategory UpdateProductCategory(ProductCategory obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductCategoryID", obj.ProductCategoryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductCategoryName", obj.ProductCategoryName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductCategory>(@"usp_ProductCategory_Update", parameters);
        }
    }
}

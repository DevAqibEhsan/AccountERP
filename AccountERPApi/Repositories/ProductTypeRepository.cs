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
    public class ProductTypeRepository: IProductTypeRepository
    {
        private readonly IDapper _dapper;
        public ProductTypeRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ProductType AddProductType(ProductType obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductTypeName", obj.ProductTypeName, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductType>(@"usp_ProductType_Add", parameters);
        }

        public List<ProductType> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<ProductType>(@"usp_ProductType_GetAll", parameters);
        }

        public ProductType GetProductTypeByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductTypeID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<ProductType>(@"usp_ProductType_GetProductTypeByID", parameters);
        }

        public ProductType UpdateProductType(ProductType obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductTypeID", obj.ProductTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductTypeName", obj.ProductTypeName, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<ProductType>(@"usp_ProductType_Update", parameters);
        }
    }
}

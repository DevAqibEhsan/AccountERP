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
    public class ProductRepository : IProductRepository
    {
        private readonly IDapper _dapper;
        public ProductRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public Product AddProduct(Product obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductName", obj.ProductName, DbType.String, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("ProductAttributeID", obj.ProductAttributeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductBrandID", obj.ProductBrandID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductTypeID", obj.ProductTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductCategoryID", obj.ProductCategoryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductImage", obj.ProductImage, DbType.String, ParameterDirection.Input);
            parameters.Add("MinStock", obj.MinStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("MaxStock", obj.MaxStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ReOrderLevel", obj.ReOrderLevel, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ManageStock", obj.ManageStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CostPrice", obj.CostPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("UserDefinedCostPrice", obj.UserDefinedCostPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("PurchasePrice", obj.PurchasePrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("RetailPrice", obj.RetailPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("ProfitMarginPercentage", obj.ProfitMarginPercentage, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProfitMarginAmount", obj.ProfitMarginAmount, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<Product>(@"usp_Product_Add", parameters);
        }

        public List<Product> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<Product>(@"usp_Product_GetAll", parameters);
        }

        public List<Product> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<Product>(@"usp_Product_GetAllActive", parameters);
        }

        public Product GetProductByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductID", id, DbType.String, ParameterDirection.Input);

            return _dapper.Get<Product>(@"usp_Product_GetProductByID", parameters);
        }

        public Product UpdateProduct(Product obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("ProductID", obj.ProductID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductName", obj.ProductName, DbType.String, ParameterDirection.Input);
            parameters.Add("Description", obj.Description, DbType.String, ParameterDirection.Input);
            parameters.Add("ProductAttributeID", obj.ProductAttributeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductBrandID", obj.ProductBrandID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductTypeID", obj.ProductTypeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductCategoryID", obj.ProductCategoryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProductImage", obj.ProductImage, DbType.String, ParameterDirection.Input);
            parameters.Add("MinStock", obj.MinStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("MaxStock", obj.MaxStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ReOrderLevel", obj.ReOrderLevel, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ManageStock", obj.ManageStock, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CostPrice", obj.CostPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("UserDefinedCostPrice", obj.UserDefinedCostPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("PurchasePrice", obj.PurchasePrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("RetailPrice", obj.RetailPrice, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("ProfitMarginPercentage", obj.ProfitMarginPercentage, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ProfitMarginAmount", obj.ProfitMarginAmount, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<Product>(@"usp_Product_Update", parameters);
        }
    }
}

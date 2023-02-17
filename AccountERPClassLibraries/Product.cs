using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public int ProductAttributeID { get; set; }
        public string ProductAttributeName { get; set; }
        public int ProductBrandID { get; set; }
        public string ProductBrandName { get; set; }
        public int ProductTypeID { get; set; }
        public string ProductTypeName { get; set; }
        public int ProductCategoryID { get; set; }
        public string ProductCategoryName { get; set; }
        public string ProductImage { get; set; }
        public int MinStock { get; set; }
        public int MaxStock { get; set; }
        public int ReOrderLevel { get; set; }
        public int ManageStock { get; set; }
        public decimal CostPrice { get; set; }
        public decimal UserDefinedCostPrice { get; set; }
        public decimal PurchasePrice { get; set; }
        public decimal RetailPrice { get; set; }
        public int ProfitMarginPercentage { get; set; }
        public decimal ProfitMarginAmount { get; set; }
        public int IsActive { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }
}

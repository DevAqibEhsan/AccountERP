using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class Vendor
    {
		public int VendorID { get; set; }
		public string VendorName { get; set; }
		public string PostalPhone { get; set; }
		public string PostalAddress2 { get; set; }
		public string PostalAddress1 { get; set; }
		public int PostalCityID { get; set; }
		public string PostalCityName { get; set; }
		public int PostalStateID { get; set; }
		public string PostalStateName { get; set; }
		public string PostalZipCode { get; set; }
		public int PostalCountryID { get; set; }
		public string PostalCountryName { get; set; }
		public string BillingPhone { get; set; }
		public string BillingAddress1 { get; set; }
		public string BillingAddress2 { get; set; }
		public int BillingCityID { get; set; }
		public string BillingCityName { get; set; }
		public int BillingStateID { get; set; }
		public string BillingStateName { get; set; }
		public string BillingZipCode { get; set; }
		public int BillingCountryID { get; set; }
		public string BillingCountryName { get; set; }
		public int IsActive { get; set; }
		public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
		public int CompanyID { get; set; }
		public string CompanyName { get; set; }
		public int BranchID { get; set; }
		public string BranchName { get; set; }
	}
}

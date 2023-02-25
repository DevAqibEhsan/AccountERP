using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class Company
    {
		public int CompanyID { get; set; }
		public string CompanyName { get; set; }
		public string PostalPhone { get; set; }
		public string PostalAddress1 { get; set; }
		public string PostalAddress2 { get; set; }
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
		public string BillingCountryID { get; set; }
		public string BillingCountryName { get; set; }
		public string CompanyLogo { get; set; }
		public string NTN { get; set; }
		public string STN { get; set; }
		public string WebsiteURL { get; set; }
		public string POSID { get; set; }
		public int BusinessTypeID { get; set; }
		public string BusinessTypeName { get; set; }
		public int TimeZoneID { get; set; }
		public string TimeZoneName { get; set; }
		public int NoOfUsers { get; set; }
		public int IsAllowPowerBy { get; set; }
		public string PoweredBy { get; set; }
		public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }
}

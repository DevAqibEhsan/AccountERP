using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class WareHouse
    {
		public int WareHouseID { get; set; }
		public int CompanyID { get; set; }
		public string CompanyName { get; set; }
		public int BranchID { get; set; }
		public string BranchName { get; set; }
		public string WareHouseCode { get; set; }
		public string WareHouseName { get; set; }
		public string Phone { get; set; }
		public string Address1 { get; set; }
		public string Address2 { get; set; }
		public int CityID { get; set; }
		public string CityName { get; set; }
		public int StateID { get; set; }
		public string StateName { get; set; }
		public string ZipCode { get; set; }
		public int CountryID { get; set; }
		public string CountryName { get; set; }
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

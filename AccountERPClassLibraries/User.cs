using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class User
    {
		public int UserID { get; set; }
		public int RoleID { get; set; }
		public string RoleName { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string UserName { get; set; }
		public string Email { get; set; }
		public string Password { get; set; }
		public string Phone { get; set; }
		public string Address1 { get; set; }
		public string Address2 { get; set; }
		public int CityID { get; set; }
		public string CityName { get; set; }
		public int StateID { get; set; }
		public string StateName { get; set; }
		public int ZipCode { get; set; }
		public int CountryID { get; set; }
		public string CountryName { get; set; }
		public string Gender { get; set; }
		public DateTime DOB { get; set; }
		public int IsActive { get; set; }
		public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
		public string CompanyIDs { get; set; }
		public string BranchIDs { get; set; }
	}
}

using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class DefaultAccount
    {
        public int AccountID { get; set; }
        public string AccountName { get; set; }
        public int IsSubAccountOf { get; set; }
        public string IsSubAccountOfName { get; set; }
        public string Description { get; set; }
        public int IsActive { get; set; }
        public string AccountCode { get; set; }
        public int IsSystemAccount { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }

   public class ChartAccount
    {
        public int AccountByCompanyBranchID { get; set; }
        public int AccountID { get; set; }
        public string AccountCode { get; set; }
        public string AccountByCompanyBranchName { get; set; }
        public int IsSubAccountOf { get; set; }
        public string IsSubAccountOfName { get; set; }
        public string Description { get; set; }
        public int IsActive { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public int BranchID { get; set; }
        public string BranchName { get; set; }
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

using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class Branch
    {
        public int BranchID { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public string BranchCode { get; set; }
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

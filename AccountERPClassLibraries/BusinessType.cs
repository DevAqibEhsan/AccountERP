using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class BusinessType
    {
        public int BusinessTypeID { get; set; }
        public string BusinessTypeName { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public int IsActive { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }
}

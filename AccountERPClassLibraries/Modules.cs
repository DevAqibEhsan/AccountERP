using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class Modules
    {
        public int ModuleID { get; set; }
        public string ModuleName { get; set; }
        public string NameAsModuleID { get; set; }
        public string Icon { get; set; }
        public int OrderN { get; set; }
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

    public class ModulePageAction
    {
        public int ModulePageActionID { get; set; }
        public int ModulePageID { get; set; }
        public string ModulePageActionName { get; set; }
    }
}

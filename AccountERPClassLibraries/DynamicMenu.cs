using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class DynamicMenu
    {
        public string ModuleName { get; set; }
        public string NameAsModuleID { get; set; }
        public string Icon { get; set; }
        public int OrderN { get; set; }
        public List<DynamicSubMenu> DynamicSubMenues { get; set; }
    }

    public class DynamicSubMenu
    {
        public string ModulePageName { get; set; }
        public string ControllerURL { get; set; }
        public string ActionURL { get; set; }
        public int OrderN { get; set; }
    }
}

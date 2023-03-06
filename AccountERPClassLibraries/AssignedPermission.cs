using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class AssignedPermission
    {
        public int AssignedPermissionID { get; set; }
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public int ModulePageActionID { get; set; }
        public string ModulePageActionIDs { get; set; }
        public string ModuleName { get; set; }
        public string ModulePageName { get; set; }
        public string ModulePageActionName { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }

    public class AssignedPermissionV2
    {
        public int AssignedPermissionID { get; set; }
        public int RoleID { get; set; }
        public int ModuleID { get; set; }
        public int ModulePageID { get; set; }
        public int ModulePageActionID { get; set; }
    }
}

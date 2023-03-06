using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries.DTOLibraries
{
    public class ClaimDTO
    {
        public int UserID { get; set; }
        public int RoleID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string DynamicMenu { get; set; }
        public List<int> Companies { get; set; }
        public List<int> Branches { get; set; }
        public string Permissions { get; set; }
    }

    public class ClaimDTOInherit : ClaimDTO
    {
        public string CompanyIdsText { get; set; }
        public string BranchIdsText { get; set; }
    }
}

using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Utility
{
    public class CheckPermission
    {
        
        public static bool IsPermissionAllow(ClaimDTO claimDTO)
        {
            bool HasPermission = false;
            var Permissions = JsonConvert.DeserializeObject<List<string>>(claimDTO.Permissions);

            if (Permissions != null && Permissions.Count > 0 && Permissions.Contains(PermissionEnum.ViewModule.ToString()))
            {
                HasPermission = true;
            }

            return HasPermission;
        }
    }
}

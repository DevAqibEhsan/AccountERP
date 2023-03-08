using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MyCorePloicy")]
    public class AuthenticationController : ControllerBase
    {
        private readonly IAuthenticationService _authenticationService;
        private readonly IModulesService _modulesService;
        private readonly IModulePagesService _modulePagesService;
        private readonly IAssignedPermissionService _assignedPermissionService;
        private readonly ISiteConfigService _siteConfigService;
        private readonly ICompanyService _companyService;

        public AuthenticationController(IAuthenticationService authenticationService,IModulesService modulesService,IModulePagesService modulePagesService, IAssignedPermissionService assignedPermissionService, ISiteConfigService siteConfigService, ICompanyService companyService)
        {
            _authenticationService = authenticationService;
            _modulesService = modulesService;
            _modulePagesService = modulePagesService;
            _assignedPermissionService = assignedPermissionService;
            _siteConfigService = siteConfigService;
            _companyService = companyService;
        }

        [HttpPost("Authenticate")]
        public Response Authenticate(LoginCredentials obj)
        {
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            try
            {
                if (!string.IsNullOrEmpty(obj.Email) && !string.IsNullOrEmpty(obj.Password))
                {
                    //obj.Password = Secure.EncryptData(obj.Password);
                    var user = _authenticationService.Authenticate(obj);

                    if (user == null)
                    {
                        return CustomStatusResponse.GetResponse(320);
                    }
                    else
                    {
                        #region Super Admin Section
                        if (user.RoleID == 1) // Super Admin
                        {
                            #region Dynamic Menu Start
                            List<DynamicMenu> dynamicMenuList = new List<DynamicMenu>();

                            var Modules = _modulesService.GetAllActive().ToList();
                            var ModulePages = _modulePagesService.GetAllActive().ToList();

                            if (Modules.Count > 0)
                            {
                                if (ModulePages.Count > 0)
                                {
                                    for (int i = 0; i < Modules.Count; i++)
                                    {
                                        var ModuleName = Modules[i].ModuleName;
                                        DynamicMenu dynamicMenu = new DynamicMenu();
                                        dynamicMenu.ModuleName = ModuleName == null ? "No Module" : ModuleName;
                                        dynamicMenu.NameAsModuleID = Modules[i].NameAsModuleID;
                                        dynamicMenu.Icon = Modules[i].Icon;
                                        dynamicMenu.OrderN = Modules[i].OrderN;
                                        dynamicMenu.DynamicSubMenues = new List<DynamicSubMenu>();
                                        var Pages = ModulePages.Where(x => x.ModuleID == Modules[i].ModuleID).ToList();

                                        for (int j = 0; j < Pages.Count; j++)
                                        {
                                            DynamicSubMenu dynamicSubMenu = new DynamicSubMenu();

                                            dynamicSubMenu.ModulePageName = Pages[j].ModulePageName;
                                            dynamicSubMenu.ControllerURL = Pages[j].ControllerURL;
                                            dynamicSubMenu.ActionURL = Pages[j].ActionURL;
                                            dynamicSubMenu.OrderN = Pages[j].OrderN;
                                            dynamicMenu.DynamicSubMenues.Add(dynamicSubMenu);
                                        }

                                        dynamicMenuList.Add(dynamicMenu);
                                    }
                                }
                            }

                            if (dynamicMenuList != null && dynamicMenuList.Count > 0)
                            {
                                for (int i = 0; i < dynamicMenuList.Count; i++)
                                {
                                    dynamicMenuList[i].DynamicSubMenues = dynamicMenuList[i].DynamicSubMenues.OrderBy(o => o.OrderN).ToList();
                                }

                            }

                            dynamicMenuList = dynamicMenuList.OrderBy(O => O.OrderN).ToList();

                            #endregion

                            #region Site Configuration Start

                            var AdminSiteConfig = _siteConfigService.GetAllActive();
                            
                            #endregion

                            user.DynamicMenu = JsonConvert.SerializeObject(dynamicMenuList);
                            user.Permissions = "";
                            user.SiteLogo = "./../SiteConfigMedia/" + AdminSiteConfig[0].Logo;
                            user.PoweredByText = TokenReplacement.StringTokenReplacement(AdminSiteConfig[0].PoweredBy);
                            user.SiteURL = StringUtility.JavaScriptVoid;
                        }

                        #endregion

                        #region Other Admin Section
                        else // Other User
                        {
                            #region Dynamic Menu Start

                            List<DynamicMenu> dynamicMenuList = new List<DynamicMenu>();

                            var AssignedPermission = _assignedPermissionService.GetAll().Where(ap => ap.RoleID == user.RoleID).ToList();
                           var AssignedPermissionV2 = _assignedPermissionService.GetAllV2().Where(ap => ap.RoleID == user.RoleID).ToList();

                            var Modules = _modulesService.GetAllActive().Where(m => AssignedPermissionV2.Any(x=> x.ModuleID == m.ModuleID)).ToList();
                            var ModulePages = _modulePagesService.GetAllActive().Where(mp=> Modules.Any(x=> x.ModuleID == mp.ModuleID) && AssignedPermissionV2.Any(y=> y.ModulePageID == mp.ModulePageID)).ToList();

                            if (Modules.Count > 0)
                            {
                                if (ModulePages.Count > 0)
                                {
                                    for (int i = 0; i < Modules.Count; i++)
                                    {
                                        var ModuleName = Modules[i].ModuleName;
                                        DynamicMenu dynamicMenu = new DynamicMenu();
                                        dynamicMenu.ModuleName = ModuleName == null ? "No Module" : ModuleName;
                                        dynamicMenu.NameAsModuleID = Modules[i].NameAsModuleID;
                                        dynamicMenu.Icon = Modules[i].Icon;
                                        dynamicMenu.OrderN = Modules[i].OrderN;
                                        dynamicMenu.DynamicSubMenues = new List<DynamicSubMenu>();
                                        var Pages = ModulePages.Where(x => x.ModuleID == Modules[i].ModuleID).ToList();

                                        for (int j = 0; j < Pages.Count; j++)
                                        {
                                            DynamicSubMenu dynamicSubMenu = new DynamicSubMenu();

                                            dynamicSubMenu.ModulePageName = Pages[j].ModulePageName;
                                            dynamicSubMenu.ControllerURL = Pages[j].ControllerURL;
                                            dynamicSubMenu.ActionURL = Pages[j].ActionURL;
                                            dynamicSubMenu.OrderN = Pages[j].OrderN;
                                            dynamicMenu.DynamicSubMenues.Add(dynamicSubMenu);
                                        }

                                        dynamicMenuList.Add(dynamicMenu);
                                    }
                                }
                            }

                            if (dynamicMenuList != null && dynamicMenuList.Count > 0)
                            {
                                for (int i = 0; i < dynamicMenuList.Count; i++)
                                {
                                    dynamicMenuList[i].DynamicSubMenues = dynamicMenuList[i].DynamicSubMenues.OrderBy(o => o.OrderN).ToList();
                                }

                            }

                            dynamicMenuList = dynamicMenuList.OrderBy(O => O.OrderN).ToList();

                            #endregion

                            #region Site Configuration Start

                            var SiteConfig = _companyService.GetCompanyByID(user.Companies[0]);
                            var OtherUserSiteConfig = _siteConfigService.GetAllActive();

                            user.PoweredByText = SiteConfig.IsAllowPowerBy == 1 ? !string.IsNullOrEmpty(SiteConfig.PoweredBy) ? TokenReplacement.StringTokenReplacement(SiteConfig.PoweredBy) : TokenReplacement.StringTokenReplacement(OtherUserSiteConfig[0].PoweredBy) : TokenReplacement.StringTokenReplacement(OtherUserSiteConfig[0].PoweredBy);
                            user.SiteLogo = !string.IsNullOrEmpty(SiteConfig.CompanyLogo) ? "./../CompanyMedia/" + SiteConfig.CompanyLogo : "./../SiteConfigMedia/" + OtherUserSiteConfig[0].Logo;
                            user.SiteURL = !string.IsNullOrEmpty(SiteConfig.WebsiteURL) ? SiteConfig.WebsiteURL : StringUtility.JavaScriptVoid;

                            #endregion

                            user.DynamicMenu = JsonConvert.SerializeObject(dynamicMenuList);
                            user.Permissions = JsonConvert.SerializeObject(AssignedPermission.Select(x=> x.ModulePageActionName));

                        }
                        #endregion

                        var menu = JsonConvert.DeserializeObject<List<DynamicMenu>>(user.DynamicMenu);
                        user.DynamicMenu = "";
                        response = CustomStatusResponse.GetResponse(200);
                        response.Token = TokenManager.GenerateToken(user);
                        response.Data = new
                        {
                            DataObj = user,
                            Menu = menu,
                            IndexPageController = menu[0].DynamicSubMenues[0].ControllerURL,
                            IndexPageAction = menu[0].DynamicSubMenues[0].ActionURL

                        };

                        //return response;
                    }
                }
                else
                {
                    response.Status = 0;
                    response.ResponseMsg = "Please enter Username and Password !";
                }
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("Logout")]
        public Response Logout()
        {
            Response response = new Response();
            try
            {
                string token = Request.Headers["Authorization"];
                if (token != null)
                {
                    TokenManager.RemoveToken(token);
                }

                response = CustomStatusResponse.GetResponse(200);
                response.Data = null;
                response.Token = null;
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }
    }
}

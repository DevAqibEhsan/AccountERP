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

        public AuthenticationController(IAuthenticationService authenticationService,IModulesService modulesService,IModulePagesService modulePagesService)
        {
            _authenticationService = authenticationService;
            _modulesService = modulesService;
            _modulePagesService = modulePagesService;
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
                            user.DynamicMenu = JsonConvert.SerializeObject(dynamicMenuList);
                        }

                        #endregion

                        #region Other Admin Section
                        else // Other User
                        {

                        }
                        #endregion

                        var menu = JsonConvert.DeserializeObject<List<DynamicMenu>>(user.DynamicMenu);

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

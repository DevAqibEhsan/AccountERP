using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManageSiteConfigController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private ISiteConfigService _siteConfigService;

        private readonly IHubContext<SignalrServer> _signalrHub;

        private string SiteConfigMediaURL = string.Empty;
        public ManageSiteConfigController(IConfiguration configuration,ISiteConfigService siteConfigService, IHubContext<SignalrServer> signalrHub)
        {
            _siteConfigService = siteConfigService;
            _signalrHub = signalrHub;
            _configuration = configuration;

            SiteConfigMediaURL = _configuration.GetSection("UrlSetting").GetSection("SiteConfigMediaURL").Value;

        }
        [HttpPost("GetAll")]
        public Response GetAll()
        {
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            try
            {
                claimDTO = TokenManager.GetValidateToken(Request);

                if (claimDTO != null)
                {
                    bool HasPermission = true;

                    if (claimDTO.RoleID != 1)
                    {
                        HasPermission = false;
                        // Here We Check Permission and than Set True
                    }

                    if (HasPermission)
                    {
                        var Data = _siteConfigService.GetAll().ToList();

                        response.Status = 200;
                        response.Token = TokenManager.GenerateToken(claimDTO);
                        response.Data = Data;
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = null;
                        response.Data = null;
                    }
                }
                else
                {
                    response.Status = 401;
                    response.ResponseMsg = "unauthorized";
                    response.Token = null;
                    response.Data = null;
                }
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("GetAllActive")]
        public Response GetAllActive()
        {
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            try
            {
                claimDTO = TokenManager.GetValidateToken(Request);

                if (claimDTO != null)
                {
                    bool HasPermission = true;

                    if (claimDTO.RoleID != 1)
                    {
                        HasPermission = false;
                        // Here We Check Permission and than Set True
                    }

                    if (HasPermission)
                    {
                        var Data = _siteConfigService.GetAllActive().ToList();

                        response.Status = 200;
                        response.Token = TokenManager.GenerateToken(claimDTO);
                        response.Data = Data;
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = null;
                        response.Data = null;
                    }
                }
                else
                {
                    response.Status = 401;
                    response.ResponseMsg = "unauthorized";
                    response.Token = null;
                    response.Data = null;
                }
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("AddSiteConfig")]
        public Response AddSiteConfig()
        {
            SiteConfig obj;
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            string fileName = string.Empty;
            string filePath = string.Empty;

            try
            {
                claimDTO = TokenManager.GetValidateToken(Request);

                if (claimDTO != null)
                {
                    bool HasPermission = true;

                    if (claimDTO.RoleID != 1)
                    {
                        HasPermission = false;
                        // Here We Check Permission and than Set True
                    }

                    if (HasPermission)
                    {
                        var Data = _siteConfigService.GetAll().ToList();

                        obj = new SiteConfig();

                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "SiteConfig_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(SiteConfigMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }

                        obj.Logo = fileName;
                        obj.PoweredBy = Convert.ToString(Request.Form["PoweredBy"]);
                        obj.IsActive = Convert.ToInt32(Request.Form["IsActive"]);

                        var CheckActiveSiteConfig = Data.Where(x => x.IsActive == 1).Count();

                        if (CheckActiveSiteConfig > 0 && obj.IsActive == 1)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "1 Configuration allow for Active.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }

                        else
                        {
                            obj.CreatedBy = claimDTO.UserID;
                            obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _siteConfigService.AddSiteConfig(obj);
                            _signalrHub.Clients.All.SendAsync("LoadSiteConfig");

                            if (!string.IsNullOrEmpty(res.Logo))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "Configuration Is Successfully Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                DeleteFile(filePath);
                                response.Status = 0;
                                response.ResponseMsg = "This Configuration Data is not Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = null;
                            }
                        }
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = null;
                        response.Data = null;
                    }
                }
                else
                {
                    response.Status = 401;
                    response.ResponseMsg = "unauthorized";
                    response.Token = null;
                    response.Data = null;
                }
            }
            catch (Exception ex)
            {
                DeleteFile(filePath);
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("UpdateSiteConfig")]
        public Response UpdateSiteConfig()
        {
            SiteConfig obj;
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            string fileName = string.Empty;
            string filePath = string.Empty;

            try
            {
                claimDTO = TokenManager.GetValidateToken(Request);

                if (claimDTO != null)
                {
                    bool HasPermission = true;

                    if (claimDTO.RoleID != 1)
                    {
                        HasPermission = false;
                        // Here We Check Permission and than Set True
                    }

                    if (HasPermission)
                    {
                        var Data = _siteConfigService.GetAll().ToList();

                        obj = new SiteConfig();

                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "SiteConfig_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(SiteConfigMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }

                        obj.ConfigurationID = Convert.ToInt32(Request.Form["ConfigurationID"]);
                        obj.Logo = fileName;
                        obj.PoweredBy = Convert.ToString(Request.Form["PoweredBy"]);
                        obj.IsActive = Convert.ToInt32(Request.Form["IsActive"]);

                        var CheckActiveSiteConfig = Data.Where(x => x.ConfigurationID != obj.ConfigurationID && x.IsActive == 1).Count();

                        if (CheckActiveSiteConfig > 0 && obj.IsActive ==1)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "1 Configuration allow for Active.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            obj.ModifiedBy = claimDTO.UserID;
                            obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var Pre_res = _siteConfigService.GetSiteConfigByID(obj.ConfigurationID);
                            var res = _siteConfigService.UpdateSiteConfig(obj);

                            _signalrHub.Clients.All.SendAsync("LoadSiteConfig");

                            if (!string.IsNullOrEmpty(res.Logo))
                            {
                                if (Pre_res.Logo != res.Logo)
                                {
                                    DeletePreviousFile(Pre_res);
                                }

                                response.Status = 200;
                                response.ResponseMsg = "Configuration Is Successfully Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                DeleteFile(filePath);
                                response.Status = 0;
                                response.ResponseMsg = "This Configuration Data is not Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = null;
                            }
                        }
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = null;
                        response.Data = null;
                    }
                }
                else
                {
                    response.Status = 401;
                    response.ResponseMsg = "unauthorized";
                    response.Token = null;
                    response.Data = null;
                }
            }
            catch (Exception ex)
            {
                DeleteFile(filePath);
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("GetSiteConfigByID/{id}")]
        public Response GetSiteConfigByID(int id)
        {
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            try
            {
                claimDTO = TokenManager.GetValidateToken(Request);

                if (claimDTO != null)
                {
                    bool HasPermission = true;

                    if (claimDTO.RoleID != 1)
                    {
                        HasPermission = false;
                        // Here We Check Permission and than Set True
                    }

                    if (HasPermission)
                    {
                        var Data = _siteConfigService.GetSiteConfigByID(id);
                        if (Data != null)
                        {
                            response.Status = 200;
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = Data;
                        }
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = null;
                        response.Data = null;
                    }
                }
                else
                {
                    response.Status = 401;
                    response.ResponseMsg = "unauthorized";
                    response.Token = null;
                    response.Data = null;
                }
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        public void DeleteFile(string FileNameWithPath)
        {
            if (!string.IsNullOrEmpty(FileNameWithPath))
            {
                FileInfo file = new FileInfo(FileNameWithPath);
                if (file.Exists)//check file exsit or not  
                {
                    file.Delete();
                }
            }
        }

        public void DeletePreviousFile(SiteConfig var)
        {
            string FilePath = Path.Combine(SiteConfigMediaURL, var.Logo);

            DeleteFile(FilePath);
        }

        [HttpPost("GetActiveSiteConfiguration")]
        public Response GetActiveSiteConfiguration()
        {
            Response response = new Response();

            try
            {
                var Data = _siteConfigService.GetAllActive().ToList();

               

                response.Status = 200;
                response.Data = new {
                    PoweredByText = TokenReplacement.StringTokenReplacement(Data[0].PoweredBy),
                    SiteLogo=Data[0].Logo
                };
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

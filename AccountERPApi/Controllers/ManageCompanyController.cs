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
    public class ManageCompanyController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly ICompanyService _companyService;
        private readonly IHubContext<SignalrServer> _signalrHub;

        private string CompanyMediaURL = string.Empty;
        public ManageCompanyController(IConfiguration configuration, ICompanyService companyService, IHubContext<SignalrServer> signalrHub)
        {
            _configuration = configuration;
            _companyService = companyService;
            _signalrHub = signalrHub;

            CompanyMediaURL = _configuration.GetSection("UrlSetting").GetSection("CompanyMediaURL").Value;
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
                        var Data = _companyService.GetAll().ToList();

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

        [HttpPost("AddCompany")]
        public Response AddCompany()
        {
            Company obj;
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
                        obj = new Company();

                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "Company_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(CompanyMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }

                        obj.CompanyName = Convert.ToString(Request.Form["CompanyName"]);
                        obj.PostalPhone = Convert.ToString(Request.Form["PostalPhone"]);
                        obj.PostalAddress1 = Convert.ToString(Request.Form["PostalAddress1"]);
                        obj.PostalAddress2 = Convert.ToString(Request.Form["PostalAddress2"]);
                        obj.PostalCityID = Convert.ToInt32(Request.Form["PostalCityID"]);
                        obj.PostalStateID = Convert.ToInt32(Request.Form["PostalStateID"]);
                        obj.PostalZipCode = Convert.ToString(Request.Form["PostalZipCode"]);
                        obj.PostalCountryID = Convert.ToInt32(Request.Form["PostalCountryID"]);
                        obj.BillingPhone = Convert.ToString(Request.Form["BillingPhone"]);
                        obj.BillingAddress1 = Convert.ToString(Request.Form["BillingAddress1"]);
                        obj.BillingAddress2 = Convert.ToString(Request.Form["BillingAddress2"]);
                        obj.BillingCityID = Convert.ToInt32(Request.Form["BillingCityID"]);
                        obj.BillingStateID = Convert.ToInt32(Request.Form["BillingStateID"]);
                        obj.BillingZipCode = Convert.ToString(Request.Form["BillingZipCode"]);
                        obj.BillingCountryID = Convert.ToString(Request.Form["BillingCountryID"]);
                        obj.CompanyLogo = fileName;
                        obj.NTN = Convert.ToString(Request.Form["NTN"]);
                        obj.STN = Convert.ToString(Request.Form["STN"]);
                        obj.WebsiteURL = Convert.ToString(Request.Form["WebsiteURL"]);
                        obj.POSID = Convert.ToString(Request.Form["POSID"]);
                        obj.BusinessTypeID = Convert.ToInt32(Request.Form["BusinessTypeID"]);
                        obj.TimeZoneID = Convert.ToInt32(Request.Form["TimeZoneID"]);
                        obj.NoOfUsers = Convert.ToInt32(Request.Form["NoOfUsers"]);
                        obj.IsAllowPowerBy = Convert.ToInt32(Request.Form["IsAllowPowerBy"]);
                        obj.PoweredBy = Convert.ToString(Request.Form["PoweredBy"]);

                        var Data = _companyService.GetAll().ToList();

                        var CHeckCompanyName = Data.Where(x => x.CompanyName.ToLower() == obj.CompanyName.ToLower()).Count();

                        if (CHeckCompanyName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Company " + obj.CompanyName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }

                        else
                        {
                            obj.CreatedBy = claimDTO.UserID;
                            obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _companyService.AddCompany(obj);
                            _signalrHub.Clients.All.SendAsync("LoadCompany");

                            if (!string.IsNullOrEmpty(res.CompanyName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Company " + obj.CompanyName + " Is Successfully Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                DeleteFileFromURL.DeleteFile(filePath);
                                response.Status = 0;
                                response.ResponseMsg = "This Company " + obj.CompanyName + " Data is not Added.";
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
                DeleteFileFromURL.DeleteFile(filePath);
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("UpdateCompany")]
        public Response UpdateCompany()
        {
            Company obj;
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
                        obj = new Company();

                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "Company_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(CompanyMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }

                        obj.CompanyID = Convert.ToInt32(Request.Form["CompanyID"]);
                        obj.CompanyName = Convert.ToString(Request.Form["CompanyName"]);
                        obj.PostalPhone = Convert.ToString(Request.Form["PostalPhone"]);
                        obj.PostalAddress1 = Convert.ToString(Request.Form["PostalAddress1"]);
                        obj.PostalAddress2 = Convert.ToString(Request.Form["PostalAddress2"]);
                        obj.PostalCityID = Convert.ToInt32(Request.Form["PostalCityID"]);
                        obj.PostalStateID = Convert.ToInt32(Request.Form["PostalStateID"]);
                        obj.PostalZipCode = Convert.ToString(Request.Form["PostalZipCode"]);
                        obj.PostalCountryID = Convert.ToInt32(Request.Form["PostalCountryID"]);
                        obj.BillingPhone = Convert.ToString(Request.Form["BillingPhone"]);
                        obj.BillingAddress1 = Convert.ToString(Request.Form["BillingAddress1"]);
                        obj.BillingAddress2 = Convert.ToString(Request.Form["BillingAddress2"]);
                        obj.BillingCityID = Convert.ToInt32(Request.Form["BillingCityID"]);
                        obj.BillingStateID = Convert.ToInt32(Request.Form["BillingStateID"]);
                        obj.BillingZipCode = Convert.ToString(Request.Form["BillingZipCode"]);
                        obj.BillingCountryID = Convert.ToString(Request.Form["BillingCountryID"]);
                        obj.CompanyLogo = fileName;
                        obj.NTN = Convert.ToString(Request.Form["NTN"]);
                        obj.STN = Convert.ToString(Request.Form["STN"]);
                        obj.WebsiteURL = Convert.ToString(Request.Form["WebsiteURL"]);
                        obj.POSID = Convert.ToString(Request.Form["POSID"]);
                        obj.BusinessTypeID = Convert.ToInt32(Request.Form["BusinessTypeID"]);
                        obj.TimeZoneID = Convert.ToInt32(Request.Form["TimeZoneID"]);
                        obj.NoOfUsers = Convert.ToInt32(Request.Form["NoOfUsers"]);
                        obj.IsAllowPowerBy = Convert.ToInt32(Request.Form["IsAllowPowerBy"]);
                        obj.PoweredBy = Convert.ToString(Request.Form["PoweredBy"]);

                        var Data = _companyService.GetAll().ToList();

                        var CheckCompanyName = Data.Where(x => x.CompanyID != obj.CompanyID && x.CompanyName.ToLower() == obj.CompanyName.ToLower()).Count();

                        if (CheckCompanyName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Company " + obj.CompanyName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            obj.ModifiedBy = claimDTO.UserID;
                            obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var Pre_res = _companyService.GetCompanyByID(obj.CompanyID);
                            var res = _companyService.UpdateCompany(obj);

                            _signalrHub.Clients.All.SendAsync("LoadCompany");

                            if (!string.IsNullOrEmpty(res.CompanyName))
                            {
                                if (res.CompanyLogo != Pre_res.CompanyLogo)
                                {
                                    DeleteFileFromURL.DeletePreviousFile(CompanyMediaURL,Pre_res.CompanyLogo);
                                }

                                response.Status = 200;
                                response.ResponseMsg = "The Company" + obj.CompanyName + " Is Successfully Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                DeleteFileFromURL.DeleteFile(filePath);
                                response.Status = 0;
                                response.ResponseMsg = "This Company " + obj.CompanyName + " Data is not Updated.";
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
                DeleteFileFromURL.DeleteFile(filePath);
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("GetCompanyByID/{id}")]
        public Response GetCompanyByID(int id)
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
                        var Data = _companyService.GetCompanyByID(id);
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
    }
}

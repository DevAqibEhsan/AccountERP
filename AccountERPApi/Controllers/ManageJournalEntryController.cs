using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManageJournalEntryController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IJournalEntryService _journalEntryService;
        private readonly IHubContext<SignalrServer> _signalrHub;

        private string JournalEntryMediaURL = string.Empty;

        public ManageJournalEntryController(IConfiguration configuration, IJournalEntryService journalEntryService, IHubContext<SignalrServer> signalrHub)
        {
            _journalEntryService = journalEntryService;
            _signalrHub = signalrHub;
            _configuration = configuration;


            JournalEntryMediaURL = _configuration.GetSection("UrlSetting").GetSection("JournalEntryMediaURL").Value;
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
                        var Data = _journalEntryService.GetAll().ToList();

                        response.Status = 200;
                        response.Token = TokenManager.GenerateToken(claimDTO);
                        response.Data = Data;
                    }
                    else
                    {
                        response.Status = 403;
                        response.ResponseMsg = "You don’t have permission to this action.";
                        response.Token = TokenManager.GenerateToken(claimDTO);
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

        [HttpPost("AddJournalEntry")]
        public Response AddJournalEntry()
        {
            JournalEntry obj;
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
                        obj = new JournalEntry();
                         
                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "JournalEntry_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(JournalEntryMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }
                         
                        obj.Debit = Convert.ToDecimal(Request.Form["Debit"]);
                        obj.Credit = Convert.ToDecimal(Request.Form["Credit"]);
                        obj.Memo = Convert.ToString(Request.Form["Memo"]);
                        obj.Attachment = fileName;

                        string JsonJournalEntryDetail = Convert.ToString(Request.Form["JournalEntryDetail"]);
                        var JsonToList = JsonConvert.DeserializeObject<List<JournalEntryDetail>>(JsonJournalEntryDetail);

                        List<JournalEntryDetail> list_journalEntryDetail = new List<JournalEntryDetail>();
                        foreach (var item in JsonToList)
                        {
                            JournalEntryDetail obj_jsonEntryDetail = new JournalEntryDetail();
                            obj_jsonEntryDetail.AccountID = item.AccountID;
                            obj_jsonEntryDetail.Description = item.Description;
                            obj_jsonEntryDetail.Debit = item.Debit;
                            obj_jsonEntryDetail.Credit = item.Credit;

                            list_journalEntryDetail.Add(obj_jsonEntryDetail);
                        }
                        
                        obj.CreatedBy = claimDTO.UserID;
                        obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                        obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();
                        if (claimDTO.Companies.Count == 0)
                        {
                            obj.CompanyID = 0;
                        }
                        else
                        {
                            obj.CompanyID = claimDTO.Companies[0];
                        }

                        obj.JournalEntryDetail = list_journalEntryDetail;

                        var res = _journalEntryService.AddJournalEntry(obj);
                        _signalrHub.Clients.All.SendAsync("LoadJournalEntry");

                        response.Status = 200;
                        response.ResponseMsg = "Journal Entry Record Is Successfully Added.";
                        response.Token = TokenManager.GenerateToken(claimDTO);
                        response.Data = res;
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

        [HttpPost("UpdateJournalEntry")]
        public Response UpdateJournalEntry()
        {
            JournalEntry obj;
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
                        obj = new JournalEntry();

                        if (Request.Form.Files.Count > 0)
                        {
                            var file = HttpContext.Request.Form.Files[0];
                            fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                            var fileExtensionArray = file.FileName.Split('.');
                            fileName = "JournalEntry_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                            filePath = Path.Combine(JournalEntryMediaURL, fileName);
                            using (var fileStream = new FileStream(filePath, FileMode.Create))
                            {
                                file.CopyTo(fileStream);
                            }
                        }

                        obj.Debit = Convert.ToDecimal(Request.Form["Debit"]);
                        obj.Credit = Convert.ToDecimal(Request.Form["Credit"]);
                        obj.Memo = Convert.ToString(Request.Form["Memo"]);
                        obj.Attachment = fileName;

                        string JsonJournalEntryDetail = Convert.ToString(Request.Form["JournalEntryDetail"]);
                        var JsonToList = JsonConvert.DeserializeObject<List<JournalEntryDetail>>(JsonJournalEntryDetail);

                        List<JournalEntryDetail> list_journalEntryDetail = new List<JournalEntryDetail>();
                        foreach (var item in JsonToList)
                        {
                            JournalEntryDetail obj_jsonEntryDetail = new JournalEntryDetail();
                            obj_jsonEntryDetail.AccountID = item.AccountID;
                            obj_jsonEntryDetail.Description = item.Description;
                            obj_jsonEntryDetail.Debit = item.Debit;
                            obj_jsonEntryDetail.Credit = item.Credit;

                            list_journalEntryDetail.Add(obj_jsonEntryDetail);
                        }

                        obj.ModifiedBy = claimDTO.UserID;
                        obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                        obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();
                        if (claimDTO.Companies.Count == 0)
                        {
                            obj.CompanyID = 0;
                        }
                        else
                        {
                            obj.CompanyID = claimDTO.Companies[0];
                        }

                        obj.JournalEntryDetail = list_journalEntryDetail;

                        var res = _journalEntryService.UpdateJournalEntry(obj);

                        _signalrHub.Clients.All.SendAsync("LoadJournalEntry");

                        response.Status = 200;
                        response.ResponseMsg = "The Journal Entry Record Is Successfully Updated.";
                        response.Token = TokenManager.GenerateToken(claimDTO);
                        response.Data = res;
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

        [HttpPost("GetJournalEntryByID/{id}")]
        public Response GetJournalEntryByID(int id)
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
                        var Data = _journalEntryService.GetJournalEntryByID(id);
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

using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManageAssignedPermissionController : ControllerBase
    {
        private readonly IAssignedPermissionService _assignedPermissionService;

        private readonly IHubContext<SignalrServer> _signalrHub;
        public ManageAssignedPermissionController(IAssignedPermissionService assignedPermissionService, IHubContext<SignalrServer> signalrHub)
        {
            _assignedPermissionService = assignedPermissionService;
            _signalrHub = signalrHub;
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
                        var Data = _assignedPermissionService.GetAll().ToList();

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

        [HttpPost("AddAssignedPermission")]
        public Response AddAssignedPermission(AssignedPermission obj)
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
                        obj.CreatedBy = claimDTO.UserID;
                        obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                        obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                        var res = _assignedPermissionService.AddAssignedPermission(obj);
                        _signalrHub.Clients.All.SendAsync("LoadAssignedPermission");

                        if (!string.IsNullOrEmpty(res.RoleName))
                        {
                            response.Status = 200;
                            response.ResponseMsg = "The Permission For " + res.RoleName + " Is Successfully Added.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = res;
                        }
                        else
                        {
                            response.Status = 0;
                            response.ResponseMsg = "This Permission Data is not Added.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
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

        [HttpPost("UpdateAssignedPermission")]
        public Response UpdateAssignedPermission(AssignedPermission obj)
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
                        obj.CreatedBy = claimDTO.UserID;
                        obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                        obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                        var res = _assignedPermissionService.UpdateAssignedPermission(obj);

                        _signalrHub.Clients.All.SendAsync("LoadAssignedPermission");

                        if (!string.IsNullOrEmpty(res.RoleName))
                        {
                            response.Status = 200;
                            response.ResponseMsg = "The Permission For " + res.RoleName + " Is Successfully Updated.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = res;
                        }
                        else
                        {
                            response.Status = 0;
                            response.ResponseMsg = "This Permission Data is not Updated.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
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
;
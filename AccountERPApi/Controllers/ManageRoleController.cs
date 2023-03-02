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
    public class ManageRoleController : ControllerBase
    {
        private IRoleService _roleService;

        private readonly IHubContext<SignalrServer> _signalrHub;
        public ManageRoleController(IRoleService roleService, IHubContext<SignalrServer> signalrHub)
        {
            _roleService = roleService;
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
                        var Data = _roleService.GetAll().ToList();

                        if (claimDTO.RoleID != 1)
                        {
                            Data = Data.Where(x => x.RoleID != 1).ToList(); ;
                        }

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

        [HttpPost("AddRole")]
        public Response AddRole(Role obj)
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
                        var Data = _roleService.GetAll().ToList();

                        var CheckRoleName = Data.Where(x => x.RoleName.ToLower() == obj.RoleName.ToLower()).Count();

                        if (CheckRoleName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Role " + obj.RoleName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }

                        else
                        {
                            obj.CreatedBy = claimDTO.UserID;
                            obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _roleService.AddRole(obj);
                            _signalrHub.Clients.All.SendAsync("LoadRole");

                            if (!string.IsNullOrEmpty(res.RoleName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Role " + obj.RoleName + " Is Successfully Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                response.Status = 0;
                                response.ResponseMsg = "This Role " + obj.RoleName + " Data is not Added.";
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
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("UpdateRole")]
        public Response UpdateRole(Role obj)
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
                        var Data = _roleService.GetAll().ToList();

                        var CheckRoleName = Data.Where(x => x.RoleID != obj.RoleID && x.RoleName.ToLower() == obj.RoleName.ToLower()).Count();

                        if (CheckRoleName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Role " + obj.RoleName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            obj.ModifiedBy = claimDTO.UserID;
                            obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _roleService.UpdateRole(obj);

                            _signalrHub.Clients.All.SendAsync("LoadRole");

                            if (!string.IsNullOrEmpty(res.RoleName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Role " + obj.RoleName + " Is Successfully Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                response.Status = 0;
                                response.ResponseMsg = "This Role " + obj.RoleName + " Data is not Updated.";
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
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }

        [HttpPost("GetRoleByID/{id}")]
        public Response GetRoleByID(int id)
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
                        var Data = _roleService.GetRoleByID(id);
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

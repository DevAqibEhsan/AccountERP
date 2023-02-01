﻿using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManageModuleController : ControllerBase
    {
        private IModulesService _modulesService;
        
        public ManageModuleController(IModulesService modulesService)
        {
            _modulesService = modulesService;
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
                        var Data = _modulesService.GetAll().ToList();

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
                        var Data = _modulesService.GetAllActive().ToList();

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

        [HttpPost("AddModule")]
        public Response AddModule(Modules obj)
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

                    if(HasPermission)
                    {
                        var Data = _modulesService.GetAll().ToList();

                        obj.NameAsModuleID = obj.NameAsModuleID.Replace(" ", "").Trim();

                        var CheckNameAsModuleID = Data.Where(x => x.NameAsModuleID.Contains(obj.NameAsModuleID)).ToList();

                        if (CheckNameAsModuleID.Count > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Name As Module ID " + obj.NameAsModuleID + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            var CheckModuleName = Data.Where(x => x.ModuleName.Contains(obj.ModuleName)).ToList();
                            if (CheckModuleName.Count > 0)
                            {
                                response.Status = 0;
                                response.ResponseMsg = "The Module Name " + obj.ModuleName + " Already exists.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = null;
                            }
                            else
                            {
                                obj.CreatedBy = claimDTO.UserID;
                                obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone("Pakistan Standard Time");
                                obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                                var res = _modulesService.AddModule(obj);

                                if (!string.IsNullOrEmpty(res.ModuleName))
                                {
                                    response.Status = 200;
                                    response.ResponseMsg = "The Module " + obj.ModuleName + " Is Successfully Added.";
                                    response.Token = TokenManager.GenerateToken(claimDTO);
                                    response.Data = res;
                                }
                                else
                                {
                                    response.Status = 0;
                                    response.ResponseMsg = "This Module Name " + obj.ModuleName + " Data is not Added.";
                                    response.Token = TokenManager.GenerateToken(claimDTO);
                                    response.Data = null;
                                }
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

        [HttpPost("UpdateModule")]
        public Response UpdateModule(Modules obj)
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
                        var Data = _modulesService.GetAll().ToList();

                        obj.NameAsModuleID = obj.NameAsModuleID.Replace(" ", "").Trim();

                        var CheckNameAsModuleID = Data.Where(x => x.NameAsModuleID.Contains(obj.NameAsModuleID)).ToList();

                        if (CheckNameAsModuleID.Count > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Name As Module ID " + obj.NameAsModuleID + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            var CheckModuleName = Data.Where(x => x.ModuleName.Contains(obj.ModuleName)).ToList();
                            if (CheckModuleName.Count > 0)
                            {
                                response.Status = 0;
                                response.ResponseMsg = "The Module Name " + obj.ModuleName + " Already exists.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = null;
                            }
                            else
                            {
                                obj.ModifiedBy = claimDTO.UserID;
                                obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone("Pakistan Standard Time");
                                obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                                var res = _modulesService.UpdateModule(obj);

                                if (!string.IsNullOrEmpty(res.ModuleName))
                                {
                                    response.Status = 200;
                                    response.ResponseMsg = "The Module ID " + obj.ModuleID + " Is Successfully Updated.";
                                    response.Token = TokenManager.GenerateToken(claimDTO);
                                    response.Data = res;
                                }
                                else
                                {
                                    response.Status = 0;
                                    response.ResponseMsg = "This Module " + obj.ModuleID + " Data is not Updated.";
                                    response.Token = TokenManager.GenerateToken(claimDTO);
                                    response.Data = null;
                                }
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

        [HttpPost("GetModuleByID/{id}")]
        public Response GetModuleByID(int id)
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
                        var Data = _modulesService.GetModuleByID(id);
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

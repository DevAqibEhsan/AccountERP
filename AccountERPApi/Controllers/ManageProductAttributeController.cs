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
    public class ManageProductAttributeController : ControllerBase
    {
        private IProductAttributeService _productAttributeService;

        private readonly IHubContext<SignalrServer> _signalrHub;

        public ManageProductAttributeController(IProductAttributeService productAttributeService, IHubContext<SignalrServer> signalrHub)
        {
            _productAttributeService = productAttributeService;
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
                        var Data = _productAttributeService.GetAll().ToList();

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

        [HttpPost("AddProductAttribute")]
        public Response AddProductAttribute(ProductAttribute obj)
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
                        var Data = _productAttributeService.GetAll().ToList();

                        var CheckProductAttributeName = Data.Where(x => x.ProductAttributeName.ToLower() == obj.ProductAttributeName.ToLower()).Count();

                        if (CheckProductAttributeName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Product Attribute Is " + obj.ProductAttributeName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }

                        else
                        {
                            obj.CreatedBy = claimDTO.UserID;
                            obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _productAttributeService.AddProductAttribute(obj);
                            _signalrHub.Clients.All.SendAsync("LoadProductAttribute");

                            if (!string.IsNullOrEmpty(res.ProductAttributeName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Product Attribute " + obj.ProductAttributeName + " Is Successfully Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                response.Status = 0;
                                response.ResponseMsg = "This Product Attribute " + obj.ProductAttributeName + " Data is not Added.";
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

        [HttpPost("UpdateProductAttribute")]
        public Response UpdateProductAttribute(ProductAttribute obj)
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
                        var Data = _productAttributeService.GetAll().ToList();

                        var CheckProductAttributeName = Data.Where(x => x.ProductAttributeName.ToLower() == obj.ProductAttributeName.ToLower()).Count();

                        if (CheckProductAttributeName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Product Attribute Is " + obj.ProductAttributeName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            obj.ModifiedBy = claimDTO.UserID;
                            obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _productAttributeService.UpdateProductAttribute(obj);

                            _signalrHub.Clients.All.SendAsync("LoadProductAttribute");

                            if (!string.IsNullOrEmpty(res.ProductAttributeName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Product Attribute " + obj.ProductAttributeName + " Is Successfully Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                response.Status = 0;
                                response.ResponseMsg = "This Product Attribute " + obj.ProductAttributeID + " Data is not Updated.";
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

        [HttpPost("GetProductAttributeByID/{id}")]
        public Response GetProductAttributeByID(int id)
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
                        var Data = _productAttributeService.GetProductAttributeByID(id);
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

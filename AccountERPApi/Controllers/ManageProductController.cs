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
    public class ManageProductController : ControllerBase
    {
        private IProductService _productService;
        private IConfiguration _configuration;

        private readonly IHubContext<SignalrServer> _signalrHub;

        private string ProductMediaURL = string.Empty;

        public ManageProductController(IConfiguration configuration,IProductService productService, IHubContext<SignalrServer> signalrHub)
        {
            _productService = productService;
            _signalrHub = signalrHub;
            _configuration = configuration;

            ProductMediaURL = _configuration.GetSection("UrlSetting").GetSection("ProductMediaURL").Value;
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
                        var Data = _productService.GetAll().ToList();

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
                        var Data = _productService.GetAllActive().ToList();

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

        [HttpPost("AddProduct")]
        public Response AddProduct()
        {
            Product obj;
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            string fileName = string.Empty;
            string filePath = string.Empty;

            try
            {
                obj = new Product();

                obj.ProductName = Request.Form["ProductName"];
                obj.ProductAttributeID = Convert.ToInt32(Request.Form["ProductAttributeID"]);
                obj.ProductBrandID = Convert.ToInt32(Request.Form["ProductBrandID"]);
                obj.ProductCategoryID = Convert.ToInt32(Request.Form["ProductCategoryID"]);
                obj.ProductTypeID = Convert.ToInt32(Request.Form["ProductTypeID"]);
                obj.CompanyID = Convert.ToInt32(Request.Form["CompanyID"]);
                obj.Description = Request.Form["Description"];
                obj.MinStock = Convert.ToInt32(Request.Form["MinStock"]);
                obj.MaxStock = Convert.ToInt32(Request.Form["MaxStock"]);
                obj.ReOrderLevel = Convert.ToInt32(Request.Form["ReOrderLevel"]);
                obj.ManageStock = Convert.ToInt32(Request.Form["ManageStock"]);
                obj.CostPrice = Convert.ToDecimal(Request.Form["CostPrice"]);
                obj.UserDefinedCostPrice = Convert.ToDecimal(Request.Form["UserDefinedCostPrice"]);
                obj.PurchasePrice = Convert.ToDecimal(Request.Form["PurchasePrice"]);
                obj.RetailPrice = Convert.ToDecimal(Request.Form["RetailPrice"]);
                obj.ProfitMarginPercentage = Convert.ToInt32(Request.Form["ProfitMarginPercentage"]);
                obj.ProfitMarginAmount = Convert.ToDecimal(Request.Form["ProfitMarginAmount"]);
                obj.IsActive = Convert.ToInt32(Request.Form["IsActive"]);

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
                        var Data = _productService.GetAll().ToList();

                        var CheckProductName = Data.Where(x => x.ProductName.ToLower() == obj.ProductName.ToLower() && x.ProductAttributeID == obj.ProductAttributeID && x.ProductBrandID == obj.ProductBrandID && x.ProductCategoryID == obj.ProductCategoryID && x.ProductTypeID == obj.ProductTypeID && x.CompanyID == obj.CompanyID).Count();

                        if (CheckProductName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Product " + obj.ProductName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }

                        else
                        {
                            if (Request.Form.Files.Count > 0)
                            {
                                string path = Path.Combine(ProductMediaURL, "CompanyID_"+obj.CompanyID);
                                if (!Directory.Exists(path))
                                {
                                    Directory.CreateDirectory(path);
                                }

                                var file = HttpContext.Request.Form.Files[0];
                                fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                                var fileExtensionArray = file.FileName.Split('.');
                                fileName = "Product_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                                filePath = Path.Combine(path, fileName);
                                using (var fileStream = new FileStream(filePath, FileMode.Create))
                                {
                                    file.CopyTo(fileStream);
                                }
                            }

                            obj.ProductImage = fileName;
                            obj.CreatedBy = claimDTO.UserID;
                            obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var res = _productService.AddProduct(obj);
                            _signalrHub.Clients.All.SendAsync("LoadProduct");

                            if (!string.IsNullOrEmpty(res.ProductName))
                            {
                                response.Status = 200;
                                response.ResponseMsg = "The Product " + obj.ProductName + " Is Successfully Added.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                DeleteFile(filePath);
                                response.Status = 0;
                                response.ResponseMsg = "This Product " + obj.ProductName + " Data is not Added.";
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

        [HttpPost("UpdateProduct")]
        public Response UpdateProduct()
        {
            Product obj;
            Response response = new Response();
            ClaimDTO claimDTO = new ClaimDTO();

            string fileName = string.Empty;
            string filePath = string.Empty;

            try
            {
                obj = new Product();

                obj.ProductName = Request.Form["ProductName"];
                obj.ProductAttributeID = Convert.ToInt32(Request.Form["ProductAttributeID"]);
                obj.ProductBrandID = Convert.ToInt32(Request.Form["ProductBrandID"]);
                obj.ProductCategoryID = Convert.ToInt32(Request.Form["ProductCategoryID"]);
                obj.ProductTypeID = Convert.ToInt32(Request.Form["ProductTypeID"]);
                obj.CompanyID = Convert.ToInt32(Request.Form["CompanyID"]);
                obj.ProductID = Convert.ToInt32(Request.Form["ProductID"]);
                obj.Description = Request.Form["Description"];
                obj.MinStock = Convert.ToInt32(Request.Form["MinStock"]);
                obj.MaxStock = Convert.ToInt32(Request.Form["MaxStock"]);
                obj.ReOrderLevel = Convert.ToInt32(Request.Form["ReOrderLevel"]);
                obj.ManageStock = Convert.ToInt32(Request.Form["ManageStock"]);
                obj.CostPrice = Convert.ToDecimal(Request.Form["CostPrice"]);
                obj.UserDefinedCostPrice = Convert.ToDecimal(Request.Form["UserDefinedCostPrice"]);
                obj.PurchasePrice = Convert.ToDecimal(Request.Form["PurchasePrice"]);
                obj.RetailPrice = Convert.ToDecimal(Request.Form["RetailPrice"]);
                obj.ProfitMarginPercentage = Convert.ToInt32(Request.Form["ProfitMarginPercentage"]);
                obj.ProfitMarginAmount = Convert.ToDecimal(Request.Form["ProfitMarginAmount"]);
                obj.IsActive = Convert.ToInt32(Request.Form["IsActive"]);

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
                        var Data = _productService.GetAll().ToList();

                        var CheckProductName = Data.Where(x => x.ProductID != obj.ProductID && x.ProductName.ToLower() == obj.ProductName.ToLower() && x.ProductAttributeID == obj.ProductAttributeID && x.ProductBrandID == obj.ProductBrandID && x.ProductCategoryID == obj.ProductCategoryID && x.ProductTypeID == obj.ProductTypeID).Count();

                        if (CheckProductName > 0)
                        {
                            response.Status = 0;
                            response.ResponseMsg = "The Product " + obj.ProductName + " Already exists.";
                            response.Token = TokenManager.GenerateToken(claimDTO);
                            response.Data = null;
                        }
                        else
                        {
                            if (Request.Form.Files.Count > 0)
                            {
                                string path = Path.Combine(ProductMediaURL, "CompanyID_" + obj.CompanyID);
                                if (!Directory.Exists(path))
                                {
                                    Directory.CreateDirectory(path);
                                }

                                var file = HttpContext.Request.Form.Files[0];
                                fileName = Guid.NewGuid().ToString("N").Substring(0, 12);
                                var fileExtensionArray = file.FileName.Split('.');
                                fileName = "Product_" + fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmssFFF") + "." + fileExtensionArray[fileExtensionArray.Length - 1];
                                filePath = Path.Combine(path, fileName);
                                using (var fileStream = new FileStream(filePath, FileMode.Create))
                                {
                                    file.CopyTo(fileStream);
                                }
                            }

                            obj.ProductImage = fileName;
                            obj.ModifiedBy = claimDTO.UserID;
                            obj.ModifiedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                            obj.ModifiedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                            var Pre_res = _productService.GetProductByID(obj.ProductID);
                            var res = _productService.UpdateProduct(obj);

                            _signalrHub.Clients.All.SendAsync("LoadProduct");

                            if (!string.IsNullOrEmpty(res.ProductName))
                            {
                                DeletePreviousFile(Pre_res);
                                response.Status = 200;
                                response.ResponseMsg = "The Product " + obj.ProductName + " Is Successfully Updated.";
                                response.Token = TokenManager.GenerateToken(claimDTO);
                                response.Data = res;
                            }
                            else
                            {
                                response.Status = 0;
                                response.ResponseMsg = "This Product " + obj.ProductID + " Data is not Updated.";
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

        [HttpPost("GetProductByID/{id}")]
        public Response GetProductByID(int id)
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
                        var Data = _productService.GetProductByID(id);
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

        [HttpPost("GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown")]
        public Response GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown()
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
                        var Data = _productService.GetAllProduct_Attribute_Brand_Category_Type_Data();

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

        public void DeletePreviousFile(Product var)
        {
            string FilePath = Path.Combine(ProductMediaURL, "CompanyID_" + var.CompanyID,var.ProductImage);

            DeleteFile(FilePath);
        }
    }
}

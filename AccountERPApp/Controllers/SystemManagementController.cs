using AccountERPApp.htputlty;
using AccountERPClassLibraries;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SystemManagementController : Controller
    {
        public string ApiBaseURL = "";

        public SystemManagementController(IConfiguration configuration)
        {
            ApiBaseURL = configuration.GetSection("UrlSetting").GetSection("baseApiUrl").Value;
        }

        public IActionResult ManageCompany()
        {
            return View();
        }

        public IActionResult ManageBranch()
        {
            return View();
        }

        public IActionResult ManageWareHouse()
        {
            return View();
        }

        public IActionResult ManageVendor()
        {
            return View();
        }

        public IActionResult ManageAssignedPermission()
        {
            return View();
        }

        public IActionResult ManageUser()
        {
            return View();
        }

        public IActionResult ManageCustomer()
        {
            return View();
        }

        #region Assinged Permission Start

        [HttpPost]
        public Task<object> GetAllAssignedPermission()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageAssignedPermission/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAssignedPermissionByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageAssignedPermission/GetAssignedPermissionByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddAssignedPermission([FromBody] AssignedPermission obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageAssignedPermission/AddAssignedPermission", content, HttpContext);
        }

        [HttpPost]
        public Task<object> UpdateAssignedPermission([FromBody] AssignedPermission obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageAssignedPermission/UpdateAssignedPermission", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllRole_Module_ModulePageAction_Data()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageAssignedPermission/GetAllRole_Module_ModulePageAction_Data", content, HttpContext);
        }

        #endregion

        #region Company Start

        [HttpPost]
        public Task<object> GetAllCompany()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCompany/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetCompanyByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCompany/GetCompanyByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetAllBusinessType_TimeZone_Country_State_City_Data()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCompany/GetAllBusinessType_TimeZone_Country_State_City_Data", content, HttpContext);
        }

        #endregion

        #region Branch Start

        [HttpPost]
        public Task<object> GetAllBranch()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBranch/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetBranchByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBranch/GetBranchByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddBranch([FromBody] Branch obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBranch/AddBranch", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateBranch([FromBody] Branch obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBranch/UpdateBranch", content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetAllCompany_Branch_Data()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBranch/GetAllCompany_Branch_Data", content, HttpContext);
        }

        #endregion

        #region Customer Start

        [HttpPost]
        public Task<object> GetAllCustomer()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCustomer/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetCustomerByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCustomer/GetCustomerByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddCustomer([FromBody] Customer obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCustomer/AddCustomer", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateCustomer([FromBody] Customer obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCustomer/UpdateCustomer", content, HttpContext);

        }

        #endregion

        #region User Start

        [HttpPost]
        public Task<object> GetAllUser()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageUser/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetUserByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageUser/GetUserByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddUser([FromBody] User obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageUser/AddUser", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateUser([FromBody] User obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageUser/UpdateUser", content, HttpContext);

        }

        #endregion

        #region Vendor Start

        [HttpPost]
        public Task<object> GetAllVendor()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageVendor/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetVendorByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageVendor/GetVendorByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddVendor([FromBody] Vendor obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageVendor/AddVendor", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateVendor([FromBody] Vendor obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageVendor/UpdateVendor", content, HttpContext);

        }

        #endregion

        #region WareHouse Start

        [HttpPost]
        public Task<object> GetAllWareHouse()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageWareHouse/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetWareHouseByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageWareHouse/GetWareHouseByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddWareHouse([FromBody] WareHouse obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageWareHouse/AddWareHouse", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateWareHouse([FromBody] WareHouse obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageWareHouse/UpdateWareHouse", content, HttpContext);

        }

        #endregion
    }
}

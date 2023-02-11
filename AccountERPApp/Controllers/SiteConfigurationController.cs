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
    public class SiteConfigurationController : Controller
    {
        public string ApiBaseURL = "";
        public SiteConfigurationController(IConfiguration configuration)
        {
            ApiBaseURL = configuration.GetSection("UrlSetting").GetSection("baseApiUrl").Value;
        }

        public IActionResult ManageCountry()
        {
            return View();
        }

        public IActionResult ManageState()
        {
            return View();
        }

        public IActionResult ManageCity()
        {
            return View();
        }

        public IActionResult ManageModule()
        {
            return View();
        }

        public IActionResult ManageModulePage()
        {
            return View();
        }

        public IActionResult ManageSiteConfig()
        {
            return View();
        }

        public IActionResult ManageBusinessType()
        {
            return View();
        }

        public IActionResult ManageRole()
        {
            return View();
        }

        public IActionResult ManageTimeZone()
        {
            return View();
        }

        #region Modules Start

        [HttpPost]
        public Task<object> GetAllModule()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddModule([FromBody] Modules obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/AddModule", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateModule([FromBody] Modules obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/UpdateModule", content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetModuleByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/GetModuleByID/"+id, content, HttpContext);

        }

        #endregion

        #region Module Pages Start
        [HttpPost]
        public Task<object> GetAllModulePages()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModulePages/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllModuleForDropDown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/GetAllModuleForDropDown", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddModulePge([FromBody] ModulePages obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModulePages/AddModulePge", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateModulePge([FromBody] ModulePages obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModulePages/UpdateModulePge", content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetModulePageByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModulePages/GetModulePageByID/" + id, content, HttpContext);

        }

        #endregion

        #region Country Start

        public Task<object> GetAllCountry()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCountry/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetCountryByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCountry/GetCountryByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateCountry([FromBody] Country obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCountry/UpdateCountry", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddCountry([FromBody] Country obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCountry/AddCountry", content, HttpContext);
        }

        #endregion

        #region State Start

        [HttpPost]
        public Task<object> GetAllState()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageState/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetStateByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageState/GetStateByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddState([FromBody] State obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageState/AddState", content, HttpContext);
        }

        [HttpPost]
        public Task<object> UpdateState([FromBody] State obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageState/UpdateState", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllCountryForDropDown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCountry/GetAllCountryForDropDown", content, HttpContext);
        }

        #endregion

        #region City Start

        [HttpPost]
        public Task<object> GetAllCity()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCity/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetCityByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCity/GetCityByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddCity([FromBody] City obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCity/AddCity", content, HttpContext);
        }

        [HttpPost]
        public Task<object> UpdateCity([FromBody] City obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageCity/UpdateCity", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllStateForDropDown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageState/GetAllStateForDropDown", content, HttpContext);
        }

        #endregion

        #region Business Type Start

        [HttpPost]
        public Task<object> GetAllBusinessType()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBusinessType/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetBusinessTypeByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBusinessType/GetBusinessTypeByID/" + id, content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddBusinessType([FromBody] BusinessType obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBusinessType/AddBusinessType", content, HttpContext);
        }

        [HttpPost]
        public Task<object> UpdateBusinessType([FromBody] BusinessType obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageBusinessType/UpdateBusinessType", content, HttpContext);
        }
        #endregion

        #region Role Start

        [HttpPost]
        public Task<object> GetAllRole()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageRole/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetRoleByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageRole/GetRoleByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddRole([FromBody] Role obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageRole/AddRole", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateRole([FromBody] Role obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageRole/UpdateRole", content, HttpContext);

        }

        #endregion

        #region TimeZone Start

        [HttpPost]
        public Task<object> GetAllTimeZone()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageTimeZones/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetTimeZoneByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageTimeZones/GetTimeZonesByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> AddTimeZone([FromBody] TimeZones obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageTimeZones/AddTimeZones", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateTimeZone([FromBody] TimeZones obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageTimeZones/UpdateTimeZones", content, HttpContext);

        }

        #endregion

        #region Site Config Start

        [HttpPost]
        public Task<object> GetAllSiteConfig()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageSiteConfig/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetSiteConfigByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageSiteConfig/GetSiteConfigByID/" + id, content, HttpContext);

        }

        #endregion
    }
}

﻿using AccountERPApp.htputlty;
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

        #endregion'
    }
}

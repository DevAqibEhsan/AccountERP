using AccountERPApp.htputlty;
using AccountERPClassLibraries;
using Microsoft.AspNetCore.Http;
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
    public class AccountController : Controller
    {
        public string ApiBaseURL = "";
        public AccountController(IConfiguration configuration)
        {
            ApiBaseURL = configuration.GetSection("UrlSetting").GetSection("baseApiUrl").Value;
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }


        [HttpPost]
        public Task<object> AuthenticateUser([FromBody] LoginCredentials obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            //return HttpUtility.CustomHttp(ApiBaseURL, "api/Authentication/Authenticate", content, HttpContext);
            return HttpUtility.CustomHttp(ApiBaseURL, "api/Authentication/Authenticate", content, HttpContext);

        }

        [HttpPost]
        public Task<object> RegisterUser([FromBody] RegisterUser obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            //return HttpUtility.CustomHttp(ApiBaseURL, "api/Authentication/Authenticate", content, HttpContext);
            return HttpUtility.CustomHttp(ApiBaseURL, "api/RegisterUser/RegisterUser", content, HttpContext);

        }

        [HttpPost]
        public Task<object> Logout()
        {
            string content = "";
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/Authentication/Logout", content, HttpContext);

        }

        [HttpPost]
        public Task<object> SiteConfigurationLoad()
        {
            string content = "";
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageSiteConfig/GetActiveSiteConfiguration", content, HttpContext);

        }
    }
}

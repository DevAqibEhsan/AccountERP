using AccountERPApp.htputlty;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
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




        [HttpPost]
        public Task<object> GetAllModule()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageModule/GetAll", content, HttpContext);
        }
    }
}

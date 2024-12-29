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
    public class AccountsManagementController : Controller
    {
        public string ApiBaseURL = "";

        public AccountsManagementController(IConfiguration configuration)
        {
            ApiBaseURL = configuration.GetSection("UrlSetting").GetSection("baseApiUrl").Value;
        }
        public IActionResult DefaultAccount()
        {
            return View();
        }

        public IActionResult BankAccount()
        {
            return View();
        }

        public IActionResult BankDeposit()
        {
            return View();
        }

        public IActionResult ChartAccount()
        {
            return View();
        }

        public IActionResult CreditNote()
        {
            return View();
        }

        public IActionResult DebitNote()
        {
            return View();
        }

        public IActionResult Expense()
        {
            return View();
        }

        public IActionResult FundsTransfer()
        {
            return View();
        }

        public IActionResult JournalEntry()
        {
            return View();
        }

        public IActionResult OtherCollections()
        {
            return View();
        }

        public IActionResult OtherPayments()
        {
            return View();
        }

        #region Default Account Start

        [HttpPost]
        public Task<object> GetAllDefaultAccount()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllActiveDefaultAccount()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/GetAllActive", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAccountForSubAccountDropdown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/GetAllActive", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddDefaultAccount([FromBody] DefaultAccount obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/AddDefaultAccount", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateDefaultAccount([FromBody] DefaultAccount obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/UpdateDefaultAccount", content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetDefaultAccountByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageDefaultAccount/GetDefaultAccountByID/" + id, content, HttpContext);

        }

        #endregion

        #region Chart Account Start 

        [HttpPost]
        public Task<object> GetAllChartAccount()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetAllActiveChartAccount()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/GetAllActive", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetChartAccountForSubAccountDropdown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/GetAllActive", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddChartAccount([FromBody] ChartAccount obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/AddChartAccount", content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateChartAccount([FromBody] ChartAccount obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/UpdateChartAccount", content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetChartAccountByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageChartAccount/GetChartAccountByID/" + id, content, HttpContext);

        }

        #endregion

        #region Journal Entry

        [HttpPost]
        public Task<object> GetAllJournalEntry()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageJournalEntry/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetJournalEntryByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageJournalEntry/GetJournalEntryByID/" + id, content, HttpContext);

        }


        #endregion
    }
}

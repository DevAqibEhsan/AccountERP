using AccountERPApp.htputlty;
using AccountERPClassLibraries;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class ProductConfigurationController : Controller
    {
        public string ApiBaseURL = "";
        public ProductConfigurationController(IConfiguration configuration)
        {
            ApiBaseURL = configuration.GetSection("UrlSetting").GetSection("baseApiUrl").Value;
        }
        public IActionResult ManageProduct()
        {
            return View();
        }
         
        public IActionResult ManageProductAttribute()
        {
            return View();
        }

        public IActionResult ManageProductBrand()
        {
            return View();
        }

        public IActionResult ManageProductCategory()
        {
            return View();
        }

        public IActionResult ManageProductType()
        {
            return View();
        }

        #region Product Attribute Start

        public Task<object> GetAllProductAttribute()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductAttribute/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetProductAttributeByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductAttribute/GetProductAttributeByID/" + id, content, HttpContext);
        }

        [HttpPost]
        public Task<object> UpdateProductAttribute([FromBody] ProductAttribute obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductAttribute/UpdateProductAttribute", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddProductAttribute([FromBody] ProductAttribute obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductAttribute/AddProductAttribute", content, HttpContext);
        }

        #endregion

        #region Product Brand Start

        public Task<object> GetAllProductBrand()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductBrand/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetProductBrandByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductBrand/GetProductBrandByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateProductBrand([FromBody] ProductBrand obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductBrand/UpdateProductBrand", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddProductBrand([FromBody] ProductBrand obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductBrand/AddProductBrand", content, HttpContext);
        }

        #endregion

        #region Product Category Start

        public Task<object> GetAllProductCategory()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductCategory/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetProductCategoryByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductCategory/GetProductCategoryByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateProductCategory([FromBody] ProductCategory obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductCategory/UpdateProductCategory", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddProductCategory([FromBody] ProductCategory obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductCategory/AddProductCategory", content, HttpContext);
        }

        #endregion

        #region Product Type Start

        public Task<object> GetAllProductType()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductType/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetProductTypeByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductType/GetProductTypeByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> UpdateProductType([FromBody] ProductType obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductType/UpdateProductType", content, HttpContext);
        }

        [HttpPost]
        public Task<object> AddProductType([FromBody] ProductType obj)
        {
            string content = JsonConvert.SerializeObject(obj);
            var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProductType/AddProductType", content, HttpContext);
        }

        #endregion

        #region Product Start

        public Task<object> GetAllProduct()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProduct/GetAll", content, HttpContext);
        }

        [HttpPost]
        public Task<object> GetProductByID(int id)
        {
            string content = "";
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProduct/GetProductByID/" + id, content, HttpContext);

        }

        [HttpPost]
        public Task<object> GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown()
        {
            string content = ""; //JsonConvert.SerializeObject(obj);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(content);
            //var byteContent = new ByteArrayContent(buffer);
            //string a=HttpContext.Session.GetString("authorization");
            return HttpUtility.CustomHttp(ApiBaseURL, "api/ManageProduct/GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown", content, HttpContext);
        }

        #endregion
    }
}

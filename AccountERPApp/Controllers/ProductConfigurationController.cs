using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class ProductConfigurationController : Controller
    {
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
    }
}

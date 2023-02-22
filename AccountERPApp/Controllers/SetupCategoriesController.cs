using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SetupCategoriesController : Controller
    {
        public IActionResult Customer()
        {
            return View();
        }

        public IActionResult Departments()
        {
            return View();
        }

        public IActionResult Designations()
        {
            return View();
        }

        public IActionResult OtherContact()
        {
            return View();
        }

        public IActionResult Vendor()
        {
            return View();
        }
    }
}

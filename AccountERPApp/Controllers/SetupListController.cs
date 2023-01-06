using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SetupListController : Controller
    {
        public IActionResult Customers()
        {
            return View();
        }

        public IActionResult Employees()
        {
            return View();
        }

        public IActionResult OtherContacts()
        {
            return View();
        }

        public IActionResult Products()
        {
            return View();
        }

        public IActionResult SalesPersons()
        {
            return View();
        }

        public IActionResult Users()
        {
            return View();
        }

        public IActionResult Vendors()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SystemManagementController : Controller
    {
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
    }
}

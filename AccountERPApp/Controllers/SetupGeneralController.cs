using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SetupGeneralController : Controller
    {
        public IActionResult AdjustmentTypes()
        {
            return View();
        }

        public IActionResult Consignments()
        {
            return View();
        }

        public IActionResult CustomFields()
        {
            return View();
        }

        public IActionResult MultiplePriceLevels()
        {
            return View();
        }

        public IActionResult Taxes()
        {
            return View();
        }

        public IActionResult Warehouses()
        {
            return View();
        }
    }
}

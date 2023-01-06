using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class ManufacturingController : Controller
    {
        public IActionResult Assembling()
        {
            return View();
        }

        public IActionResult Disassembling()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class POSController : Controller
    {
        public IActionResult Barcode()
        {
            return View();
        }

        public IActionResult CheckoutCounter()
        {
            return View();
        }

        public IActionResult DailySummary()
        {
            return View();
        }

        public IActionResult POS()
        {
            return View();
        }
    }
}

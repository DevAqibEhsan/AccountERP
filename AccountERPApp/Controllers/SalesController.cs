using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class SalesController : Controller
    {
        public IActionResult Delivery()
        {
            return View();
        }

        public IActionResult Invoice()
        {
            return View();
        }

        public IActionResult Order()
        {
            return View();
        }

        public IActionResult Quotation()
        {
            return View();
        }

        public IActionResult ReceiveMoney()
        {
            return View();
        }

        public IActionResult RecuringInvoice()
        {
            return View();
        }

        public IActionResult Refund()
        {
            return View();
        }

        public IActionResult Return()
        {
            return View();
        }

        public IActionResult Settlement()
        {
            return View();
        }
    }
}

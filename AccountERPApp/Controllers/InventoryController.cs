﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class InventoryController : Controller
    {
        public IActionResult ScheduledValuation()
        {
            return View();
        }

        public IActionResult StockAdjustment()
        {
            return View();
        }

        public IActionResult StockMovement()
        {
            return View();
        }
    }
}

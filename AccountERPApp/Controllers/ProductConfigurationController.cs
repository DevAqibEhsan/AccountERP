﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class ProductConfigurationController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
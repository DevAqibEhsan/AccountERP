using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApp.Controllers
{
    public class AccountsManagementController : Controller
    {
        public IActionResult BankAccount()
        {
            return View();
        }

        public IActionResult BankDeposit()
        {
            return View();
        }

        public IActionResult ChartAccount()
        {
            return View();
        }

        public IActionResult CreditNote()
        {
            return View();
        }

        public IActionResult DebitNote()
        {
            return View();
        }

        public IActionResult Expense()
        {
            return View();
        }

        public IActionResult FundsTransfer()
        {
            return View();
        }

        public IActionResult JournalEntry()
        {
            return View();
        }

        public IActionResult OtherCollections()
        {
            return View();
        }

        public IActionResult OtherPayments()
        {
            return View();
        }
    }
}

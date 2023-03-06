using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class RegisterUser
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CompanyName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string CreatedByIP { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}

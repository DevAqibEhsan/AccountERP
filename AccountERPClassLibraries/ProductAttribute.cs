﻿using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class ProductAttribute
    {
        public int ProductAttributeID { get; set; }
        public string ProductAttributeCode { get; set; }
        public string ProductAttributeName { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
    }
}

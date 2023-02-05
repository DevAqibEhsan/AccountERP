﻿using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
	public class ModulePages
	{
		public int ModulePageID { get; set; }
		public int ModuleID { get; set; }
		public string ModuleName { get; set; }
		public string ModulePageName { get; set; }
		public string ControllerURL { get; set; }
		public string ActionURL { get; set; }
		public string Icon { get; set; }
		public int CreatedBy { get; set; }
		public DateTime CreatedOn { get; set; }
		public string CreatedByIP { get; set; }
		public int ModifiedBy { get; set; }
		public DateTime ModifiedOn { get; set; }
		public string ModifiedByIP { get; set; }
		public int OrderN { get; set; }
		public int IsActive { get; set; }
		public string CreatedByUserName { get; set; }
		public string ModifiedByUserName { get; set; }
	}
}

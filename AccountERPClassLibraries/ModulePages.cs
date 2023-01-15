using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
	public class ModulePages
	{
		public int ModulePageID { get; set; }
		public int ModuleID { get; set; }
		public string ModulePageName { get; set; }
		public string ControllerURL { get; set; }
		public string ActionURL { get; set; }
		public int OrderN { get; set; }
	}
}

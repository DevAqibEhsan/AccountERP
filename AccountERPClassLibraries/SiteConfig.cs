using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class SiteConfig
    {
        public int ConfigurationID { get; set; }
        public string Logo { get; set; }
        public string DefaultLogo { get; set; }
        public string PoweredBy { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public int IsActive { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
        public string SiteThemeSetting { get; set; }
    }

    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    public class SiteThemeSetting
    {
        // Login Form CSS Variables
        public string btn_navlink_color { get; set; }
        public string btn_navlink_bg_color { get; set; }
        public string btn_navlink_active_color { get; set; }
        public string btn_navlink_active_bg_color { get; set; }
        public string btn_action_color { get; set; }
        public string btn_action_bg_color { get; set; }

        // Admin Grid CSS Variables
        public string table_header_bg_color { get; set; }
        public string table_header_text_color { get; set; }
        public string pagination_button_bg_color { get; set; }
        public string pagination_button_text_color { get; set; }
        public string pagination_button_bg_color_hover { get; set; }
        public string pagination_button_text_color_hover { get; set; }
        public string pagination_button_next_bg_color_hover { get; set; }
        public string no_of_entries_text_color { get; set; }
        public string page_heading_color { get; set; }
        public string btn_success_color { get; set; }
        public string btn_success_border_color { get; set; }
        public string btn_success_bg_color { get; set; }
        public string btn_success_color_hover { get; set; }
        public string btn_success_border_color_hover { get; set; }
        public string btn_success_bg_color_hover { get; set; }
        public string btn_success_disable_color { get; set; }
        public string btn_success_disable_bg_color { get; set; }
        public string btn_success_disable_border_color { get; set; }
        public string btn_primary_color { get; set; }
        public string btn_primary_border_color { get; set; }
        public string btn_primary_bg_color { get; set; }
        public string btn_primary_color_hover { get; set; }
        public string btn_primary_border_color_hover { get; set; }
        public string btn_primary_bg_color_hover { get; set; }
        public string btn_primary_disable_color { get; set; }
        public string btn_primary_disable_bg_color { get; set; }
        public string btn_primary_disable_border_color { get; set; }
        public string btn_secondary_color { get; set; }
        public string btn_secondary_border_color { get; set; }
        public string btn_secondary_bg_color { get; set; }
        public string btn_secondary_color_hover { get; set; }
        public string btn_secondary_border_color_hover { get; set; }
        public string btn_secondary_bg_color_hover { get; set; }
        public string btn_secondary_disable_color { get; set; }
        public string btn_secondary_disable_bg_color { get; set; }
        public string btn_secondary_disable_border_color { get; set; }
    }


}

using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
   public class TokenReplacement
    {
        public static string StringTokenReplacement(string strText)
        {
            if (strText.Contains("[PoweredByYear]"))
            {
                strText = strText.Replace("[PoweredByYear]",DateTime.Now.Year.ToString());
            }
            return strText;
        }
    }
}

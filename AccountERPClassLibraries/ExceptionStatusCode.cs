using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace AccountERPClassLibraries
{
    public class ExceptionStatusCode
    {
        public static int GetExceptionCode(Exception ex)
        {
            int code = 0;
            var w32ex = ex as Win32Exception;
            if (w32ex == null)
            {
                w32ex = ex.InnerException as Win32Exception;
            }
            if (w32ex != null)
            {
                code = w32ex.ErrorCode;
                // do stuff
            }

            return code;
        }
    }
}

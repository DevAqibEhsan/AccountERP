using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Utility
{
    public class TimeZoneManager
    {
        public static DateTime GetDateTimeByTimeZone(string strTimeZone)
        {
            TimeZoneInfo UserTimeZone = TimeZoneInfo.FindSystemTimeZoneById(strTimeZone);
            DateTime TimeZone_DateTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, UserTimeZone);

            return DateTimeFortmat(TimeZone_DateTime);
        }

        public static DateTime DateTimeFortmat(DateTime strDateTime)
        {
            return Convert.ToDateTime(strDateTime.ToString("yyyy-MM-dd HH:mm:ss"));
        }
    }
}

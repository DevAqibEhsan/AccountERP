using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Utility
{
    public class DeleteFileFromURL
    {
        public static void DeleteFile(string FileNameWithPath)
        {
            if (!string.IsNullOrEmpty(FileNameWithPath))
            {
                FileInfo file = new FileInfo(FileNameWithPath);
                if (file.Exists)//check file exsit or not  
                {
                    file.Delete();
                }
            }
        }

        public static void DeletePreviousFile(string MediaURL, string ImageName)
        {
            string FilePath = Path.Combine(MediaURL, ImageName);

            DeleteFile(FilePath);
        }
    }
}

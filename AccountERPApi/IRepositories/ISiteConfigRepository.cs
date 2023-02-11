using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IRepositories
{
   public interface ISiteConfigRepository
    {
        public List<SiteConfig> GetAll();

        public List<SiteConfig> GetAllActive();

        SiteConfig AddSiteConfig(SiteConfig obj);

        SiteConfig UpdateSiteConfig(SiteConfig obj);

        SiteConfig GetSiteConfigByID(int id);
    }
}

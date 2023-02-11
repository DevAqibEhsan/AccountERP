using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class SiteConfigService : ISiteConfigService
    {
        private readonly ISiteConfigRepository _repository;

        public SiteConfigService(ISiteConfigRepository repository)
        {
            _repository = repository;
        }
        public SiteConfig AddSiteConfig(SiteConfig obj)
        {
            return _repository.AddSiteConfig(obj);
        }

        public List<SiteConfig> GetAll()
        {
            return _repository.GetAll();
        }

        public List<SiteConfig> GetAllActive()
        {
            return _repository.GetAllActive();
        }

        public SiteConfig GetSiteConfigByID(int id)
        {
            return _repository.GetSiteConfigByID(id);
        }

        public SiteConfig UpdateSiteConfig(SiteConfig obj)
        {
            return _repository.UpdateSiteConfig(obj);
        }
    }
}

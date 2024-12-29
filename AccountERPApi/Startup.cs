using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPApi.Repositories;
using AccountERPApi.Services;
using AccountERPClassLibraries;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IDapper, Dapperr>();

            //Repositories
            services.AddTransient<IAuthenticationRepository, AuthenticationRepository>();
            services.AddTransient<IModulesRepository, ModulesRepository>();
            services.AddTransient<IModulePagesRepository, ModulePagesRepository>();
            services.AddTransient<ICountryRepository, CountryRepository>();
            services.AddTransient<IStateRepository, StateRepository>();
            services.AddTransient<ICityRepository, CityRepository>();
            services.AddTransient<IBusinessTypeRepository, BusinessTypeRepository>();
            services.AddTransient<ISiteConfigRepository, SiteConfigRepository>();
            services.AddTransient<IRoleRepository, RoleRepository>();
            services.AddTransient<ITimeZonesRepository, TimeZonesRepository>();
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<IProductAttributeRepository, ProductAttributeRepository>();
            services.AddTransient<IProductBrandRepository, ProductBrandRepository>();
            services.AddTransient<IProductCategoryRepository, ProductCategoryRepository>();
            services.AddTransient<IProductTypeRepository, ProductTypeRepository>();
            services.AddTransient<IAssignedPermissionRepository, AssignedPermissionRepository>();
            services.AddTransient<IBranchRepository, BranchRepository>();
            services.AddTransient<ICompanyRepository, CompanyRepository>();
            services.AddTransient<ICustomerRepository, CustomerRepository>();
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IVendorRepository, VendorRepository>();
            services.AddTransient<IWareHouseRepository, WareHouseRepository>();
            services.AddTransient<IRegisterUserRepository, RegisterUserRepository>();
            services.AddTransient<IChartAccountRepository, ChartAccountRepository>();
            services.AddTransient<ICodePrefixRepository, CodePrefixRepository>();
            services.AddTransient<IDefaultAccountRepository, DefaultAccountRepository>();
            services.AddTransient<IJournalEntryRepository, JournalEntryRepository>();


            //Services
            services.AddTransient<IAuthenticationService, AuthenticationService>();
            services.AddTransient<IModulesService, ModulesService>();
            services.AddTransient<IModulePagesService, ModulePagesService>();
            services.AddTransient<ICountryService, CountryService>();
            services.AddTransient<IStateService, StateService>();
            services.AddTransient<ICityService, CityService>();
            services.AddTransient<IBusinessTypeService, BusinessTypeService>();
            services.AddTransient<ISiteConfigService, SiteConfigService>();
            services.AddTransient<IRoleService, RoleService>();
            services.AddTransient<ITimeZonesService, TimeZonesService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IProductAttributeService, ProductAttributeService>();
            services.AddTransient<IProductBrandService, ProductBrandService>();
            services.AddTransient<IProductCategoryService, ProductCategoryService>();
            services.AddTransient<IProductTypeService, ProductTypeService>();
            services.AddTransient<IAssignedPermissionService, AssignedPermissionService>();
            services.AddTransient<IBranchService, BranchService>();
            services.AddTransient<ICompanyService, CompanyService>();
            services.AddTransient<ICustomerService, CustomerService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IVendorService, VendorService>();
            services.AddTransient<IWareHouseService, WareHouseService>();
            services.AddTransient<IRegisterUserService, RegisterUserService>();
            services.AddTransient<IChartAccountService, ChartAccountService>();
            services.AddTransient<ICodePrefixService, CodePrefixService>();
            services.AddTransient<IDefaultAccountService, DefaultAccountService>();
            services.AddTransient<IJournalEntryService, JournalEntryService>();

            services.AddCors(o => o.AddPolicy("MyCorePloicy", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()));
            services.AddControllers().AddJsonOptions(opts => opts.JsonSerializerOptions.PropertyNamingPolicy = null);
            //services.AddControllers();
            services.AddSignalR();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseCors("MyCorePloicy");
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapHub<SignalrServer>("/signalrServer");
            });
        }
    }
}

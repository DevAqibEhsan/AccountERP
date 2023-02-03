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

            //Services
            services.AddTransient<IAuthenticationService, AuthenticationService>();
            services.AddTransient<IModulesService, ModulesService>();
            services.AddTransient<IModulePagesService, ModulePagesService>();

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

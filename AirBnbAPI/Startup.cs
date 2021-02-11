using System;
using AirBnb.Business;
using AirBnb.Business.Interfaces;
using AirBnb.Repository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace AirBnbAPI
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
            services.AddControllers();
            services.AddScoped<DatabaseProvider>();
            services.AddScoped<IAirBnbUserManager, AirBnbUserManager>();
            services.AddScoped<IAirBnbUserRepository, AirBnbUserRepository>();
            services.AddScoped<IPersonManager, PersonManager>();
            services.AddScoped<IPersonRepository, PersonRepository>();
            services.AddScoped<IAccountManager, AccountManager>();
            services.AddScoped<IAccountRepository, AccountRepository>();
            services.AddScoped<ILocationManager, LocationManager>();
            services.AddScoped<ILocationRepository, LocationRepository>();
            services.AddScoped<IRentalManager, RentalManager>();
            services.AddScoped<IRentalRepository, RentalRepository>();
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

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

        }
    }
}

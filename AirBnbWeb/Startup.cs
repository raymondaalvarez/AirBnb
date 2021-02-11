using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AirBnb.Business;
using AirBnb.Business.Interfaces;
using AirBnb.Repository;
using AirBnb.Repository.Interfaces.IRepositories;
using AirBnb.Repository.Repositories;
using AirBnbAPI;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace AirBnb
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
            services.AddControllersWithViews();
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
            services.AddScoped<IReservationRequestRepository, ReservationRequestRepository>();
            services.AddAuthentication("CookieAuth")
                .AddCookie("CookieAuth", config =>
                {
                    config.Cookie.Name = "Grandmas.Cookie";
                    config.LoginPath = "/home/index";
                });
    //        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    //.AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options => Configuration.Bind("JwtSettings", options))
    //.AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, options => Configuration.Bind("CookieSettings", options));

    }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}

using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using tasks.data.Data;
using tasks.shared.Models;

namespace tasks.service.DI
{
    public static partial class DI
    {
        public static IServiceCollection AddIdentityServices(this IServiceCollection services)
        {
            services
                .AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<AppDataContext>()
                .AddDefaultTokenProviders();
            return services;
        }
    }
}

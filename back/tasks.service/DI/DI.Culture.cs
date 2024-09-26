using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System.Globalization;

namespace tasks.service.DI
{
    public static partial class DI
    {
        public static IServiceCollection ChangeCulture(this IServiceCollection services)
        {
            services.Configure<RequestLocalizationOptions>(options =>
            {
                options.SupportedCultures = new List<CultureInfo> { new CultureInfo("en-US") };
                options.SupportedUICultures = new List<CultureInfo> { new CultureInfo("en-US") };
            });
            return services;
        }
    }
}

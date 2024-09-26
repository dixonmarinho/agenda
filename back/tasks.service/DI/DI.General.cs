using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace tasks.service.DI
{
    public partial class DI
    {
        public static IServiceCollection AddGeneralServices(this IServiceCollection services)
        {
            // Registra o IConfiguration
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange:
             true)
                .Build();
            services.AddSingleton<IConfiguration>(configuration);
            return services;
        }

    }
}

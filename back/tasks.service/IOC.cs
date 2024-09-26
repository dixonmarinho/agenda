using Microsoft.Extensions.DependencyInjection;
using tasks.service.DI;

namespace tasks.service
{
    // Inversion Of Control - Inversao de Controle
    public static partial class IOC
    {
        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services
                .ChangeCulture()
                .AddGeneralServices()
                .AddAuthorization()
                .AddSwaggerService()
                .AddLogService()
                .AddAutoMapService()
                .DataService()
                .AddIdentityServices()
                // Ativando o MVC
                .AddControllers()

                ;

            return services;
        }
    }
}

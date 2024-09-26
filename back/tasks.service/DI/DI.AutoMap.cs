using Microsoft.Extensions.DependencyInjection;
using tasks.service.Helpers;

namespace tasks.service.DI
{
    public static partial class DI
    {
        public static IServiceCollection AddAutoMapService(this IServiceCollection services)
        {
            services
                .AddAutoMapper(typeof(MappingProfile));
            return services;
        }

    }
}

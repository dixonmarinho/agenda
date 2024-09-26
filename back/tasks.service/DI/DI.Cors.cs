using Microsoft.Extensions.DependencyInjection;

namespace tasks.service.DI
{
    public static partial class DI
    {
        public static IServiceCollection AddCustomCors(this IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy("All",
                                        builder =>
                                        {
                                            builder
                                                .SetIsOriginAllowed((host) => new Uri(host).Host == "localhost")
                                                .AllowAnyOrigin()
                                                .AllowAnyMethod()
                                                .AllowAnyHeader();
                                        });
            });
            return services;

        }

    }
}

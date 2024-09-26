using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using tasks.data.Data;
using tasks.service.Services;
using tasks.shared.Interfaces;
using tasks.shared.Models;

namespace tasks.service.DI
{
    public static partial class DI
    {
        public static IServiceCollection DataService(this IServiceCollection services)
        {
            var serviceProvider = services.BuildServiceProvider();
            var config = serviceProvider.GetService<IConfiguration>();
            var connectionstring = config.GetConnectionString("Default");

            services
                .AddDbContext<AppDataContext>(opt =>
                {
                    opt.UseSqlServer(connectionstring, x => x.MigrationsAssembly("tasks.data"));
                })
                .AddScoped<IUnitOfWork<AppDataContext>, UnitOfWork<AppDataContext>>()
                .AddScoped<IServiceBase<TaskModel, TaskModelDTO>, ServiceTask>()
                ;
            return services;
        }
    }
}

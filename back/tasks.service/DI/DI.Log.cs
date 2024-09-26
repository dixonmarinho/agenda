using Microsoft.Extensions.DependencyInjection;
using Serilog;
using tasks.service.Services;
using tasks.shared.Interfaces;

namespace tasks.service.DI
{
    public static partial class DI
    {
        private static string GetLevelName(Serilog.Events.LogEventLevel level)
        {
            switch (level)
            {
                case Serilog.Events.LogEventLevel.Debug:
                    return "Debug";
                case Serilog.Events.LogEventLevel.Error:
                    return "Error";
                case Serilog.Events.LogEventLevel.Fatal:
                    return "Fatal";
                case Serilog.Events.LogEventLevel.Information:
                    return "Information";
                case Serilog.Events.LogEventLevel.Verbose:
                    return "Verbose";
                case Serilog.Events.LogEventLevel.Warning:
                    return "Warning";
                default:
                    return "Unknown";
            }
        }

        public static IServiceCollection AddLogService(this IServiceCollection services)
        {
            // Configura o Logger - E faz um Nivelamento conforme o tipo
            var location = System.Reflection.Assembly.GetExecutingAssembly().Location;
            var dir = Path.GetDirectoryName(location);
            Directory.SetCurrentDirectory(dir!);
            Log.Logger = new LoggerConfiguration()
                    .MinimumLevel.Debug()
                    .WriteTo.Console()
                    .WriteTo.Map(
                        evt => evt.Level,
                        (level, wt) =>
                        {
                            var levelName = GetLevelName(level);
                            wt.File($"{levelName} .txt", rollingInterval: RollingInterval.Day, restrictedToMinimumLevel: level);
                        }
                    )
                    .CreateLogger()
                    ;
            // Cria o Servico
            services.AddSingleton<IServiceLog, ServiceLog>();
            return services;
        }
    }

}

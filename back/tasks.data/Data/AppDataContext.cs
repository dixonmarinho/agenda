using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using tasks.shared.Models;

namespace tasks.data.Data
{
    public partial class AppDataContext : IdentityDbContext<ApplicationUser>
    {
        private readonly IConfiguration config;

        public DbSet<TaskModel> Tasks { get; set; }

        public AppDataContext(IConfiguration config)
        {
            this.config = config;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionstring = config.GetConnectionString("Default");
            optionsBuilder.UseSqlServer(connectionstring);
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            const string PREFIX = "auth_";
            base.OnModelCreating(builder);

            builder.Entity<ApplicationUser>().ToTable($"{PREFIX}users");
            builder.Entity<IdentityRole>().ToTable($"{PREFIX}roles");
            builder.Entity<IdentityUserRole<string>>().ToTable($"{PREFIX}user_roles");
            builder.Entity<IdentityUserClaim<string>>().ToTable($"{PREFIX}user_claims");
            builder.Entity<IdentityUserLogin<string>>().ToTable($"{PREFIX}user_logins");
            builder.Entity<IdentityUserToken<string>>().ToTable($"{PREFIX}user_tokens");
            builder.Entity<IdentityRoleClaim<string>>().ToTable($"{PREFIX}role_claims");
        }
    }
}

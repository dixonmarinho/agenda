USE [master]
GO
/****** Object:  Database [tasks]    Script Date: 30/09/2024 14:37:32 ******/
CREATE DATABASE [tasks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tasks', FILENAME = N'/var/opt/mssql/data/tasks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tasks_log', FILENAME = N'/var/opt/mssql/data/tasks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tasks] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tasks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tasks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tasks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tasks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tasks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tasks] SET ARITHABORT OFF 
GO
ALTER DATABASE [tasks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tasks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tasks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tasks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tasks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tasks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tasks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tasks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tasks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tasks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tasks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tasks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tasks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tasks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tasks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tasks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tasks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tasks] SET RECOVERY FULL 
GO
ALTER DATABASE [tasks] SET  MULTI_USER 
GO
ALTER DATABASE [tasks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tasks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tasks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tasks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tasks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tasks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tasks', N'ON'
GO
ALTER DATABASE [tasks] SET QUERY_STORE = ON
GO
ALTER DATABASE [tasks] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tasks]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_role_claims]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_role_claims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_auth_role_claims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_roles]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_auth_roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_claims]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_claims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_auth_user_claims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_logins]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_logins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_auth_user_logins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_roles]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_roles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_auth_user_roles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_tokens]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_tokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_auth_user_tokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_users]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_auth_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 30/09/2024 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[Data] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_auth_role_claims_RoleId]    Script Date: 30/09/2024 14:37:33 ******/
CREATE NONCLUSTERED INDEX [IX_auth_role_claims_RoleId] ON [dbo].[auth_role_claims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 30/09/2024 14:37:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[auth_roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_auth_user_claims_UserId]    Script Date: 30/09/2024 14:37:33 ******/
CREATE NONCLUSTERED INDEX [IX_auth_user_claims_UserId] ON [dbo].[auth_user_claims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_auth_user_logins_UserId]    Script Date: 30/09/2024 14:37:33 ******/
CREATE NONCLUSTERED INDEX [IX_auth_user_logins_UserId] ON [dbo].[auth_user_logins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_auth_user_roles_RoleId]    Script Date: 30/09/2024 14:37:33 ******/
CREATE NONCLUSTERED INDEX [IX_auth_user_roles_RoleId] ON [dbo].[auth_user_roles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 30/09/2024 14:37:33 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[auth_users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 30/09/2024 14:37:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[auth_users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_role_claims]  WITH CHECK ADD  CONSTRAINT [FK_auth_role_claims_auth_roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[auth_roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_role_claims] CHECK CONSTRAINT [FK_auth_role_claims_auth_roles_RoleId]
GO
ALTER TABLE [dbo].[auth_user_claims]  WITH CHECK ADD  CONSTRAINT [FK_auth_user_claims_auth_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[auth_users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_user_claims] CHECK CONSTRAINT [FK_auth_user_claims_auth_users_UserId]
GO
ALTER TABLE [dbo].[auth_user_logins]  WITH CHECK ADD  CONSTRAINT [FK_auth_user_logins_auth_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[auth_users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_user_logins] CHECK CONSTRAINT [FK_auth_user_logins_auth_users_UserId]
GO
ALTER TABLE [dbo].[auth_user_roles]  WITH CHECK ADD  CONSTRAINT [FK_auth_user_roles_auth_roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[auth_roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_user_roles] CHECK CONSTRAINT [FK_auth_user_roles_auth_roles_RoleId]
GO
ALTER TABLE [dbo].[auth_user_roles]  WITH CHECK ADD  CONSTRAINT [FK_auth_user_roles_auth_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[auth_users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_user_roles] CHECK CONSTRAINT [FK_auth_user_roles_auth_users_UserId]
GO
ALTER TABLE [dbo].[auth_user_tokens]  WITH CHECK ADD  CONSTRAINT [FK_auth_user_tokens_auth_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[auth_users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[auth_user_tokens] CHECK CONSTRAINT [FK_auth_user_tokens_auth_users_UserId]
GO
USE [master]
GO
ALTER DATABASE [tasks] SET  READ_WRITE 
GO

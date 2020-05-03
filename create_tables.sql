USE [master]
GO
/****** Object:  Database [ddz_sql]    Script Date: 03-May-20 13:33:03 ******/
CREATE DATABASE [ddz_sql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ddz_sql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ddz_sql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ddz_sql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ddz_sql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ddz_sql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ddz_sql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ddz_sql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ddz_sql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ddz_sql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ddz_sql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ddz_sql] SET ARITHABORT OFF 
GO
ALTER DATABASE [ddz_sql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ddz_sql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ddz_sql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ddz_sql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ddz_sql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ddz_sql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ddz_sql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ddz_sql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ddz_sql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ddz_sql] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ddz_sql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ddz_sql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ddz_sql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ddz_sql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ddz_sql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ddz_sql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ddz_sql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ddz_sql] SET RECOVERY FULL 
GO
ALTER DATABASE [ddz_sql] SET  MULTI_USER 
GO
ALTER DATABASE [ddz_sql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ddz_sql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ddz_sql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ddz_sql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ddz_sql] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ddz_sql', N'ON'
GO
ALTER DATABASE [ddz_sql] SET QUERY_STORE = OFF
GO
USE [ddz_sql]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 03-May-20 13:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engine]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engine](
	[Id] [bigint] NOT NULL,
	[PistonOperated] [bit] NOT NULL,
 CONSTRAINT [PK_Engine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnginesPistons]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnginesPistons](
	[EngineId] [bigint] NOT NULL,
	[PistonId] [bigint] NOT NULL,
 CONSTRAINT [PK_EnginesPistons] PRIMARY KEY CLUSTERED 
(
	[EngineId] ASC,
	[PistonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[Id] [bigint] NOT NULL,
	[NumberOfWidgets] [tinyint] NOT NULL,
 CONSTRAINT [PK_Machine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachinesWidgets]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachinesWidgets](
	[MachineId] [bigint] NOT NULL,
	[WidgetsId] [bigint] NOT NULL,
 CONSTRAINT [PK_MachinesWidgets] PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC,
	[WidgetsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piston]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piston](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Piston] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Widget]    Script Date: 03-May-20 13:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Widget](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Widget] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_EnginesPistons]    Script Date: 03-May-20 13:33:04 ******/
CREATE NONCLUSTERED INDEX [IX_EnginesPistons] ON [dbo].[EnginesPistons]
(
	[EngineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Engine]  WITH CHECK ADD  CONSTRAINT [FK_Engine_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Engine] CHECK CONSTRAINT [FK_Engine_Product]
GO
ALTER TABLE [dbo].[EnginesPistons]  WITH CHECK ADD  CONSTRAINT [FK_EnginesPistons_Engine] FOREIGN KEY([EngineId])
REFERENCES [dbo].[Engine] ([Id])
GO
ALTER TABLE [dbo].[EnginesPistons] CHECK CONSTRAINT [FK_EnginesPistons_Engine]
GO
ALTER TABLE [dbo].[EnginesPistons]  WITH CHECK ADD  CONSTRAINT [FK_EnginesPistons_Piston] FOREIGN KEY([PistonId])
REFERENCES [dbo].[Piston] ([Id])
GO
ALTER TABLE [dbo].[EnginesPistons] CHECK CONSTRAINT [FK_EnginesPistons_Piston]
GO
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_Product] FOREIGN KEY([Id])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_Machine_Product]
GO
ALTER TABLE [dbo].[MachinesWidgets]  WITH CHECK ADD  CONSTRAINT [FK_MachinesWidgets_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([Id])
GO
ALTER TABLE [dbo].[MachinesWidgets] CHECK CONSTRAINT [FK_MachinesWidgets_Machine]
GO
ALTER TABLE [dbo].[MachinesWidgets]  WITH CHECK ADD  CONSTRAINT [FK_MachinesWidgets_Widget] FOREIGN KEY([WidgetsId])
REFERENCES [dbo].[Widget] ([Id])
GO
ALTER TABLE [dbo].[MachinesWidgets] CHECK CONSTRAINT [FK_MachinesWidgets_Widget]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
USE [master]
GO
ALTER DATABASE [ddz_sql] SET  READ_WRITE 
GO

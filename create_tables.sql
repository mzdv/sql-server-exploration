USE [master]
GO
/****** Object:  Database [ddz_sql]    Script Date: 03-May-20 20:31:55 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[CRM]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CRM]
AS
SELECT        dbo.Customer.Name, dbo.Customer.Address, dbo.Product.Name AS [Product name], dbo.Company.Name AS Company
FROM            dbo.Company INNER JOIN
                         dbo.Customer ON dbo.Company.Id = dbo.Customer.CompanyId INNER JOIN
                         dbo.Product ON dbo.Company.Id = dbo.Product.CompanyId
GO
/****** Object:  Table [dbo].[Widget]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Widget](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Widget] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engine]    Script Date: 03-May-20 20:31:55 ******/
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
/****** Object:  Table [dbo].[EnginesPistons]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnginesPistons](
	[EngineId] [bigint] NOT NULL,
	[PistonId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 03-May-20 20:31:55 ******/
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
/****** Object:  Table [dbo].[MachinesWidgets]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachinesWidgets](
	[MachineId] [bigint] NOT NULL,
	[WidgetsId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piston]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piston](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Piston] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MachinesWidgets] CHECK CONSTRAINT [FK_MachinesWidgets_Widget]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
/****** Object:  Trigger [dbo].[DeleteWidgetReferences]    Script Date: 03-May-20 20:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Milos Zivadinovic
-- Create date: 03.05.2020
-- Description:	When the Widget gets deleted,
--				remove its reference in the
--				joined table and decrement
--				the number on Machine if exists
-- =============================================
CREATE   TRIGGER [dbo].[DeleteWidgetReferences]
ON  [dbo].[Widget] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
		UPDATE Machine 
		SET NumberOfWidgets = NumberOfWidgets - 1 
		FROM
		Machine m
		INNER JOIN MachinesWidgets mw 
		ON m.Id = mw.MachineId
		WHERE Id = (SELECT deleted.Id FROM deleted);
	COMMIT;
END
GO
ALTER TABLE [dbo].[Widget] ENABLE TRIGGER [DeleteWidgetReferences]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Company"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 162
               Left = 399
               Bottom = 292
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 9
               Left = 422
               Bottom = 139
               Right = 592
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2430
         Table = 1170
         Output = 1695
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CRM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CRM'
GO
USE [master]
GO
ALTER DATABASE [ddz_sql] SET  READ_WRITE 
GO

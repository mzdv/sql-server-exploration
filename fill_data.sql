USE [ddz_sql]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (0, N'Big Corp')
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'Local Store')
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'Lidl')
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Maxi')
GO
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Ikea')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CompanyId]) VALUES (1, N'Pera Peric', N'Bulevar Oslobodjenja 30', 0)
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CompanyId]) VALUES (2, N'Jova Jovic', N'Kumodraska 17', 1)
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CompanyId]) VALUES (3, N'Marko Markovic', N'Generala Stefanika 20', 2)
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CompanyId]) VALUES (4, N'Ivana Ivanovic', N'Karadjordjeva 1', 3)
GO
INSERT [dbo].[Customer] ([Id], [Name], [Address], [CompanyId]) VALUES (5, N'Jovana Jankovic', N'Marijane Gregoran 100', 4)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [CompanyId]) VALUES (1, N'1.7 Diesel', N'Jak dizel motor', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [CompanyId]) VALUES (2, N'Brodski motor', N'Ide na benzin', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [CompanyId]) VALUES (3, N'Frtaljka', N'Okrece se', 2)
GO
INSERT [dbo].[Product] ([Id], [Name], [Description], [CompanyId]) VALUES (4, N'Cegrtaljka', N'Ide u suprotnom smeru', 3)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Piston] ON 
GO
INSERT [dbo].[Piston] ([Id], [Name]) VALUES (1, N'Big boi')
GO
SET IDENTITY_INSERT [dbo].[Piston] OFF
GO
INSERT [dbo].[Engine] ([Id], [PistonOperated]) VALUES (1, 1)
GO
INSERT [dbo].[Engine] ([Id], [PistonOperated]) VALUES (2, 0)
GO
INSERT [dbo].[EnginesPistons] ([EngineId], [PistonId]) VALUES (1, 1)
GO
INSERT [dbo].[Machine] ([Id], [NumberOfWidgets]) VALUES (3, 1)
GO
INSERT [dbo].[Machine] ([Id], [NumberOfWidgets]) VALUES (4, 2)
GO
SET IDENTITY_INSERT [dbo].[Widget] ON 
GO
INSERT [dbo].[Widget] ([Id], [Name]) VALUES (1, N'Small Widget')
GO
INSERT [dbo].[Widget] ([Id], [Name]) VALUES (2, N'Large Widget')
GO
SET IDENTITY_INSERT [dbo].[Widget] OFF
GO
INSERT [dbo].[MachinesWidgets] ([MachineId], [WidgetsId]) VALUES (3, 1)
GO
INSERT [dbo].[MachinesWidgets] ([MachineId], [WidgetsId]) VALUES (4, 2)
GO
INSERT [dbo].[MachinesWidgets] ([MachineId], [WidgetsId]) VALUES (4, 2)
GO

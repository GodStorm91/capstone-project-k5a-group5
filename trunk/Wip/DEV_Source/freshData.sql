USE [HDMS]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 04/29/2013 16:19:29 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'c3211ee8-239f-43d6-832a-5b31ae8ef791', NULL)
/****** Object:  Table [dbo].[TiktakStaff]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiktakStaff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[StaffRole] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceTag]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceTag](
	[PriceTagId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [int] NOT NULL,
	[PriceTagContent] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__PriceTag__31B8481D0CBAE877] PRIMARY KEY CLUSTERED 
(
	[PriceTagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PriceTag] ON
INSERT [dbo].[PriceTag] ([PriceTagId], [Price], [PriceTagContent]) VALUES (1, 34000, N'Giao hàng lần 1 (1 đến 5kg)')
INSERT [dbo].[PriceTag] ([PriceTagId], [Price], [PriceTagContent]) VALUES (2, 67000, N'Giao hàng lần 1 (5 đến 20 kg)')
INSERT [dbo].[PriceTag] ([PriceTagId], [Price], [PriceTagContent]) VALUES (3, 17000, N'Giao hàng lần 2 (1 đến 5kg) ')
INSERT [dbo].[PriceTag] ([PriceTagId], [Price], [PriceTagContent]) VALUES (4, 33500, N'Giao hàng lần 2 (5 đến 20kg)')
SET IDENTITY_INSERT [dbo].[PriceTag] OFF
/****** Object:  Table [dbo].[CityProvince]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityProvince](
	[CityProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityProvinceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CityProvince] ON
INSERT [dbo].[CityProvince] ([CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (1, N'Thành Phố Hồ Chí Minh', 1, NULL)
SET IDENTITY_INSERT [dbo].[CityProvince] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](1000) NOT NULL,
	[DisplayName] [nvarchar](1000) NOT NULL,
	[PhoneNumber] [nvarchar](255) NOT NULL,
	[CurrentContractCode] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Note] [ntext] NULL,
	[LogoURL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (1, N'Lazada Việt Nam', N'lazada.vn', N'0836265724', N'5yh7j2f', 1, N'asdasdasd', NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (2, N'Zalora Việt Nam', N'zalora.vn', N'08385137328', N'6uef23', 0, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (3, N'Tiki', N'tiki.vn', N'0838364448', N'43t43d', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (4, N'Công ty Nhóm Mua', N'nhommua.com', N'0838435732', N'6u238f', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (5, N'Website 123.vn', N'123.vn', N'0835682940', N'34t55g3', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (6, N'Website sendo.vn', N'sendo.vn', N'0838475564', N'4fn35k', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (7, N'Cửa hàng trái cây Bà Liễu', N'MrsLieuFruitStore', N'0862502451', N'HC200', 1, N'Delivery only in-day', NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (8, N'E fashion online', N'e-fashion.vn', N'0873456789', N'HJ2206', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (9, N'Phương Nam Book', N'phuongnambook.vn', N'(08) 3832 1849 - 3832 1848 - 3832 1846', N'HJ009', 1, NULL, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note], [LogoURL]) VALUES (10, N'BaoBao', N'Bao', N'0938669443', N'ar2r232', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[DeliveryMen]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMen](
	[DeliveryMenId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryMenId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryMen] ON
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (1, N'Khánh', N'Nguyễn', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (2, N'Vượng', N'Nguyễn', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (3, N'Thịnh', N'Nguyễn', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (4, N'Anh', N'An', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (5, N'Khanh', N'Trần', 2)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (6, N'Liên ', N'Lưu', 2)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (7, N'Tâm', N'Trần', 2)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (8, N'Hạnh ', N'Lê Thị', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (9, N'Quang', N'Võ Văn', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (10, N'Lan', N'Lê Hoàng', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (11, N'Đình', N'Vương', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (12, N'Linh', N'Đặng Diệu', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (13, N'An ', N'Lê Hồng', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (14, N'Châu', N'Phan Thị', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (15, N'Bình ', N'Võ Tấn', 1)
INSERT [dbo].[DeliveryMen] ([DeliveryMenId], [FirstName], [LastName], [Status]) VALUES (16, N'Danh', N'Phạm Đức', 1)
SET IDENTITY_INSERT [dbo].[DeliveryMen] OFF
/****** Object:  Table [dbo].[DeliveryType]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryType](
	[DeliveryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryType] ON
INSERT [dbo].[DeliveryType] ([DeliveryTypeId], [DeliveryName], [isActive]) VALUES (1, N'Direct Delivery', 1)
INSERT [dbo].[DeliveryType] ([DeliveryTypeId], [DeliveryName], [isActive]) VALUES (2, N'Buffer Delivery', 1)
SET IDENTITY_INSERT [dbo].[DeliveryType] OFF
/****** Object:  Table [dbo].[DeliveryOption]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryOption](
	[DeliveryOptionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryOptionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryOption] ON
INSERT [dbo].[DeliveryOption] ([DeliveryOptionId], [Name], [Description], [IsActive]) VALUES (1, N'Normal', N'1-3 ngày làm việc', 1)
INSERT [dbo].[DeliveryOption] ([DeliveryOptionId], [Name], [Description], [IsActive]) VALUES (2, N'Fast', N'Trong vòng 1 ngày làm việc', 1)
SET IDENTITY_INSERT [dbo].[DeliveryOption] OFF
/****** Object:  Table [dbo].[Plan]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedByUserId] [int] NOT NULL,
	[FinishedDate] [date] NULL,
	[Note] [varchar](100) NULL,
	[StaffId] [int] NULL,
	[PlanTypeId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[Status] [int] NULL,
	[Distance] [decimal](18, 2) NULL,
	[SegmentsLongitude] [nvarchar](max) NULL,
	[SegmentsLatitude] [nvarchar](max) NULL,
	[WaypointsLongitude] [nvarchar](max) NULL,
	[WaypointsLatitude] [nvarchar](max) NULL,
 CONSTRAINT [PK__Plan__755C22B701D345B0] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Plan] ON
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (6, NULL, 1, CAST(0x77360B00 AS Date), NULL, 1, 1, CAST(0x61360B00 AS Date), 4, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (9, CAST(0x0000A18000000000 AS DateTime), 1, CAST(0xF0360B00 AS Date), NULL, 2, 2, CAST(0x96360B00 AS Date), 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (10, CAST(0x0000A18400000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (12, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (14, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (17, CAST(0x0000A18700000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(100001.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (18, CAST(0x0000A18700000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 2, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (19, CAST(0x0000A18700000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (20, CAST(0x0000A18700000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 2, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (21, CAST(0x0000A18700000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (22, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 2, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (23, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (24, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(100001.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (25, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 2, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (26, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (27, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (28, CAST(0x0000A18800000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (29, CAST(0x0000A18900000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (30, CAST(0x0000A18900000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (31, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(11589.78 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (32, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(7301.86 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (33, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(7301.86 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (34, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(16922.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (35, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(11589.78 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (36, CAST(0x0000A18B00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(8083.67 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (40, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 2, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (41, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (43, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (44, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (45, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (46, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (47, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (48, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (49, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 3, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (50, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(9198.16 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (51, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (52, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (53, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (54, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(7695.71 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (55, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(8327.21 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (56, CAST(0x0000A18C00000000 AS DateTime), 1, NULL, NULL, NULL, 1, NULL, 1, CAST(8327.21 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (57, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(8083.67 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (58, CAST(0x0000A19400A01D8E AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(8753.44 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (59, CAST(0x0000A1910169635D AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(16922.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (60, CAST(0x0000A19400A0C674 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(8753.44 AS Decimal(18, 2)), N'106.682571411133,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.686073303223,106.686088562012,106.686416625977,106.686500549316,106.686645507813,106.686782836914,106.687225341797,106.687393188477,106.687576293945,106.687850952148,106.687957763672,106.688095092773,106.688606262207,106.688812255859,106.689437866211,106.689735412598,106.690292358398,106.69051361084,106.691627502441,106.691123962402,106.690605163574,106.690093994141,106.689895629883,106.689544677734,106.689163208008,106.689079284668,106.688369750977,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.690780639648,106.690040588379,106.689208984375,106.689010620117,106.688751220703,106.688949584961,106.688903808594,106.689262390137,106.689102172852,106.688980102539,106.689193725586,106.688354492188,106.688789367676,106.689323425293,106.689613342285,106.68936920166,106.689109802246,106.68871307373,106.688690185547,106.688789367676,106.688903808594,106.688949584961,106.689086914063,106.68920135498,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682250976563,106.682472229004,106.682571411133', N'10.7663593292236,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7700567245483,10.7700777053833,10.7704248428345,10.7705097198486,10.7706737518311,10.7708206176758,10.7712984085083,10.7714824676514,10.7716798782349,10.7719764709473,10.7720899581909,10.7722415924072,10.7727909088135,10.7730083465576,10.7736864089966,10.7740116119385,10.7745981216431,10.7748346328735,10.7760457992554,10.7765045166016,10.7769784927368,10.7774515151978,10.7776327133179,10.7779541015625,10.7783012390137,10.7783737182617,10.7790269851685,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7835836410522,10.7842798233032,10.7850294113159,10.7851934432983,10.7854194641113,10.7856349945068,10.7856798171997,10.7860918045044,10.7862243652344,10.7863473892212,10.7865982055664,10.7874031066895,10.788197517395,10.7893238067627,10.7898864746094,10.790057182312,10.7902698516846,10.7905960083008,10.7906150817871,10.7907457351685,10.7909097671509,10.7909069061279,10.7911024093628,10.7913827896118,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7664680480957,10.7662677764893,10.7663593292236', N'10.7663593292236,10.7915821075439,10.7686891555786', N'10.7663593292236,10.7915821075439,10.7686891555786')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (61, CAST(0x0000A196000BC8F8 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(9035.61 AS Decimal(18, 2)), N'106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682151794434,106.682258605957,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.685470581055,106.68579864502,106.686103820801,106.686386108398,106.686683654785,106.68701171875,106.687454223633,106.688301086426,106.688423156738,106.688522338867,106.688575744629,106.688941955566,106.689949035645,106.690208435059,106.690391540527,106.691055297852,106.691734313965,106.692344665527,106.692726135254,106.69295501709,106.694091796875,106.694175720215,106.695190429688,106.696670532227,106.697807312012,106.698043823242,106.69800567627,106.698051452637,106.698089599609,106.698112487793,106.698211669922,106.698364257813,106.698509216309,106.698638916016,106.698715209961,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.699035644531,106.700080871582,106.700164794922,106.701080322266,106.701965332031,106.702087402344,106.702186584473,106.70272064209,106.703315734863,106.703491210938,106.703491210938,106.703498840332,106.70352935791,106.703559875488,106.703605651855,106.703628540039,106.703674316406,106.703689575195,106.704345703125,106.70491027832,106.705467224121,106.706146240234,106.706176757813,106.706268310547,106.706253051758,106.706207275391,106.706207275391,106.706085205078,106.705993652344,106.704528808594,106.704246520996,106.70337677002,106.702415466309,106.701072692871,106.699226379395,106.698936462402,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.698707580566,106.698654174805,106.698608398438,106.698486328125,106.698318481445,106.698234558105,106.698181152344,106.698127746582,106.698043823242,106.697807312012,106.696670532227,106.695190429688,106.694175720215,106.694091796875,106.69295501709,106.692726135254,106.692344665527,106.691734313965,106.691055297852,106.690391540527,106.690208435059,106.689949035645,106.688941955566,106.688575744629,106.688522338867,106.688423156738,106.688301086426,106.687454223633,106.68701171875,106.686683654785,106.686386108398,106.686103820801,106.68579864502,106.685470581055,106.684547424316,106.684341430664,106.68431854248,106.683204650879,106.682647705078,106.682571411133,106.682472229004,106.682464599609,106.68229675293,106.681938171387,106.681762695313,106.681716918945,106.681625366211,106.681579589844,106.681533813477,106.681449890137,106.681419372559,106.681030273438,106.680458068848,106.680114746094,106.679794311523,106.67936706543,106.679321289063,106.678703308105,106.678268432617,106.67700958252,106.676361083984,106.676292419434,106.67601776123,106.675048828125,106.674743652344,106.67455291748,106.674545288086,106.674507141113,106.674430847168,106.674354553223,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786,10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133,106.674003601074,106.699104309082,106.699104309082,106.689224243164', N'10.7686891555786,10.77170753479,10.7663593292236,10.7686891555786,10.8186559677124,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (62, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(17527.55 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.694107055664,106.693336486816,106.692398071289,106.691955566406,106.690895080566,106.690742492676,106.690856933594,106.690689086914,106.69066619873,106.690788269043,106.690376281738,106.690361022949,106.690467834473,106.690582275391,106.69059753418,106.690650939941,106.690567016602,106.690551757813,106.690689086914,106.690818786621,106.690872192383,106.690460205078,106.690086364746,106.690147399902,106.689414978027,106.689498901367,106.689590454102,106.689674377441,106.689826965332,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786,10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133,106.674003601074,106.699104309082,106.699104309082,106.689224243164', N'10.7686891555786,10.77170753479,10.7663593292236,10.7686891555786,10.8186559677124,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (63, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(9035.61 AS Decimal(18, 2)), N'106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682151794434,106.682258605957,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.685470581055,106.68579864502,106.686103820801,106.686386108398,106.686683654785,106.68701171875,106.687454223633,106.688301086426,106.688423156738,106.688522338867,106.688575744629,106.688941955566,106.689949035645,106.690208435059,106.690391540527,106.691055297852,106.691734313965,106.692344665527,106.692726135254,106.69295501709,106.694091796875,106.694175720215,106.695190429688,106.696670532227,106.697807312012,106.698043823242,106.69800567627,106.698051452637,106.698089599609,106.698112487793,106.698211669922,106.698364257813,106.698509216309,106.698638916016,106.698715209961,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.699035644531,106.700080871582,106.700164794922,106.701080322266,106.701965332031,106.702087402344,106.702186584473,106.70272064209,106.703315734863,106.703491210938,106.703491210938,106.703498840332,106.70352935791,106.703559875488,106.703605651855,106.703628540039,106.703674316406,106.703689575195,106.704345703125,106.70491027832,106.705467224121,106.706146240234,106.706176757813,106.706268310547,106.706253051758,106.706207275391,106.706207275391,106.706085205078,106.705993652344,106.704528808594,106.704246520996,106.70337677002,106.702415466309,106.701072692871,106.699226379395,106.698936462402,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.698707580566,106.698654174805,106.698608398438,106.698486328125,106.698318481445,106.698234558105,106.698181152344,106.698127746582,106.698043823242,106.697807312012,106.696670532227,106.695190429688,106.694175720215,106.694091796875,106.69295501709,106.692726135254,106.692344665527,106.691734313965,106.691055297852,106.690391540527,106.690208435059,106.689949035645,106.688941955566,106.688575744629,106.688522338867,106.688423156738,106.688301086426,106.687454223633,106.68701171875,106.686683654785,106.686386108398,106.686103820801,106.68579864502,106.685470581055,106.684547424316,106.684341430664,106.68431854248,106.683204650879,106.682647705078,106.682571411133,106.682472229004,106.682464599609,106.68229675293,106.681938171387,106.681762695313,106.681716918945,106.681625366211,106.681579589844,106.681533813477,106.681449890137,106.681419372559,106.681030273438,106.680458068848,106.680114746094,106.679794311523,106.67936706543,106.679321289063,106.678703308105,106.678268432617,106.67700958252,106.676361083984,106.676292419434,106.67601776123,106.675048828125,106.674743652344,106.67455291748,106.674545288086,106.674507141113,106.674430847168,106.674354553223,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133', N'10.7686891555786,10.77170753479,10.7663593292236')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (64, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(17527.55 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.694107055664,106.693336486816,106.692398071289,106.691955566406,106.690895080566,106.690742492676,106.690856933594,106.690689086914,106.69066619873,106.690788269043,106.690376281738,106.690361022949,106.690467834473,106.690582275391,106.69059753418,106.690650939941,106.690567016602,106.690551757813,106.690689086914,106.690818786621,106.690872192383,106.690460205078,106.690086364746,106.690147399902,106.689414978027,106.689498901367,106.689590454102,106.689674377441,106.689826965332,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.699104309082,106.689224243164', N'10.7686891555786,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (65, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(16922.89 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.69603729248,106.696586608887,106.696464538574,106.696365356445,106.696189880371,106.696144104004,106.696075439453,106.69605255127,106.695960998535,106.695953369141,106.695838928223,106.69499206543,106.694709777832,106.694686889648,106.694526672363,106.694297790527,106.693840026855,106.693145751953,106.692977905273,106.692680358887,106.692413330078,106.692253112793,106.69197845459,106.691566467285,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8026933670044,10.80260181427,10.8006706237793,10.7990446090698,10.7960996627808,10.7956790924072,10.7945728302002,10.7942333221436,10.7928457260132,10.7926626205444,10.7918748855591,10.7910165786743,10.7907342910767,10.7907114028931,10.7905492782593,10.7903184890747,10.7898235321045,10.7891407012939,10.7889833450317,10.7886848449707,10.7884168624878,10.7882518768311,10.7878789901733,10.7874956130981,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.699104309082', N'10.7686891555786,10.8186559677124')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (66, CAST(0x0000A19E015A5E94 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(12190.76 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681663513184,106.681793212891,106.681930541992,106.682167053223,106.682548522949,106.68285369873,106.68359375,106.684448242188,106.684616088867,106.684677124023,106.68473815918,106.684730529785,106.684715270996,106.684631347656,106.684555053711,106.684562683105,106.684562683105,106.684600830078,106.684669494629,106.684730529785,106.684799194336,106.684898376465,106.68505859375,106.685180664063,106.685249328613,106.68537902832,106.685592651367,106.685707092285,106.685836791992,106.685981750488,106.686332702637,106.686767578125,106.687538146973,106.687950134277,106.688377380371,106.688438415527,106.688423156738,106.688461303711,106.688529968262,106.688606262207,106.688690185547,106.688781738281,106.688865661621,106.688888549805,106.688896179199,106.689224243164,106.689224243164,106.689224243164,106.689224243164,106.689224243164,106.689224243164,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689186096191,106.689971923828,106.690795898438,106.691093444824,106.691268920898,106.69164276123,106.69181060791,106.692405700684,106.692893981934,106.693328857422,106.69376373291,106.693954467773,106.694923400879,106.695892333984,106.69620513916,106.696434020996,106.696990966797,106.697288513184,106.697746276855,106.697944641113,106.698417663574,106.699028015137,106.699279785156,106.699363708496,106.699562072754,106.700035095215,106.700096130371,106.700164794922,106.700294494629,106.700775146484,106.701072692871,106.70108795166,106.701133728027,106.701217651367,106.701278686523,106.700988769531,106.700721740723,106.69994354248,106.698875427246,106.699005126953,106.69979095459,106.699821472168,106.700424194336,106.700996398926,106.701133728027,106.701316833496,106.70149230957,106.701416015625,106.701332092285,106.701156616211,106.700988769531,106.700698852539,106.700317382813,106.700141906738,106.700035095215,106.700042724609,106.700103759766,106.700386047363,106.70051574707,106.700561523438,106.700798034668,106.701019287109,106.701065063477,106.701110839844,106.701370239258,106.701034545898,106.700775146484,106.700752258301,106.700645446777,106.700614929199,106.700584411621,106.700523376465,106.700523376465,106.700523376465,106.700523376465,106.700523376465,106.700584411621,106.700614929199,106.70051574707,106.700454711914,106.700500488281,106.700370788574,106.700225830078,106.700134277344,106.700080871582,106.699928283691,106.700477600098,106.70043182373,106.700386047363,106.70036315918,106.700050354004,106.699859619141,106.699722290039,106.69953918457,106.699295043945,106.698623657227,106.698135375977,106.697853088379,106.697715759277,106.697540283203,106.69718170166,106.697135925293,106.69709777832,106.696823120117,106.696723937988,106.696502685547,106.696029663086,106.695945739746,106.695854187012,106.695518493652,106.695457458496,106.69539642334,106.694747924805,106.694625854492,106.694038391113,106.693786621094,106.693313598633,106.692741394043,106.692451477051,106.692077636719,106.691017150879,106.690521240234,106.690124511719,106.689666748047,106.689178466797,106.689056396484,106.68824005127,106.687873840332,106.687393188477,106.686683654785,106.686248779297,106.685470581055,106.684547424316,106.684341430664,106.68431854248,106.683204650879,106.682647705078,106.682472229004,106.682464599609,106.68229675293,106.681938171387,106.681762695313,106.681716918945,106.681625366211,106.681579589844,106.681533813477,106.681449890137,106.681419372559,106.681030273438,106.680458068848,106.680114746094,106.679794311523,106.67936706543,106.679321289063,106.678703308105,106.678268432617,106.67700958252,106.676361083984,106.676292419434,106.67601776123,106.675048828125,106.674743652344,106.67455291748,106.674545288086,106.674507141113,106.674430847168,106.674354553223,106.674003601074', N'10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7783422470093,10.778660774231,10.7789888381958,10.7794713973999,10.7803421020508,10.7809524536133,10.7825307846069,10.7844123840332,10.7849025726318,10.7851133346558,10.7852983474731,10.7854852676392,10.7856616973877,10.785906791687,10.7860975265503,10.7861604690552,10.7864389419556,10.7866315841675,10.7869453430176,10.7871799468994,10.7875099182129,10.7878217697144,10.7882585525513,10.7885360717773,10.7886428833008,10.7889852523804,10.7894420623779,10.7896289825439,10.7898015975952,10.7899341583252,10.7902908325195,10.7907629013062,10.7907018661499,10.7912244796753,10.7908744812012,10.7908201217651,10.7907991409302,10.7908563613892,10.7909517288208,10.7910451889038,10.7911558151245,10.7912969589233,10.7913446426392,10.7914333343506,10.791524887085,10.7915821075439,10.7915821075439,10.7915821075439,10.7915821075439,10.7915821075439,10.7915821075439,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849082946777,10.7842178344727,10.7834548950195,10.7831859588623,10.7830190658569,10.7826910018921,10.7825288772583,10.7819957733154,10.7815237045288,10.78111743927,10.7806825637817,10.7805156707764,10.7795915603638,10.7787103652954,10.7784233093262,10.7782144546509,10.7777051925659,10.7774381637573,10.7770175933838,10.7768325805664,10.776403427124,10.7758560180664,10.7753067016602,10.775128364563,10.7746925354004,10.7735147476196,10.7733783721924,10.773232460022,10.7729215621948,10.7717990875244,10.7711591720581,10.7711296081543,10.7710151672363,10.7708206176758,10.7706899642944,10.770432472229,10.7701873779297,10.7694435119629,10.7684354782104,10.768235206604,10.7672634124756,10.7670917510986,10.7663593292236,10.7656421661377,10.7654809951782,10.7652797698975,10.7651081085205,10.7650003433228,10.764928817749,10.7647981643677,10.764687538147,10.7644920349121,10.764232635498,10.7641258239746,10.7640428543091,10.7639427185059,10.7637233734131,10.7627534866333,10.7623062133789,10.7621574401855,10.7618618011475,10.7615699768066,10.7615098953247,10.7614450454712,10.7610759735107,10.7608251571655,10.7606153488159,10.7606477737427,10.7605667114258,10.7606086730957,10.7607183456421,10.760799407959,10.760799407959,10.760799407959,10.760799407959,10.760799407959,10.7607183456421,10.7606086730957,10.7605533599854,10.7604846954346,10.7604188919067,10.7603359222412,10.7602157592773,10.7603435516357,10.7604150772095,10.7606182098389,10.7610092163086,10.7610816955566,10.761155128479,10.7612218856812,10.7616806030273,10.7619533538818,10.7621412277222,10.7623586654663,10.7626047134399,10.7632570266724,10.7637338638306,10.764030456543,10.764214515686,10.764500617981,10.7651214599609,10.7652034759521,10.7652654647827,10.7657518386841,10.7658967971802,10.7662811279297,10.7670812606812,10.7672090530396,10.7673635482788,10.7679738998413,10.7680797576904,10.768180847168,10.769287109375,10.7692403793335,10.7690114974976,10.768913269043,10.7687253952026,10.7684955596924,10.7683811187744,10.7682313919067,10.7678117752075,10.7676124572754,10.7674560546875,10.7672748565674,10.7670793533325,10.7670307159424,10.7667074203491,10.7668762207031,10.7670965194702,10.7674245834351,10.7676267623901,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786', N'106.674003601074,106.689224243164,106.689224243164,106.689224243164,106.700523376465,106.700523376465,106.700523376465', N'10.7686891555786,10.7915821075439,10.7915821075439,10.7915821075439,10.760799407959,10.760799407959,10.760799407959')
SET IDENTITY_INSERT [dbo].[Plan] OFF
/****** Object:  Table [dbo].[OrderPaymentType]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPaymentType](
	[OrderPaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderPaymentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderPaymentType] ON
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (1, N'COD', N'Giao hàng thu tiền', 1)
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (2, N'Pre-Paid', N'Trả trước', 1)
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (3, N'Post-Paid', N'Trả sau', 1)
SET IDENTITY_INSERT [dbo].[OrderPaymentType] OFF
/****** Object:  Table [dbo].[HubCategory]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HubCategory](
	[HubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[HubName] [nvarchar](255) NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HubCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HubCategory] ON
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (1, N'Shop & Go', 1)
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (2, N'Convenient Store', 1)
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (3, N'Buy & Go', 1)
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (4, N'Big C Express', 1)
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (5, N'Family Mart', 1)
INSERT [dbo].[HubCategory] ([HubCategoryId], [HubName], [isActive]) VALUES (6, N'Mini Shop', 1)
SET IDENTITY_INSERT [dbo].[HubCategory] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 04/29/2013 16:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'dda6f972-8605-4860-af55-1ab2ffdb1aab', N'admin', N'admin', NULL, 0, CAST(0x0000A1900114858B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'a4c43593-5652-421c-8be7-98836dcc9e95', N'Customer1', N'customer1', NULL, 0, CAST(0x0000A1AF0098BC23 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'f78373a2-598e-4c13-97ac-26349721a4e7', N'Hub1', N'hub1', NULL, 0, CAST(0x0000A18F01248BCE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'Staff1', N'staff1', NULL, 0, CAST(0x0000A1AF00994ED1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', N'Customer2', N'customer2', NULL, 0, CAST(0x0000A1AF00972E88 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'25213381-2aab-4efc-a61c-d4ed6842cacb', N'Customer3', N'customer3', NULL, 0, CAST(0x0000A1AF0098C76F AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[District]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[CityProvinceId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[District] ON
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (1, 1, N'Quận 1', 1, 10)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (2, 1, N'Quận 12', 1, 120)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (3, 1, N'Quận Thủ Đức', 1, 170)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (4, 1, N'Quận 9', 1, 90)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (5, 1, N'Quận Gò Vấp', 1, 150)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (6, 1, N'Quận Bình Thạnh', 1, 130)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (7, 1, N'Quận Tân Bình', 1, 180)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (8, 1, N'Quận Tân Phú', 1, 190)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (9, 1, N'Quận Phú Nhuận', 1, 160)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (10, 1, N'Quận 2', 1, 20)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (11, 1, N'Quận 3', 1, 30)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (12, 1, N'Quận 10', 1, 100)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (13, 1, N'Quận 11', 1, 110)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (14, 1, N'Quận 4', 1, 40)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (15, 1, N'Quận 5', 1, 50)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (16, 1, N'Quận 6', 1, 60)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (17, 1, N'Quận 8', 1, 80)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (18, 1, N'Quận Bình Tân', 1, 140)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (19, 1, N'Quận 7', 1, 70)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (20, 1, N'Huyện Củ Chi', 1, 220)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (21, 1, N'Huyện Hóc Môn', 1, 230)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (22, 1, N'Huyện Bình Chánh	', 1, 200)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (23, 1, N'Huyện Nhà Bè', 1, 240)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (24, 1, N'Huyện Cần Giờ', 1, 210)
INSERT [dbo].[District] ([DistrictId], [CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (25, 1, N'ABC', 0, 27)
SET IDENTITY_INSERT [dbo].[District] OFF
/****** Object:  Table [dbo].[DeliveryMenInPlan]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMenInPlan](
	[DeliveryMenInPlanId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryMenId] [int] NULL,
	[PlanId] [int] NULL,
	[AssignedDate] [date] NULL,
	[EstimateDistance] [decimal](19, 2) NULL,
	[EstimateTime] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryMenInPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryMenInPlan] ON
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (16, 3, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (17, 4, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (18, 1, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (19, 2, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (20, 3, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (21, 4, 18, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (22, 1, 20, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (23, 2, 20, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (24, 3, 20, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (25, 1, 22, CAST(0xE3360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (26, 2, 22, CAST(0xE3360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (27, 3, 22, CAST(0xE3360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (28, 1, 25, CAST(0xE3360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (29, 2, 25, CAST(0xE3360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (31, 3, 29, CAST(0xE4360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (33, 3, 29, CAST(0xE4360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (38, 3, 29, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (39, 4, 29, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (40, 3, 10, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (41, 4, 10, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (44, 3, 10, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (45, 4, 10, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (46, 3, 40, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (47, 4, 40, CAST(0xE7360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (48, 3, 31, CAST(0xE8360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (53, 3, 64, CAST(0xEA360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (54, 4, 64, CAST(0xEA360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (55, 2, 64, CAST(0xEA360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (56, 3, 64, CAST(0xEA360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (57, 4, 64, CAST(0xEA360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (66, 3, 63, CAST(0xEC360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (67, 4, 63, CAST(0xEC360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (70, 1, 59, CAST(0xEC360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (71, 2, 59, CAST(0xEC360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (72, 5, 66, CAST(0xF9360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (73, 6, 66, CAST(0xF9360B00 AS Date), NULL, NULL)
INSERT [dbo].[DeliveryMenInPlan] ([DeliveryMenInPlanId], [DeliveryMenId], [PlanId], [AssignedDate], [EstimateDistance], [EstimateTime]) VALUES (74, 7, 66, CAST(0xF9360B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DeliveryMenInPlan] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Position] [nvarchar](255) NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (2, 1, N'Ms.', N'Hoàng Thị Tố Như', N'Logistics Manager', N'nhu@lazada.vn', N'0938532564', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (3, 3, N'Mr.', N'Hoàng Minh Hải', NULL, N'hai.hoang@tiki.vn', N'0987676234', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (4, 7, N'Mr.', N'Vuong Nguyen', N'Sales Manager', N'VuongNguyen@lieufruit.com', N'0983650249', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (5, 7, N'Ms.', N'Thuong Tran', N'CFO', N'ThuongTran@lieuFruit.com', N'0993456645', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (6, 8, N'Mr.', N'Huy Dut', N'employee', N'huydut@panhuynh.com', N'1238791829', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (7, 9, N'Mr.', N'Trương Quý Tín', N'Sales Manager', N'tqtin@phuongnambook.com.vn', N'0975465731', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategory] [nvarchar](50) NULL,
	[Name] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[ProductWeight] [nvarchar](255) NULL,
	[ProductPrice] [int] NULL,
	[CustomerId] [int] NOT NULL,
	[IsPermanent] [bit] NOT NULL,
	[ImageURL] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK__Product__B40CC6CD45F365D3] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (5, N'Shirt', N'Shirt', N'M', NULL, 100000, 1, 1, NULL, N'green, medium', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (7, N'Shirt', N'Shirt', N'L', N'', 110000, 1, 1, N'', N'red, large', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (8, N'Shirt', N'T-Shirt', N'M', N'', 100000, 1, 1, N'', N'yellow, t-shirt, medium', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (9, N'Laptop', N'laptop Dell', N'', N'3kg', 15000000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (10, N'Laptop', N'laptop HP', NULL, N'2,8 kg', 12000000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (11, N'Dress', N'Váy in hoa', N'M', N'100g', 120000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (12, N'Dress', N'Chân váy bút chì', N'M', N'100g', 110000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (37, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', 70000, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (38, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', 200000, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (39, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', 150000, 1, 0, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (43, N'Book', N'Langbiang', N'5 x 5 x 5 cm', N'2kg', 205000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (45, N'Book', N'Conan', N'5 x 5 x 5 cn', N'100g', 12000, 1, 1, N'http://fs1.cyworld.vn/data4/2010/08/02/024/1280724824058362_file.jpg', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (47, N'khùng', N'enty', NULL, NULL, 1, 1, 1, N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRN0ToQmyldf1c2WAok0th-sT4d8jU7Vs4S8n_73XugttZ9_SIP', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (49, N'Dụng cụ laptop', N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g', 50000, 1, 1, N'http://www.v2kpc.vn/pictures/products/x600_4_282.jpg', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (50, N'Dụng cụ laptop', N'mouse Mitsumi', NULL, N'100g', 30000, 1, 1, NULL, NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (51, N'Dụng cụ laptop', N'usb 3g', NULL, N'20g', 500000, 1, 1, N'http://www.vatgia.com/user_product_fullsize/iop1316668005.jpg', N'usb 3g vietel', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (52, N'Dụng cụ laptop', N'usb 4gb', NULL, N'20g', 40000, 1, 1, N'http://www.toshiba-memory.com/img/USB_Flash_Ginga_4GB_large.jpg', N'usb Acus', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (53, N'Dụng cụ laptop', N'usb 16 gb', NULL, N'30g', 130000, 1, 1, NULL, N'usb 16gb ancens', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (54, N'Dụng cụ laptop', N'bộ lau chùi lap top', NULL, NULL, 10000, 1, 1, N'http://www.vatgia.com/raovat_pictures/1/ujs1265450010.jpg', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (55, N'Dụng cụ laptop', N'túi chống xóc', NULL, N'100g', 50000, 1, 1, N'http://v2kpc.com/pictures/products/tui_vaio_343.jpg', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (58, N'21', N'ly trẻ em', NULL, NULL, 240000, 1, 1, N'http://g.vatgia.vn/gallery_img/9/ode1339071720.jpg', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (59, N'đĩa', N'đĩa thủy tinh', NULL, NULL, 30000, 1, 1, N'http://mua24h.com.vn/upload/sanpham/2011/08/25/16454105930269/2011825165119953576.JPG', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (60, N'đĩa', N'đĩa hình chữ nhật', NULL, NULL, 50000, 1, 1, N'http://t0.gstatic.com/images?q=tbn:ANd9GcSq1502MWc6OJVwTNLcyFiBXJeU9HD-56juEGzIoRvoZgtH7yBT', NULL, 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (61, N'đĩa', N'đĩa sứ', NULL, NULL, 60000, 1, 1, N'http://g.vatgia.vn/gallery_img/8/sfp1335262371.jpg', N'đĩa sứ minh long', 0)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (63, N'Laptop', N'Dell Lattitude E6420', N'25 x 15 x 15 cm', N'2.89 kg', 17000000, 2, 1, N'http://www.ebraincity.com/ebraincity/product_images/y/740/DELL_LATITUDE_E6420__00332.jpg', N'Laptop dell', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (66, N'Laptop', N'Sony Vaio Audi', N'5 x 15 x 15 cm', N'1.5 kg', 21000000, 2, 1, N'http://www.mediamart.vn/Images/Product/9216_laptop-sony-vaio-sve14122cvb-black-win8.jpg', N'Laptop Vaio', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (67, N'Laptop', N'Alienware M14x', N'30 x 30 x 15', N'3.5kg', 30000000, 2, 1, N'http://image.alienware.com/images/galleries/gallery-shot_laptops_m14x_08.jpg', N'Laptop Alienware', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (69, N'Laptop', N'Toshiba Sattelite', N'30x30x30', N'1.2 kg', 12000000, 2, 1, N'http://www.getpcmemory.com/pics/toshiba-satellite-pro-u400.jpg', N'Laptop Toshiba', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (70, N'Laptop', N'HP DVX6', N'12x12x12', N'2 kg', 13000000, 2, 1, N'http://blog.uncovering.org/archives/uploads/2008/08062108_blog.uncovering.org_portatil.jpg', N'Laptop HP', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (71, N'Phone', N'iPhone 3Gs', N'12 x 12 x 12 ', N'300 gram', 2500000, 3, 1, NULL, N'iPhone', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (72, N'Phone', N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram', 4440000, 3, 1, NULL, N'Samsung phone', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (73, N'Phone', N'Nokia 1280', N'12 x 12 x 12', N'3 tons', 444000, 3, 1, NULL, N'a brickbreaker', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (75, N'Phone', N'Nokia 1290', N'12 x 12 x 12', N'3 kg', 400000, 3, 1, NULL, N'a father of god', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (76, N'Phone', N'Blackberry', N'12 x 12 x 12', N'200 gram', 4000000, 3, 1, NULL, N'a blackberry ', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (77, N'Mouse', N'Razer DA 3000 dpi', N'12 x 12 x 12', N'250 gram', 990000, 4, 1, NULL, N'A mouse for big boss', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (78, N'Mouse', N'Razer Abyssuss Mirror', N'12 x 12 x 12 ', N'125 gram', 450000, 4, 1, NULL, N'A mouse for ladykiller', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (79, N'Mouse', N'Steel Series Kinzu ', N'20 x 20 x 20', N'125 gram', 400000, 4, 1, NULL, N'Tang kem pad QcK', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (80, N'Mouse', N'Stell Series Sensei', N'30 x 40 x 50', N'200 gram', 2200000, 4, 1, NULL, N'A mouse for master', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (81, N'Mouse', N'Roccat Kone', N'30 x 40 x 50', N'500 gram', 1500000, 4, 1, NULL, N'A mouse for pro gaming', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (82, N'MousePad', N'Razer Goliathus', N'30 x 40 x 2', N'500 gram', 175000, 5, 1, NULL, N'A pad for DoTa', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (83, N'MousePad', N'Razer Goliathus speed edition', N'30 x 40 x 2', N'500 gram', 275000, 5, 1, NULL, N'a pad for gaming pro', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (84, N'MousePad', N'Razer Goliathus', N'30 x 40 x 2', N'500 gram', 189000, 5, 1, NULL, N'a pad fake ', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (85, N'MousePad', N'Steel Series Qck Pad', N'20 x 20 x 2', N'125 gram', 100000, 5, 1, NULL, N'nevermore', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (86, N'Headphone', N'Beats by Dr Dre', N'20x 20 x 2 ', N'10 gram', 2100000, 6, 1, NULL, N'A soul for music', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (87, N'Headphone', N'Senheiser HD 700', N'40 x 20 x 10', N'200 gram', 7800000, 6, 1, NULL, N'Music Beats them all', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (88, N'HeadPhone', N'Senheiser RS 360', N'40 x 20 x 10', N'300 gram', 3100000, 6, 1, NULL, N'Music is the best', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (89, N'HeadPhone', N'Senheiser PXC360BT', N'40 x 20 x 10', N'400 gram', 7839000, 6, 1, NULL, N'Kiing of Music', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (90, N'Headphone', N'Senheiser RS110 2', N'40 x 20 x 10', N'200 gram', 1170000, 6, 1, NULL, N'Slave of the music', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (91, N'Fruit', N'Chom chom', N'40 x 20 x 40', N'2 kg', 25000, 7, 1, NULL, N'Chom chom Long Khanh gion ngot', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (93, N'Fruit', N'Sau rieng', N'40 x20 x 40', N'2 kg', 50000, 7, 1, NULL, N'Sau rieng com vang hot lep Cai Mon Can Tho', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (94, N'Fruit', N'Xoai Cat Hoa Loc', N'40 x 20 x 40', N'2 kg', 50000, 7, 1, NULL, N'Xoai cat chinh goc Hoa Loc Cao Lanh', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (95, N'Fruit', N'Man Hoa An', N'40 x 20 x 40', N'2 kg', 15000, 7, 1, NULL, N'Man Hoa An thom ngon gion ngot', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (96, N'Fruit', N'Lekima (qua hot ga)', N'40 x 20 x 40', N'2 kg', 20000, 7, 1, NULL, N'Nhieu vitamin A va beta carotene tot cho co the', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (97, N'Fruit', N'Nho Da Lat', N'40 x 20 x 40', N'2 kg', 35000, 7, 1, NULL, N'Nhieu vitamin C va Glucose', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (98, N'Fruit', N'Vai Lai Thieu', N'40 x 20 x 40', N'2 kg', 35000, 7, 1, NULL, N'Nhieu glucose tot cho nguoi tieu duong', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (99, N'Fruit', N'Chuoi sap', N'40 x 20 x 40', N'2 kg', 40000, 7, 1, NULL, N'Chuoi nay an vao se tang IQ', 1)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Description], [Active]) VALUES (100, N'Fruit', N'Thot not', N'40 x 20 x 40', N'2 kg', 130000, 7, 1, NULL, N'Mat ngot cho mua he nong bong', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'34852945-276a-4ed3-a976-1f39a6f4b3d6', N'admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'8bde2e2d-05e1-49c9-a4b2-016bd0143df9', N'Customer', N'customer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'e3159b1a-f041-4238-b386-99b502817db9', N'Hub', N'hub', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'be78dcdc-8e8e-4946-8209-75bf3f2ee7c7', N'Office Staff', N'office staff', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', N'OrdersConfiguration.enableReturnedReducedPrice:S:0:5:RequestsConfiguration.interval:S:5:1:OrdersConfiguration.interval:S:6:1:OrdersConfiguration.flag:S:7:4:OrdersConfiguration.enableRepricingApproveRequest:S:11:5:RequestsConfiguration.minPrice:S:16:1:RequestsConfiguration.flag:S:17:4:OrdersConfiguration.enableDraft:S:21:4:RequestsConfiguration.immediately:S:25:4:OrdersConfiguration.immediately:S:29:5:', N'False01TrueFalse0TrueTrueTrueFalse', 0x, CAST(0x0000A1AF0096996C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a4c43593-5652-421c-8be7-98836dcc9e95', N'OrdersConfiguration.enableReturnedReducedPrice:S:0:5:RequestsConfiguration.interval:S:5:1:OrdersConfiguration.interval:S:6:1:OrdersConfiguration.flag:S:7:4:OrdersConfiguration.enableRepricingApproveRequest:S:11:5:RequestsConfiguration.minPrice:S:16:1:RequestsConfiguration.flag:S:17:4:OrdersConfiguration.enableDraft:S:21:4:RequestsConfiguration.immediately:S:25:5:OrdersConfiguration.immediately:S:30:5:', N'False11TrueFalse0TrueTrueFalseFalse', 0x, CAST(0x0000A1AF00974E0A AS DateTime))
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'dda6f972-8605-4860-af55-1ab2ffdb1aab', N'2gZg7JEobqObBd1gcNxfGqNMPTE=', 1, N'1eegZAF/4JqFIbWnV7DJ+w==', NULL, N'admin@abc.com', N'admin@abc.com', NULL, NULL, 1, 0, CAST(0x0000A1890026CBA4 AS DateTime), CAST(0x0000A1900114858B AS DateTime), CAST(0x0000A1890026CBA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'f78373a2-598e-4c13-97ac-26349721a4e7', N'7y6B1cwGWVMuKMCDZHPMvIX1Qlg=', 1, N'DKs1v8llHkTo81I1unbIVg==', NULL, N'Hub1@yahoo.com', N'hub1@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A18F011F0A6C AS DateTime), CAST(0x0000A18F01248BCE AS DateTime), CAST(0x0000A18F011F0A6C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'a4c43593-5652-421c-8be7-98836dcc9e95', N'YcvNfbgTcHgUhVENoIAb26qfEH8=', 1, N'5cVwxwUBqmd1liTqQTsMkQ==', NULL, N'KhanhNHV@fpt.edu.vn', N'khanhnhv@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A18F011EE618 AS DateTime), CAST(0x0000A1AF0097387E AS DateTime), CAST(0x0000A18F011EE618 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'R4Gk4cdzjAJOmHnxvvnd4nszBt8=', 1, N'/67zVbdF+tyq/v90RWFUwg==', NULL, N'KhanhNHV@fpt.edu.vn', N'khanhnhv@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A18F0121D1C0 AS DateTime), CAST(0x0000A1AF00994ED1 AS DateTime), CAST(0x0000A18F0121D1C0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', N'8iYJc6LgE98PFXyaL5rH6GwhIyo=', 1, N'HqnoZKMhUpHSPxuEIb1+2Q==', NULL, N'Customer2@gmail.com', N'customer2@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1AF009273CC AS DateTime), CAST(0x0000A1AF0092B29C AS DateTime), CAST(0x0000A1AF009273CC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'25213381-2aab-4efc-a61c-d4ed6842cacb', N'BF4ACrNZe2qW90M/GDuIQ27XCuA=', 1, N'/vI6Xwm62Hi5mQCQ8kRY3g==', NULL, N'KhanhNHV5@fpt.edu.vn', N'khanhnhv5@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A1AF00985CB0 AS DateTime), CAST(0x0000A1AF0098C76F AS DateTime), CAST(0x0000A1AF00985CB0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[WardId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ward] ON
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (1, 1, N'Phường Tân Định', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (2, 1, N'Phường Đa Kao', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (3, 1, N'Phường Bến Nghé', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (4, 1, N'Phường Bến Thành', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (5, 1, N'Phường Nguyễn Thái Bình', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (6, 1, N'Phường Phạm Ngũ Lão', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (7, 1, N'Phường Cầu Ông Lãnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (8, 1, N'Phường Cô Giang', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (9, 1, N'Phường Nguyễn Cư Trinh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (10, 1, N'Phường Cầu Kho', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (11, 2, N'Phường Thạnh Xuân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (12, 2, N'Phường Thạnh Lộc', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (13, 2, N'Phường Hiệp Thành', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (14, 2, N'Phường Thới An', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (15, 2, N'Phường Tân Chánh Hiệp', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (16, 2, N'Phường An Phú Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (17, 2, N'Phường Tân Thới Hiệp', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (18, 2, N'Phường Trung Mỹ Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (19, 2, N'Phường Tân Hưng Thuận', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (20, 2, N'Phường Đông Hưng Thuận', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (21, 2, N'Phường Tân Thới Nhất', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (22, 3, N'Phường Linh Xuân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (23, 3, N'Phường Bình Chiểu', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (24, 3, N'Phường Linh Trung', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (25, 3, N'Phường Tam Bình', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (26, 3, N'Phường Tam Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (27, 3, N'Phường Hiệp Bình Phước', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (28, 3, N'Phường Hiệp Bình Chánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (29, 3, N'Phường Linh Chiểu', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (30, 3, N'Phường Linh Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (31, 3, N'Phường Linh Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (32, 3, N'Phường Bình Thọ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (33, 3, N'Phường Trường Thọ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (34, 4, N'Phường Long Bình', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (35, 4, N'Phường Long Thạnh Mỹ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (36, 4, N'Phường Tân Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (37, 4, N'Phường Hiệp Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (38, 4, N'Phường Tăng Nhơn Phú A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (39, 4, N'Phường Tăng Nhơn Phú B', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (40, 4, N'Phường Phước Long B', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (41, 4, N'Phường Phước Long A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (42, 4, N'Phường Trường Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (43, 4, N'Phường Long Phước', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (44, 4, N'Phường Long Trường', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (45, 4, N'Phường Phước Bình', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (46, 4, N'Phường Phú Hữu', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (47, 5, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (48, 5, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (49, 5, N'Phường 17', 1, 170)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (50, 5, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (51, 5, N'Phường 16', 1, 160)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (52, 5, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (53, 5, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (54, 5, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (55, 5, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (56, 5, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (57, 5, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (58, 5, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (59, 5, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (60, 5, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (61, 5, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (62, 5, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (63, 6, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (64, 6, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (65, 6, N'Phường 27', 1, 270)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (66, 6, N'Phường 26', 1, 260)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (67, 6, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (68, 6, N'Phường 25', 1, 250)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (69, 6, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (70, 6, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (71, 6, N'Phường 24', 1, 240)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (72, 6, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (73, 6, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (74, 6, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (75, 6, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (76, 6, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (77, 6, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (78, 6, N'Phường 17', 1, 170)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (79, 6, N'Phường 21', 1, 210)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (80, 6, N'Phường 22', 1, 220)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (81, 6, N'Phường 19', 1, 190)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (82, 6, N'Phường 28', 1, 280)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (83, 7, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (84, 7, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (85, 7, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (86, 7, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (87, 7, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (88, 7, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (89, 7, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (90, 7, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (91, 7, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (92, 7, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (93, 7, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (94, 7, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (95, 7, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (96, 7, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (97, 7, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (98, 8, N'Phường Tân Sơn Nhì', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (99, 8, N'Phường Tây Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (100, 8, N'Phường Sơn Kỳ', 1, 999)
GO
print 'Processed 100 total records'
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (101, 8, N'Phường Tân Qúy', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (102, 8, N'Phường Tân Thành', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (103, 8, N'Phường Phú Thọ Hoà', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (104, 8, N'Phường Phú Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (105, 8, N'Phường Phú Trung', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (106, 8, N'Phường Hoà Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (107, 8, N'Phường Hiệp Tân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (108, 8, N'Phường Tân Thới Hoà', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (109, 9, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (110, 9, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (111, 9, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (112, 9, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (113, 9, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (114, 9, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (115, 9, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (116, 9, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (117, 9, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (118, 9, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (119, 9, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (120, 9, N'Phường 17', 1, 170)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (121, 9, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (122, 9, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (123, 9, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (124, 10, N'Phường Thảo Điền', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (125, 10, N'Phường An Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (126, 10, N'Phường Bình An', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (127, 10, N'Phường Bình Trưng Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (128, 10, N'Phường Bình Trưng Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (129, 10, N'Phường Bình Khánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (130, 10, N'Phường An Khánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (131, 10, N'Phường Cát Lái', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (132, 10, N'Phường Thạnh Mỹ Lợi', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (133, 10, N'Phường An Lợi Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (134, 10, N'Phường Thủ Thiêm', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (135, 11, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (136, 11, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (137, 11, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (138, 11, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (139, 11, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (140, 11, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (141, 11, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (142, 11, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (143, 11, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (144, 11, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (145, 11, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (146, 11, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (147, 11, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (148, 11, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (149, 12, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (150, 12, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (151, 12, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (152, 12, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (153, 12, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (154, 12, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (155, 12, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (156, 12, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (157, 12, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (158, 12, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (159, 12, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (160, 12, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (161, 12, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (162, 12, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (163, 12, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (164, 13, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (165, 13, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (166, 13, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (167, 13, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (168, 13, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (169, 13, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (170, 13, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (171, 13, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (172, 13, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (173, 13, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (174, 13, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (175, 13, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (176, 13, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (177, 13, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (178, 13, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (179, 13, N'Phường 16', 1, 160)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (180, 14, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (181, 14, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (182, 14, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (183, 14, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (184, 14, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (185, 14, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (186, 14, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (187, 14, N'Phường 18', 1, 180)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (188, 14, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (189, 14, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (190, 14, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (191, 14, N'Phường 16', 1, 160)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (192, 14, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (193, 14, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (194, 14, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (195, 15, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (196, 15, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (197, 15, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (198, 15, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (199, 15, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (200, 15, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (201, 15, N'Phường 15', 1, 150)
GO
print 'Processed 200 total records'
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (202, 15, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (203, 15, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (204, 15, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (205, 15, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (206, 15, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (207, 15, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (208, 15, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (209, 15, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (210, 16, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (211, 16, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (212, 16, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (213, 16, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (214, 16, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (215, 16, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (216, 16, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (217, 16, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (218, 16, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (219, 16, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (220, 16, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (221, 16, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (222, 16, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (223, 16, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (224, 17, N'Phường 8', 1, 80)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (225, 17, N'Phường 2', 1, 20)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (226, 17, N'Phường 1', 1, 10)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (227, 17, N'Phường 3', 1, 30)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (228, 17, N'Phường 11', 1, 110)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (229, 17, N'Phường 9', 1, 90)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (230, 17, N'Phường 10', 1, 100)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (231, 17, N'Phường 4', 1, 40)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (232, 17, N'Phường 13', 1, 130)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (233, 17, N'Phường 12', 1, 120)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (234, 17, N'Phường 5', 1, 50)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (235, 17, N'Phường 14', 1, 140)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (236, 17, N'Phường 6', 1, 60)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (237, 17, N'Phường 15', 1, 150)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (238, 17, N'Phường 16', 1, 160)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (239, 17, N'Phường 7', 1, 70)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (240, 18, N'Phường Bình Hưng Hòa', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (241, 18, N'Phường Bình Hưng Hoà A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (242, 18, N'Phường Bình Hưng Hoà B', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (243, 18, N'Phường Bình Trị Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (244, 18, N'Phường Bình Trị Đông A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (245, 18, N'Phường Bình Trị Đông B', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (246, 18, N'Phường Tân Tạo', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (247, 18, N'Phường Tân Tạo A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (248, 18, N'Phường An Lạc', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (249, 18, N'Phường An Lạc A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (250, 19, N'Phường Tân Thuận Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (251, 19, N'Phường Tân Thuận Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (252, 19, N'Phường Tân Kiểng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (253, 19, N'Phường Tân Hưng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (254, 19, N'Phường Bình Thuận', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (255, 19, N'Phường Tân Quy', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (256, 19, N'Phường Phú Thuận', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (257, 19, N'Phường Tân Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (258, 19, N'Phường Tân Phong', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (259, 19, N'Phường Phú Mỹ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (260, 20, N'Thị trấn Củ Chi', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (261, 20, N'Xã Phú Mỹ Hưng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (262, 20, N'Xã An Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (263, 20, N'Xã Trung Lập Thượng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (264, 20, N'Xã An Nhơn Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (265, 20, N'Xã Nhuận Đức', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (266, 20, N'Xã Phạm Văn Cội', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (267, 20, N'Xã Phú Hòa Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (268, 20, N'Xã Trung Lập Hạ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (269, 20, N'Xã Trung An', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (270, 20, N'Xã Phước Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (271, 20, N'Xã Phước Hiệp', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (272, 20, N'Xã Tân An Hội', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (273, 20, N'Xã Phước Vĩnh An', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (274, 20, N'Xã Thái Mỹ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (275, 20, N'Xã Tân Thạnh Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (276, 20, N'Xã Hòa Phú', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (277, 20, N'Xã Tân Thạnh Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (278, 20, N'Xã Bình Mỹ', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (279, 20, N'Xã Tân Phú Trung', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (280, 20, N'Xã Tân Thông Hội', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (281, 21, N'Thị trấn Hóc Môn', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (282, 21, N'Xã Tân Hiệp', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (283, 21, N'Xã Nhị Bình', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (284, 21, N'Xã Đông Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (285, 21, N'Xã Tân Thới Nhì', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (286, 21, N'Xã Thới Tam Thôn', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (287, 21, N'Xã Xuân Thới Sơn', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (288, 21, N'Xã Tân Xuân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (289, 21, N'Xã Xuân Thới Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (290, 21, N'Xã Trung Chánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (291, 21, N'Xã Xuân Thới Thượng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (292, 21, N'Xã Bà Điểm', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (293, 22, N'Thị trấn Tân Túc', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (294, 22, N'Xã Phạm Văn Hai', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (295, 22, N'Xã Vĩnh Lộc A', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (296, 22, N'Xã Vĩnh Lộc B', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (297, 22, N'Xã Bình Lợi', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (298, 22, N'Xã Lê Minh Xuân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (299, 22, N'Xã Tân Nhựt', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (300, 22, N'Xã Tân Kiên', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (301, 22, N'Xã Bình Hưng', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (302, 22, N'Xã Phong Phú', 1, 999)
GO
print 'Processed 300 total records'
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (303, 22, N'Xã An Phú Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (304, 22, N'Xã Hưng Long', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (305, 22, N'Xã Đa Phước', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (306, 22, N'Xã Tân Quý Tây', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (307, 22, N'Xã Bình Chánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (308, 22, N'Xã Quy Đức', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (309, 23, N'Thị trấn Nhà Bè', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (310, 23, N'Xã Phước Kiển', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (311, 23, N'Xã Phước Lộc', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (312, 23, N'Xã Nhơn Đức', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (313, 23, N'Xã Phú Xuân', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (314, 23, N'Xã Long Thới', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (315, 23, N'Xã Hiệp Phước', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (316, 24, N'Thị trấn Cần Thạnh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (317, 24, N'Xã Bình Khánh', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (318, 24, N'Xã Tam Thôn Hiệp', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (319, 24, N'Xã An Thới Đông', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (320, 24, N'Xã Thạnh An', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (321, 24, N'Xã Long Hòa', 1, 999)
INSERT [dbo].[Ward] ([WardId], [DistrictId], [Name], [IsActive], [DisplayOrder]) VALUES (322, 24, N'Xã Lý Nhơn', 1, 999)
SET IDENTITY_INSERT [dbo].[Ward] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dda6f972-8605-4860-af55-1ab2ffdb1aab', N'34852945-276a-4ed3-a976-1f39a6f4b3d6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'be78dcdc-8e8e-4946-8209-75bf3f2ee7c7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', N'8bde2e2d-05e1-49c9-a4b2-016bd0143df9')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a4c43593-5652-421c-8be7-98836dcc9e95', N'8bde2e2d-05e1-49c9-a4b2-016bd0143df9')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'25213381-2aab-4efc-a61c-d4ed6842cacb', N'8bde2e2d-05e1-49c9-a4b2-016bd0143df9')
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[CustomerAddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[WardId] [int] NULL,
	[DistrictId] [int] NOT NULL,
	[Latitude] [decimal](19, 16) NULL,
	[Longitude] [decimal](19, 16) NULL,
	[IsActive] [bit] NOT NULL,
	[Note] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (1, 1, N'214 Trần Quang Khải', 1, 1, CAST(10.7916743691173200 AS Decimal(19, 16)), CAST(106.6892067962951400 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (2, 1, N'75 Trần Xuân Soạn', 253, 19, CAST(10.7517559000000000 AS Decimal(19, 16)), CAST(106.7047653000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (3, 2, N'496 Nguyễn Thị Minh Khai', 147, 11, CAST(10.7664162000000000 AS Decimal(19, 16)), CAST(106.6825193000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (4, 2, N'74/8 Điện Biên Phủ', 156, 12, CAST(10.7943985000000000 AS Decimal(19, 16)), CAST(106.7017615000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (5, 3, N'274 Nguyễn Thị Định', 131, 10, CAST(10.7785694627061090 AS Decimal(19, 16)), CAST(106.7634510079345800 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (6, 4, N'72/8B Nơ Trang Long', 77, 6, CAST(10.8186582237134610 AS Decimal(19, 16)), CAST(106.6991006693115200 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (7, 5, N'132 Thích Quảng Đức', 111, 9, CAST(10.8072343000000000 AS Decimal(19, 16)), CAST(106.6798130000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (8, 6, N'Lô 3A đường C5, Khu chế xuất Tân Thuận', NULL, 19, CAST(10.7556416000000000 AS Decimal(19, 16)), CAST(106.7428234000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (9, 1, N'73/15 Hoàng Diệu', NULL, 14, CAST(10.7609097752776200 AS Decimal(19, 16)), CAST(106.7006792327881600 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (10, 7, N'10 Lê Hồng Phong', 199, 15, CAST(10.7547939000000000 AS Decimal(19, 16)), CAST(106.6789279000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (11, 7, N'206 Thống Nhất', 52, 5, CAST(10.8363218000000000 AS Decimal(19, 16)), CAST(106.6647886000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (12, 8, N'5 Nguyễn Huệ', NULL, 1, CAST(10.7717111000000000 AS Decimal(19, 16)), CAST(106.7061797000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (13, 9, N'496 Nguyễn Thị Minh Khai', 147, 11, CAST(10.7664162000000000 AS Decimal(19, 16)), CAST(106.6825193000000000 AS Decimal(19, 16)), 1, NULL)
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  Table [dbo].[Hub]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hub](
	[HubId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[WardId] [int] NULL,
	[DistrictId] [int] NOT NULL,
	[Latitude] [decimal](19, 16) NULL,
	[Longitude] [decimal](19, 16) NULL,
	[IsActive] [bit] NOT NULL,
	[HubCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HubId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hub] ON
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (1, N'Head Quarter', N'107 Lê Hồng Phong', 154, 12, CAST(10.7687243311629000 AS Decimal(19, 16)), CAST(106.6740849566223200 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (5, N'Shop & Go Hoang Van Thu', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (6, N'Shop & Go Quang Trung', N'30 Quang Trung', 195, 15, CAST(10.8370470000000000 AS Decimal(19, 16)), CAST(106.6561910000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (7, N'Shop & Go Hung Vuong', N'145 Hung Vuong', 160, 12, CAST(10.6429950000000000 AS Decimal(19, 16)), CAST(107.2446260000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (9, N'Shop & Go Ly Thuong Kiet', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (12, N'Family Mart Cong Hoa', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), 1, 5)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (13, N'Family Mart Dang Van Ngu', N'141A02 Dang Van Ngu', 121, 9, CAST(10.7916820000000000 AS Decimal(19, 16)), CAST(106.6674860000000000 AS Decimal(19, 16)), 1, 5)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (14, N'Family Mart CMT8', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), 1, 5)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (15, N'Family Mart Ly Thuong Kiet', N'319 Ly Thuong Kiet', 164, 13, CAST(10.7928830000000000 AS Decimal(19, 16)), CAST(106.6533820000000000 AS Decimal(19, 16)), 1, 5)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (16, N'Family Mart D1', N'169 D1', 68, 6, CAST(10.8239560000000000 AS Decimal(19, 16)), CAST(106.7161800000000000 AS Decimal(19, 16)), 1, 5)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (17, N'New Cho Le Van Sy', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 1, 4)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (18, N'Convenient Store Hai Ba Trung', N'36 Hai Ba Trung', 3, 1, CAST(10.7768610000000000 AS Decimal(19, 16)), CAST(106.7046690000000000 AS Decimal(19, 16)), 1, 2)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (20, N'Convenient Store Nguyen Thong', N'1 Nguyen Thong', 141, 11, CAST(10.7794640000000000 AS Decimal(19, 16)), CAST(106.6819720000000000 AS Decimal(19, 16)), 1, 2)
SET IDENTITY_INSERT [dbo].[Hub] OFF
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[CustomerId] [int] NULL,
	[HubId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'cabd319c-8c36-4f50-a62f-06a43b3d44f1', N'Hồ Hữu Tài', NULL, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'Huỳnh Ngọc Bình', NULL, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'Đỗ Hoàng Duy Tân', NULL, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'Nguyễn Hoàng Việt Khánh', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'Lê Anh Đảo', NULL, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'Phan Hoàng Vũ', NULL, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', N'Customer So 2', 2, NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'Lazada Số 1', 1, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'Account Phương Nam 01', 9, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'kartorafuma', 8, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'TK Nhóm Mua số 01', 4, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'a4c43593-5652-421c-8be7-98836dcc9e95', N'Customer So 1', 1, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'Em gái có dái', 4, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd06a2987-f853-47eb-952c-cdd2782170d7', N'admin', NULL, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'Loan Phung Dre', 5, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'Nguyen Thanh Truc Dao', NULL, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'25213381-2aab-4efc-a61c-d4ed6842cacb', N'Customer So 3', 3, NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'kartorafuma', 7, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'9f668001-713a-42d1-94aa-d9d7ed62ba52', N'Bao', 3, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'TK zalora số 01', 2, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'Linh Nguyen Bá', 7, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'kartorafuma', 3, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'TK Tiki số 01', 3, 1)
/****** Object:  Table [dbo].[Request]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CollectionAddressId] [int] NOT NULL,
	[RequestedDate] [datetime] NULL,
	[CollectionPlanId] [int] NULL,
	[RequestStatus] [int] NOT NULL,
	[Note] [ntext] NULL,
	[PricedDate] [datetime] NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK__Request__33A8517A2B0A656D] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Request] ON
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (64, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19C0014340C AS DateTime), NULL, 8, N'3 order', CAST(0x0000A19C00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (65, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19C00138FE7 AS DateTime), NULL, 8, N'2 orders', CAST(0x0000A19C00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (66, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 9, CAST(0x0000A19C00150546 AS DateTime), NULL, 8, N'2 orders, 1 order tao bang tay', CAST(0x0000A19E00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (67, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 9, CAST(0x0000A19C00157EBD AS DateTime), NULL, 8, N'1 order thôi', CAST(0x0000A19E00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (68, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19E0154FB90 AS DateTime), NULL, 8, N'', CAST(0x0000A19E00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (69, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 9, CAST(0x0000A19E01552CA6 AS DateTime), NULL, 8, N'', CAST(0x0000A19E00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (70, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19E0155499D AS DateTime), NULL, 2, N'', CAST(0x0000A1AF010A774D AS DateTime), CAST(0x0000A1AF010AC048 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (71, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19F01341CE9 AS DateTime), NULL, 2, N'', CAST(0x0000A1AF01010657 AS DateTime), CAST(0x0000A1AF0101B494 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (72, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 9, CAST(0x0000A19F01343B01 AS DateTime), NULL, 2, N'', CAST(0x0000A1AF01011DDD AS DateTime), CAST(0x0000A1AF0101B494 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (73, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19F01345D8F AS DateTime), NULL, 2, N'', CAST(0x0000A1AF01012E0E AS DateTime), CAST(0x0000A1AF0101B494 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (74, N'a4c43593-5652-421c-8be7-98836dcc9e95', 1, 1, CAST(0x0000A19F01356109 AS DateTime), NULL, 2, N'', CAST(0x0000A1AF0101A017 AS DateTime), CAST(0x0000A1AF0101B494 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (75, N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', 2, 3, CAST(0x0000A1AF01090CA4 AS DateTime), NULL, 2, NULL, CAST(0x0000A1AF0109D2F3 AS DateTime), CAST(0x0000A1AF0109D68D AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (76, N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', 2, 4, CAST(0x0000A1AF01090CD2 AS DateTime), NULL, 2, NULL, CAST(0x0000A1AF010A1AFB AS DateTime), CAST(0x0000A1AF010A1F4B AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (77, N'fd9a9e7c-9bda-41ce-9350-60984d45cf6b', 2, 3, CAST(0x0000A1AF01090CE5 AS DateTime), NULL, 2, NULL, CAST(0x0000A1AF010A6155 AS DateTime), CAST(0x0000A1AF010A6649 AS DateTime))
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (78, N'25213381-2aab-4efc-a61c-d4ed6842cacb', 3, 5, CAST(0x0000A1AF010C9346 AS DateTime), NULL, 2, N'', CAST(0x0000A1AF010CC6B9 AS DateTime), CAST(0x0000A1AF010CD45C AS DateTime))
SET IDENTITY_INSERT [dbo].[Request] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NULL,
	[DeliveryOptionId] [int] NOT NULL,
	[OrderPaymentTypeId] [int] NOT NULL,
	[DeliveryPlanId] [int] NULL,
	[DueDate] [datetime] NULL,
	[CollectedDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[ReceiverName] [nvarchar](255) NULL,
	[ReceiverPhone] [nvarchar](255) NOT NULL,
	[ReceiverAddress] [nvarchar](255) NOT NULL,
	[ReceiverAddressWardId] [int] NULL,
	[ReceiverAddressDistrictId] [int] NOT NULL,
	[Latitude] [decimal](19, 16) NULL,
	[Longitude] [decimal](19, 16) NULL,
	[Fee] [int] NULL,
	[AmountToBeCollectedFromReceiver] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[Note] [ntext] NULL,
	[HubId] [int] NULL,
	[Passcode] [nvarchar](10) NULL,
	[ReceiverMail] [nvarchar](255) NULL,
	[DeliveryTypeId] [int] NULL,
	[CustomerId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ApprovedDate] [datetime] NULL,
	[RejectedDate] [datetime] NULL,
 CONSTRAINT [PK__Order__C3905BCF2EDAF651] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (116, 64, 1, 1, NULL, NULL, NULL, NULL, N'Enty', N'0979684939', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), 34000, 200000, 6, NULL, 12, N'8CWXGGu', N'gt4eyes@yahoo.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (117, 64, 1, 1, NULL, NULL, NULL, NULL, N'Khánh', N'01219050305', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), 34000, 204000, 6, NULL, 14, N'FSstHsS', N'byb1k3t33n_9x@yahoo.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (118, 64, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Đỗ Vượng', N'01231231239', N'50 Quang Trung', 1, 5, CAST(10.8271925000000000 AS Decimal(19, 16)), CAST(106.6779609000000200 AS Decimal(19, 16)), 67000, 250000, 6, NULL, NULL, NULL, N'vuongnd@gmail.com', 1, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (119, 65, 1, 1, NULL, NULL, NULL, NULL, N'An Ngọc Anh', N'01212345212', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 67000, 27000000, 6, NULL, 5, N'q8t9d4h', N'anhAN@gmail.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19C00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (120, 66, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Hoàng Việt Khánh ', N'01234567890', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 67000, 170000, 6, NULL, 17, N'tG4U1PK', N'khanhnhv@yahoo.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (121, 66, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Đỗ Vượng', N'01213456789', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), 34000, 350000, 6, NULL, 14, N'?R9fsPr', N'vuongnd@yahoo.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (122, 68, 1, 1, NULL, NULL, NULL, NULL, N'An Ngọc Anh', N'0912345678', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 34000, 330000, 6, NULL, 5, N'CGF-GZR', N'', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (123, 68, 1, 1, NULL, NULL, NULL, NULL, N'Lê Nhật Lam', N'0987654321', N'145 Hung Vuong', 160, 12, CAST(10.7614730000000000 AS Decimal(19, 16)), CAST(106.6751860000000000 AS Decimal(19, 16)), 67000, 670000, 6, NULL, 7, N'?RscU9j', N'lamle@hotmail.net', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (124, 70, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Thị Khánh', N'0967892432', N'36 Hai Ba Trung', 3, 1, CAST(10.7768610000000000 AS Decimal(19, 16)), CAST(106.7046690000000000 AS Decimal(19, 16)), 68000, 610000, 10, NULL, 18, N'FE-UqoT', N'khanhnguyen@yahoo.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (125, 70, 1, 1, NULL, NULL, NULL, NULL, N'Lê Hoài Thương', N'01242135223', N'36 Hai Ba Trung', 3, 1, CAST(10.7768610000000000 AS Decimal(19, 16)), CAST(106.7046690000000000 AS Decimal(19, 16)), 33500, 210000, 10, NULL, 18, N'BYANb9b', N'khanhnhv@gmail.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (126, 67, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Hoàng Việt Khánh', N'01212365432', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 34000, 560000, 6, NULL, 5, N'Lv6qKmk', N'khanh@gmail.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (127, 70, 1, 1, NULL, NULL, NULL, NULL, N'Trần Thị Phượng', N'0912345672', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 34000, 820000, 10, NULL, 17, N'-$7UyqM', N'phuongtt@gmail.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (128, 68, 1, 1, NULL, NULL, NULL, NULL, N'Lâm Khánh', N'0954313656', N'319 Ly Thuong Kiet', 164, 13, CAST(10.7856830000000000 AS Decimal(19, 16)), CAST(106.6538360000000000 AS Decimal(19, 16)), 67000, 610000, 6, NULL, 15, N'L0M!niw', N'khanhlam@gmail.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (129, 69, 1, 1, NULL, NULL, NULL, NULL, N'Vũ Thu Phương', N'0913245367', N'145 Hung Vuong', 160, 12, CAST(10.7614730000000000 AS Decimal(19, 16)), CAST(106.6751860000000000 AS Decimal(19, 16)), 67000, 400000, 6, NULL, 7, N'@yaMP7e', N'phuongtv@tv.com', 2, 1, CAST(0x0000A19B00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (131, 69, 1, 1, NULL, NULL, NULL, NULL, N'Phạm Thị Dậu', N'0976543217', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), 34000, 320000, 6, NULL, 12, N'2XtobeM', N'dau@rung.vn', 2, 1, CAST(0x0000A19C00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (132, 69, 1, 1, NULL, NULL, NULL, NULL, N'lala', N'0987654321', N'145 Hung Vuong', 160, 12, CAST(10.7614730000000000 AS Decimal(19, 16)), CAST(106.6751860000000000 AS Decimal(19, 16)), 17000, 170000, 6, NULL, 7, N'9OdOzeg', N'aa@kk.ll', 2, 1, CAST(0x0000A19C00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (133, 70, 1, 1, NULL, NULL, NULL, NULL, N'hihi', N'01986543212', N'36 Hai Ba Trung', 3, 1, CAST(10.7768610000000000 AS Decimal(19, 16)), CAST(106.7046690000000000 AS Decimal(19, 16)), 34000, 90000, 10, NULL, 18, N'7op7JCk', N'eee@e.e', 2, 1, CAST(0x0000A19C00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (134, NULL, 1, 1, NULL, NULL, NULL, NULL, N'vin vin', N'0987909877', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), NULL, 320000, 1, NULL, 12, N'NhRkgCj', N'helo@ngaymoi.com', 2, 1, CAST(0x0000A19C00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (135, NULL, 1, 1, NULL, NULL, NULL, NULL, N'haha', N'0987654321', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), NULL, 15100000, 1, NULL, 17, N'CQJ2BYj', N'ee@gg.vv', 2, 1, CAST(0x0000A19C00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (136, 69, 1, 1, NULL, NULL, NULL, NULL, N'an', N'0912345678', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 33500, 220000, 6, NULL, 17, N'77REC2v', N'eee@d.a', 2, 1, CAST(0x0000A19D00000000 AS DateTime), CAST(0x0000A19E00000000 AS DateTime), NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (137, NULL, 1, 1, NULL, NULL, NULL, NULL, N'An Ngọc Anh', N'0979684939', N'36 Hai Ba Trung', 3, 1, CAST(10.7768610000000000 AS Decimal(19, 16)), CAST(106.7046690000000000 AS Decimal(19, 16)), NULL, 360000, 1, NULL, 18, N'nmfEOqi', N'enty@gmail.com', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (138, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Nguyễn Thị Yên Thịnh', N'0979684939', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), NULL, 340000, 1, NULL, 5, N'QVKHV$r', N'entynguyen2011@gmail.com', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (139, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Châu', N'01206103207', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), NULL, 110000, 1, NULL, 17, N'khMxBkz', N'enty@gmail.com', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (140, 73, 1, 1, NULL, NULL, NULL, NULL, N'Khánh', N'01219030503', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), 34000, 210000, 10, NULL, 12, N'_krDR61', N'aaa@a.a', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (141, NULL, 1, 1, NULL, NULL, NULL, NULL, N'phuong', N'01232123123', N'169 D1', 68, 6, CAST(10.8239560000000000 AS Decimal(19, 16)), CAST(106.7161800000000000 AS Decimal(19, 16)), NULL, 58000, 1, NULL, 16, N'9fGLsgv', N'lam@gmail.com', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (142, 74, 1, 1, NULL, NULL, NULL, NULL, N'test', N'0943212387', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 34000, 270000, 10, NULL, 9, N'2TZOme8', N'ooo@O.O', 2, 1, CAST(0x0000A19D00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (143, NULL, 1, 1, NULL, NULL, NULL, NULL, N'enty', N'01206103207', N'145 Hung Vuong', 160, 12, CAST(10.7614730000000000 AS Decimal(19, 16)), CAST(106.6751860000000000 AS Decimal(19, 16)), NULL, 82002, 1, NULL, 7, N'pPRPrFC', N'en@gmail.com', 2, 1, CAST(0x0000A19E00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (144, 72, 1, 1, NULL, NULL, NULL, NULL, N'Khánh', N'01219050305', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 34000, 52000, 10, NULL, 9, N'y0OVfvB', N'khanhnhv60566@fpt.edu.vn', 2, 1, CAST(0x0000A19F00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (145, 71, 1, 1, NULL, NULL, NULL, NULL, N'Enty Nguyễn', N'01219050305', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 34000, 12000, 10, NULL, 9, N'@M4rff@', N'khanhnhv60566@fpt.edu.vn', 2, 1, CAST(0x0000A19F00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (146, 71, 1, 1, NULL, NULL, NULL, NULL, N'Enty Nguyễn', N'01219050305', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 34000, 12000, 10, NULL, 9, N'Vae9pTM', N'khanhnhv60566@fpt.edu.vn', 2, 1, CAST(0x0000A19F00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (147, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Enty Nguyễn', N'01219050305', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), NULL, 52000, 1, NULL, 12, N'WTwokD@', N'khanhnhv60566@fpt.edu.vn', 2, 1, CAST(0x0000A19F00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (148, 75, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'79 To Hien Thanh', 105, 20, CAST(10.7721036000000000 AS Decimal(19, 16)), CAST(106.6601304000000000 AS Decimal(19, 16)), 67000, 60000000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF010337CA AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (149, 78, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'323A Minh Phung', 144, 2, CAST(10.7566402000000000 AS Decimal(19, 16)), CAST(106.6435414000000000 AS Decimal(19, 16)), 34000, 21880000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF010348FD AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (150, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'49 Hoa Binh', 73, 15, CAST(10.7696994000000000 AS Decimal(19, 16)), CAST(106.6336387000000000 AS Decimal(19, 16)), NULL, 26390002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF0103494C AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (151, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'246 Nguyen Hong Dao', 134, 16, CAST(10.7903305000000000 AS Decimal(19, 16)), CAST(106.6407680000000000 AS Decimal(19, 16)), NULL, 1430000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010349BC AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (152, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'66 Tran Binh Trong', 152, 2, CAST(10.7644485000000000 AS Decimal(19, 16)), CAST(106.6783020000000000 AS Decimal(19, 16)), NULL, 39662000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01034A15 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (153, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'65 Nguyen Chi Thanh', 14, 3, CAST(10.7606380000000000 AS Decimal(19, 16)), CAST(106.6726206000000000 AS Decimal(19, 16)), NULL, 40067001, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01034A86 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (154, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'324 Luy Ban Bich', 6, 17, CAST(10.7956005000000000 AS Decimal(19, 16)), CAST(106.6383042000000000 AS Decimal(19, 16)), NULL, 16732000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF0103567E AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (155, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'246 Nguyen Hong Dao', 119, 17, CAST(10.7903305000000000 AS Decimal(19, 16)), CAST(106.6407680000000000 AS Decimal(19, 16)), NULL, 17440002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010401D4 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (156, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'319 Ly Thuong Kiet', 164, 13, CAST(10.7928830000000000 AS Decimal(19, 16)), CAST(106.6533820000000000 AS Decimal(19, 16)), NULL, 26180001, 1, NULL, 15, N'4029420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF0104036B AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (157, 75, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 67000, 30000000, 10, NULL, 17, N'4129420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01040459 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (158, 75, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'10 Nguyen Bieu', 172, 12, CAST(10.7525822000000000 AS Decimal(19, 16)), CAST(106.6840964000000000 AS Decimal(19, 16)), 67000, 103000000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF01040467 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (159, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'49 Hoa Binh', 36, 7, CAST(10.7696994000000000 AS Decimal(19, 16)), CAST(106.6336387000000000 AS Decimal(19, 16)), NULL, 2810001, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010404C5 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (160, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'319 Ly Thuong Kiet', 164, 13, CAST(10.7928830000000000 AS Decimal(19, 16)), CAST(106.6533820000000000 AS Decimal(19, 16)), NULL, 1760002, 1, NULL, 15, N'4229420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF010405C2 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (161, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'141A02 Dang Van Ngu', 121, 9, CAST(10.7916820000000000 AS Decimal(19, 16)), CAST(106.6674860000000000 AS Decimal(19, 16)), NULL, 32684000, 1, NULL, 13, N'4329420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF010406AC AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (162, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'30 Quang Trung', 195, 15, CAST(10.8370470000000000 AS Decimal(19, 16)), CAST(106.6561910000000000 AS Decimal(19, 16)), NULL, 1884000, 1, NULL, 6, N'4429420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF01040738 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (163, 78, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 34000, 5684000, 10, NULL, 17, N'4429420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF0104077A AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (164, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'197 Au Co', 91, 5, CAST(10.7850600000000000 AS Decimal(19, 16)), CAST(106.6419847000000000 AS Decimal(19, 16)), NULL, 5328000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF0104078C AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (165, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'116 Nguyen Du', 66, 23, CAST(10.8263540000000000 AS Decimal(19, 16)), CAST(106.6864565000000000 AS Decimal(19, 16)), NULL, 31340002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010407CE AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (166, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, 14, N'4529420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF010408B3 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (167, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'30 Quang Trung', 195, 15, CAST(10.8370470000000000 AS Decimal(19, 16)), CAST(106.6561910000000000 AS Decimal(19, 16)), NULL, 13000000, 1, NULL, 6, N'4529420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF010408C1 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (168, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'60 Dong Nai', 32, 8, CAST(10.7782998000000000 AS Decimal(19, 16)), CAST(106.6632342000000000 AS Decimal(19, 16)), NULL, 2729002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010408CF AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (169, 76, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'323A Minh Phung', 179, 15, CAST(10.7566402000000000 AS Decimal(19, 16)), CAST(106.6435414000000000 AS Decimal(19, 16)), 34000, 77000000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF0104096E AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (170, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'452/1 Hong Bang', 154, 9, CAST(10.7544282000000000 AS Decimal(19, 16)), CAST(106.6416732000000000 AS Decimal(19, 16)), NULL, 4440000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF010409B0 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (171, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, 14, N'4629420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF010409ED AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (172, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'300 Ly Chinh Thang', 84, 8, CAST(10.7857430000000000 AS Decimal(19, 16)), CAST(106.6846840000000000 AS Decimal(19, 16)), NULL, 25392000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF010409F6 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (173, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'141A02 Dang Van Ngu', 121, 9, CAST(10.7916820000000000 AS Decimal(19, 16)), CAST(106.6674860000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, 13, N'4629420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF01040A5D AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (174, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'79 To Hien Thanh', 145, 9, CAST(10.7721036000000000 AS Decimal(19, 16)), CAST(106.6601304000000000 AS Decimal(19, 16)), NULL, 15690002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040A66 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (175, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'145 Hung Vuong', 160, 12, CAST(10.6429950000000000 AS Decimal(19, 16)), CAST(107.2446260000000000 AS Decimal(19, 16)), NULL, 15712001, 1, NULL, 7, N'4729420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF01040AF3 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (176, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'86 Le Hong Phong', 27, 14, CAST(10.7556170000000000 AS Decimal(19, 16)), CAST(106.6786279000000000 AS Decimal(19, 16)), NULL, 11380000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF01040B1D AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (177, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'49 Hoa Binh', 2, 8, CAST(10.7696994000000000 AS Decimal(19, 16)), CAST(106.6336387000000000 AS Decimal(19, 16)), NULL, 56470001, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040B5E AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (178, 76, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'230 Nguyen Trai', 149, 16, CAST(10.7564874000000000 AS Decimal(19, 16)), CAST(106.6765648000000000 AS Decimal(19, 16)), 34000, 12000000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF01040BFD AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (179, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'86 Le Hong Phong', 124, 1, CAST(10.7556170000000000 AS Decimal(19, 16)), CAST(106.6786279000000000 AS Decimal(19, 16)), NULL, 15512000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040C48 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (180, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'145 Hung Vuong', 160, 12, CAST(10.6429950000000000 AS Decimal(19, 16)), CAST(107.2446260000000000 AS Decimal(19, 16)), NULL, 42950001, 1, NULL, 7, N'4829420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF01040CA1 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (181, 76, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'145 Hung Vuong', 160, 12, CAST(10.6429950000000000 AS Decimal(19, 16)), CAST(107.2446260000000000 AS Decimal(19, 16)), 34000, 81000000, 10, NULL, 7, N'4829420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01040CCB AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (182, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'10 Nguyen Bieu', 28, 8, CAST(10.7525822000000000 AS Decimal(19, 16)), CAST(106.6840964000000000 AS Decimal(19, 16)), NULL, 15950002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040CD9 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (183, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'319 Ly Thuong Kiet', 164, 13, CAST(10.7928830000000000 AS Decimal(19, 16)), CAST(106.6533820000000000 AS Decimal(19, 16)), NULL, 60000000, 1, NULL, 15, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01040D24 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (184, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, 9, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF01040D2D AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (185, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), NULL, 54855002, 1, NULL, 12, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF01040D32 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (186, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'452/1 Hong Bang', 132, 1, CAST(10.7544282000000000 AS Decimal(19, 16)), CAST(106.6416732000000000 AS Decimal(19, 16)), NULL, 5000000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF01040D61 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (187, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'334 Cong Hoa', 86, 7, CAST(10.8021280000000000 AS Decimal(19, 16)), CAST(106.6454300000000000 AS Decimal(19, 16)), NULL, 888000, 0, NULL, 12, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF01040D99 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (188, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'145 Hung Vuong', 160, 12, CAST(10.6429950000000000 AS Decimal(19, 16)), CAST(107.2446260000000000 AS Decimal(19, 16)), NULL, 400000, 0, NULL, 7, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF01040D9E AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (189, 77, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'50 Han Hai Nguyen', 151, 19, CAST(10.7579575000000000 AS Decimal(19, 16)), CAST(106.6499786000000000 AS Decimal(19, 16)), 34000, 13000000, 10, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF01040DB0 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (190, 77, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'169 D1', 68, 6, CAST(10.8239560000000000 AS Decimal(19, 16)), CAST(106.7161800000000000 AS Decimal(19, 16)), 34000, 94000000, 10, NULL, 16, N'4929420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01040DE4 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (191, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'525 Nguyen Tri Phuong', 82, 3, CAST(10.7664162000000000 AS Decimal(19, 16)), CAST(106.6673648000000000 AS Decimal(19, 16)), NULL, 4800000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF01040DED AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (192, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'300 Ly Chinh Thang', 56, 12, CAST(10.7857430000000000 AS Decimal(19, 16)), CAST(106.6846840000000000 AS Decimal(19, 16)), NULL, 42500000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040E38 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (193, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'95 Nguyen Duy Duong', 118, 21, CAST(10.7593069000000000 AS Decimal(19, 16)), CAST(106.6712272000000000 AS Decimal(19, 16)), NULL, 1760002, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040E9F AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (194, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'25/5 Ngo Thoi Nhiem', 180, 8, CAST(10.7807924000000000 AS Decimal(19, 16)), CAST(106.6901207000000000 AS Decimal(19, 16)), NULL, 888000, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF01040F06 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (195, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'406A Cach Mang Thang 8', 139, 11, CAST(10.7833170000000000 AS Decimal(19, 16)), CAST(106.6711950000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, 14, N'5029420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF01040F4C AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (196, 77, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'347 Le Van Sy', 87, 7, CAST(10.7963540000000000 AS Decimal(19, 16)), CAST(106.6654770000000000 AS Decimal(19, 16)), 34000, 45000000, 10, NULL, 17, N'5029420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01040F51 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (197, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'136 Nguyen Cuu Dam', 108, 12, CAST(10.7985816000000000 AS Decimal(19, 16)), CAST(106.6312725000000000 AS Decimal(19, 16)), NULL, 24000000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 2, CAST(0x0000A1AF01040F5F AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (198, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'65 Hoa Hung', 128, 16, CAST(10.7795013000000000 AS Decimal(19, 16)), CAST(106.6752934000000000 AS Decimal(19, 16)), NULL, 1135000, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0x0000A1AF01040FA5 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (199, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'197 Au Co', 144, 21, CAST(10.7850600000000000 AS Decimal(19, 16)), CAST(106.6419847000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 3, CAST(0x0000A1AF0104101A AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (200, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'141A02 Dang Van Ngu', 121, 9, CAST(10.7916820000000000 AS Decimal(19, 16)), CAST(106.6674860000000000 AS Decimal(19, 16)), NULL, 5328000, 0, NULL, 13, N'5129420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF0104104D AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (201, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'141A02 Dang Van Ngu', 121, 9, CAST(10.7916820000000000 AS Decimal(19, 16)), CAST(106.6674860000000000 AS Decimal(19, 16)), NULL, 1625002, 1, NULL, 13, N'5129420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF0104105C AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (202, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), NULL, 5888000, 0, NULL, 9, N'5129420', N'KhanhNHV60566@fpt.edu.vn', 2, 3, CAST(0x0000A1AF0104108A AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (203, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'169 D1', 68, 6, CAST(10.8239560000000000 AS Decimal(19, 16)), CAST(106.7161800000000000 AS Decimal(19, 16)), NULL, 34000000, 1, NULL, 16, N'5229420', N'KhanhNHV60566@fpt.edu.vn', 2, 2, CAST(0x0000A1AF01041094 AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (204, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh Nguyen', N'01219050305', N'413 Hoang Van Thu', 83, 7, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), NULL, 25692000, 1, NULL, 5, N'5229420', N'KhanhNHV60566@fpt.edu.vn', 2, 1, CAST(0x0000A1AF010410A2 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[PriceCategory]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceCategory](
	[PriceCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[OrderId] [int] NULL,
	[StaffId] [int] NULL,
	[EditDate] [date] NULL,
	[PriceContent] [nvarchar](255) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[PriceTagId] [int] NULL,
 CONSTRAINT [PK__PriceCat__68DAA1A232AB8735] PRIMARY KEY CLUSTERED 
(
	[PriceCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PriceCategory] ON
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (37, CAST(34000 AS Decimal(18, 0)), 116, NULL, CAST(0xF7360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (38, CAST(34000 AS Decimal(18, 0)), 117, NULL, CAST(0xF7360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (39, CAST(67000 AS Decimal(18, 0)), 118, NULL, CAST(0xF7360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (41, CAST(67000 AS Decimal(18, 0)), 119, NULL, CAST(0xF7360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (42, CAST(67000 AS Decimal(18, 0)), 120, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (43, CAST(34000 AS Decimal(18, 0)), 121, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (44, CAST(34000 AS Decimal(18, 0)), 126, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (45, CAST(34000 AS Decimal(18, 0)), 122, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (46, CAST(67000 AS Decimal(18, 0)), 123, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (47, CAST(67000 AS Decimal(18, 0)), 128, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (48, CAST(67000 AS Decimal(18, 0)), 129, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (49, CAST(34000 AS Decimal(18, 0)), 131, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (50, CAST(17000 AS Decimal(18, 0)), 132, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 2 (1 đến 5kg) ', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 3)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (51, CAST(33500 AS Decimal(18, 0)), 136, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 2 (5 đến 20kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 4)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (52, CAST(34000 AS Decimal(18, 0)), 124, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (53, CAST(33500 AS Decimal(18, 0)), 125, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 2 (5 đến 20kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 4)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (54, CAST(34000 AS Decimal(18, 0)), 127, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (55, CAST(34000 AS Decimal(18, 0)), 133, NULL, CAST(0xF9360B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (56, CAST(34000 AS Decimal(18, 0)), 145, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (57, CAST(34000 AS Decimal(18, 0)), 146, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (58, CAST(34000 AS Decimal(18, 0)), 144, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (59, CAST(34000 AS Decimal(18, 0)), 140, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (60, CAST(34000 AS Decimal(18, 0)), 142, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (61, CAST(67000 AS Decimal(18, 0)), 148, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (62, CAST(67000 AS Decimal(18, 0)), 157, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (63, CAST(67000 AS Decimal(18, 0)), 158, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (5 đến 20 kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 2)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (64, CAST(34000 AS Decimal(18, 0)), 181, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (65, CAST(34000 AS Decimal(18, 0)), 178, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (66, CAST(34000 AS Decimal(18, 0)), 169, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (67, CAST(34000 AS Decimal(18, 0)), 196, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (68, CAST(34000 AS Decimal(18, 0)), 190, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (69, CAST(34000 AS Decimal(18, 0)), 189, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (70, CAST(34000 AS Decimal(18, 0)), 124, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (71, CAST(34000 AS Decimal(18, 0)), 149, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId], [PriceTagId]) VALUES (72, CAST(34000 AS Decimal(18, 0)), 163, NULL, CAST(0x0A370B00 AS Date), N'Giao hàng lần 1 (1 đến 5kg)', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', 1)
SET IDENTITY_INSERT [dbo].[PriceCategory] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsFragile] [bit] NOT NULL,
	[HasHighValue] [bit] NOT NULL,
	[Note] [ntext] NULL,
	[Price] [int] NULL,
	[ProductId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
 CONSTRAINT [PK__Item__727E838B367C1819] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (129, 116, 2, 0, 0, NULL, 200, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (130, 117, 1, 0, 0, NULL, 200, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (131, 117, 2, 0, 0, NULL, 0, 47, N'khánh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (132, 118, 1, 0, 0, NULL, 100, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (133, 118, 1, 0, 0, NULL, 0, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (134, 119, 1, 0, 0, NULL, 15, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (135, 119, 1, 0, 0, NULL, 0, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (136, 120, 2, 0, 0, NULL, 140, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (137, 120, 1, 0, 0, NULL, 0, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (138, 121, 2, 0, 0, NULL, 240, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (139, 121, 1, 0, 0, NULL, 0, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (140, 122, 3, 0, 0, NULL, 330, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (141, 123, 3, 0, 0, NULL, 210, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (142, 123, 1, 0, 0, NULL, 0, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (143, 123, 1, 0, 0, NULL, 110, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (144, 123, 1, 0, 0, NULL, 0, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (145, 124, 2, 0, 0, NULL, 410, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (146, 124, 1, 0, 0, NULL, 0, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (147, 124, 2, 0, 0, NULL, 120, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (148, 125, 1, 0, 0, NULL, 100, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (149, 125, 1, 0, 0, NULL, 0, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (150, 126, 3, 0, 0, NULL, 360, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (151, 126, 2, 0, 0, NULL, 0, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (152, 127, 1, 0, 0, NULL, 100, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (153, 127, 2, 0, 0, NULL, 0, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (154, 127, 1, 0, 0, NULL, 220, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (155, 128, 2, 0, 0, NULL, 60, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (156, 128, 1, 0, 0, NULL, 0, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (157, 128, 1, 0, 0, NULL, 500, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (158, 129, 2, 0, 0, NULL, 200, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (159, 129, 1, 0, 0, NULL, 0, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (160, 131, 1, 0, 0, NULL, 100, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (161, 131, 2, 0, 0, NULL, 0, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (162, 132, 1, 0, 0, NULL, 130, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (163, 132, 1, 0, 0, NULL, 0, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (164, 133, 3, 0, 0, NULL, 90, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (165, 134, 2, 0, 0, NULL, 200, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (166, 134, 1, 0, 0, NULL, 0, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (167, 135, 1, 0, 0, NULL, 100, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (168, 135, 1, 0, 0, NULL, 0, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (169, 136, 1, 0, 0, NULL, 100, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (170, 136, 1, 0, 0, NULL, 0, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (171, 137, 1, 0, 0, NULL, 240, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (172, 137, 2, 0, 0, NULL, 0, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (173, 138, 1, 0, 0, NULL, 240, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (174, 138, 2, 0, 0, NULL, 0, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (175, 139, 2, 0, 0, NULL, 60, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (176, 139, 1, 0, 0, NULL, 0, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (177, 140, 1, 0, 0, NULL, 110, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (178, 140, 1, 0, 0, NULL, 0, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (179, 141, 2, 0, 0, NULL, 24, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (180, 141, 2, 0, 0, NULL, 0, 47, N'khánh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (181, 141, 1, 0, 0, NULL, 4, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (182, 142, 1, 0, 0, NULL, 130, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (183, 142, 2, 0, 0, NULL, 0, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (184, 142, 1, 0, 0, NULL, 80, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (185, 142, 1, 0, 0, NULL, 0, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (186, 143, 2, 0, 0, NULL, 2, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (187, 143, 1, 0, 0, NULL, 10, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (188, 143, 1, 0, 0, NULL, 0, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (189, 143, 1, 0, 0, NULL, 12, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (190, 143, 1, 0, 0, NULL, 0, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (191, 144, 1, 0, 0, NULL, 10, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (192, 144, 1, 0, 0, NULL, 0, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (193, 144, 1, 0, 0, NULL, 12, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (194, 145, 1, 0, 0, NULL, 12, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (195, 146, 1, 0, 0, NULL, 12, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (196, 147, 1, 0, 0, NULL, 10, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (197, 147, 1, 0, 0, NULL, 0, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (198, 147, 1, 0, 0, NULL, 12, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (199, 148, 2, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (200, 149, 2, 0, 0, NULL, 2500000, 71, N'iPhone 3Gs', N'12 x 12 x 12 ', N'300 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (201, 149, 2, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (202, 149, 2, 0, 0, NULL, 4000000, 76, N'Blackberry', N'12 x 12 x 12', N'200 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (203, 150, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (204, 150, 1, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (205, 150, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (206, 150, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (207, 150, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (208, 150, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (209, 150, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (210, 150, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (211, 150, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (212, 150, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (213, 151, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (214, 151, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (215, 151, 1, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (216, 151, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (217, 151, 2, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (218, 151, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (219, 151, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (220, 151, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (221, 151, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (222, 151, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (223, 152, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (224, 152, 1, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (225, 152, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (226, 152, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (227, 152, 1, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (228, 152, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
GO
print 'Processed 100 total records'
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (229, 152, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (230, 152, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (231, 152, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (232, 152, 1, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (233, 152, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (234, 153, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (235, 153, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (236, 153, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (237, 153, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (238, 153, 2, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (239, 153, 1, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (240, 153, 1, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (241, 153, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (242, 153, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (243, 153, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (244, 153, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (245, 153, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (246, 153, 2, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (247, 154, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (248, 154, 1, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (249, 154, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (250, 154, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (251, 154, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (252, 154, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (253, 154, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (254, 154, 1, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (255, 154, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (256, 154, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (257, 154, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (258, 154, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (259, 154, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (260, 155, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (261, 155, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (262, 155, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (263, 155, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (264, 155, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (265, 155, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (266, 155, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (267, 155, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (268, 155, 1, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (269, 155, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (270, 155, 1, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (271, 155, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (272, 155, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (273, 156, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (274, 156, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (275, 156, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (276, 156, 1, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (277, 156, 2, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (278, 156, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (279, 156, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (280, 156, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (281, 156, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (282, 156, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (283, 156, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (284, 156, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (285, 157, 1, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (286, 158, 1, 0, 0, NULL, 17000000, 63, N'Dell Lattitude E6420', N'25 x 15 x 15 cm', N'2.89 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (287, 158, 2, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (288, 158, 2, 0, 0, NULL, 13000000, 70, N'HP DVX6', N'12x12x12', N'2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (289, 159, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (290, 159, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (291, 159, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (292, 159, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (293, 159, 1, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (294, 159, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (295, 159, 2, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (296, 159, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (297, 159, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (298, 159, 1, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (299, 159, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (300, 159, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (301, 159, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (302, 159, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (303, 159, 2, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (304, 159, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (305, 160, 2, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (306, 160, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (307, 160, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (308, 160, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (309, 160, 1, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (310, 160, 1, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (311, 160, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (312, 160, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (313, 160, 1, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (314, 160, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (315, 161, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (316, 161, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (317, 161, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (318, 161, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (319, 161, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (320, 161, 2, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (321, 161, 2, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (322, 161, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (323, 161, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (324, 161, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (325, 161, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (326, 161, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (327, 162, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (328, 162, 2, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (329, 162, 2, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
GO
print 'Processed 200 total records'
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (330, 162, 2, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (331, 162, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (332, 162, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (333, 162, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (334, 163, 1, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (335, 163, 1, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (336, 163, 2, 0, 0, NULL, 400000, 75, N'Nokia 1290', N'12 x 12 x 12', N'3 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (337, 164, 1, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (338, 164, 2, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (339, 165, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (340, 165, 1, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (341, 165, 1, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (342, 165, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (343, 165, 1, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (344, 165, 1, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (345, 165, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (346, 165, 2, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (347, 165, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (348, 165, 2, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (349, 165, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (350, 165, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (351, 165, 2, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (352, 167, 1, 0, 0, NULL, 13000000, 70, N'HP DVX6', N'12x12x12', N'2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (353, 168, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (354, 168, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (355, 168, 1, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (356, 168, 2, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (357, 168, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (358, 168, 1, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (359, 168, 2, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (360, 168, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (361, 168, 1, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (362, 168, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (363, 168, 1, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (364, 168, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (365, 168, 2, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (366, 169, 1, 0, 0, NULL, 21000000, 66, N'Sony Vaio Audi', N'5 x 15 x 15 cm', N'1.5 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (367, 169, 1, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (368, 169, 2, 0, 0, NULL, 13000000, 70, N'HP DVX6', N'12x12x12', N'2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (369, 170, 1, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (370, 172, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (371, 172, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (372, 172, 1, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (373, 172, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (374, 172, 1, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (375, 172, 2, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (376, 172, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (377, 172, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (378, 172, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (379, 172, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (380, 172, 2, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (381, 172, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (382, 174, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (383, 174, 1, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (384, 174, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (385, 174, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (386, 174, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (387, 174, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (388, 174, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (389, 174, 2, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (390, 174, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (391, 174, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (392, 175, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (393, 175, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (394, 175, 1, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (395, 175, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (396, 175, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (397, 175, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (398, 175, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (399, 175, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (400, 176, 1, 0, 0, NULL, 2500000, 71, N'iPhone 3Gs', N'12 x 12 x 12 ', N'300 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (401, 176, 2, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (402, 177, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (403, 177, 1, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (404, 177, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (405, 177, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (406, 177, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (407, 177, 2, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (408, 177, 1, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (409, 177, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (410, 177, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (411, 177, 2, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (412, 177, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (413, 177, 1, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (414, 177, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (415, 177, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (416, 177, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (417, 177, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (418, 177, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (419, 178, 1, 0, 0, NULL, 12000000, 69, N'Toshiba Sattelite', N'30x30x30', N'1.2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (420, 179, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (421, 179, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (422, 179, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (423, 179, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (424, 179, 2, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (425, 180, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (426, 180, 1, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (427, 180, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (428, 180, 1, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (429, 180, 1, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (430, 180, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
GO
print 'Processed 300 total records'
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (431, 180, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (432, 180, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (433, 180, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (434, 181, 1, 0, 0, NULL, 21000000, 66, N'Sony Vaio Audi', N'5 x 15 x 15 cm', N'1.5 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (435, 181, 2, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (436, 182, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (437, 182, 1, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (438, 182, 1, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (439, 182, 2, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (440, 182, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (441, 182, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (442, 182, 2, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (443, 182, 2, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (444, 183, 2, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (445, 185, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (446, 185, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (447, 185, 2, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (448, 185, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (449, 185, 1, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (450, 185, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (451, 185, 1, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (452, 185, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (453, 185, 2, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (454, 185, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (455, 186, 2, 0, 0, NULL, 2500000, 71, N'iPhone 3Gs', N'12 x 12 x 12 ', N'300 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (456, 187, 2, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (457, 188, 1, 0, 0, NULL, 400000, 75, N'Nokia 1290', N'12 x 12 x 12', N'3 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (458, 189, 1, 0, 0, NULL, 13000000, 70, N'HP DVX6', N'12x12x12', N'2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (459, 190, 2, 0, 0, NULL, 17000000, 63, N'Dell Lattitude E6420', N'25 x 15 x 15 cm', N'2.89 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (460, 190, 2, 0, 0, NULL, 30000000, 67, N'Alienware M14x', N'30 x 30 x 15', N'3.5kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (461, 191, 2, 0, 0, NULL, 400000, 75, N'Nokia 1290', N'12 x 12 x 12', N'3 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (462, 191, 1, 0, 0, NULL, 4000000, 76, N'Blackberry', N'12 x 12 x 12', N'200 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (463, 192, 2, 0, 0, NULL, 15000000, 9, N'laptop Dell', N'', N'3kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (464, 192, 1, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (465, 192, 1, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (466, 192, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (467, 192, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (468, 192, 1, 0, 0, NULL, 30000, 59, N'đĩa thủy tinh', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (469, 192, 2, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (470, 193, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (471, 193, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (472, 193, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (473, 193, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (474, 193, 2, 0, 0, NULL, 500000, 51, N'usb 3g', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (475, 193, 1, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (476, 193, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (477, 194, 2, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (478, 196, 1, 0, 0, NULL, 21000000, 66, N'Sony Vaio Audi', N'5 x 15 x 15 cm', N'1.5 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (479, 196, 2, 0, 0, NULL, 12000000, 69, N'Toshiba Sattelite', N'30x30x30', N'1.2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (480, 197, 2, 0, 0, NULL, 12000000, 69, N'Toshiba Sattelite', N'30x30x30', N'1.2 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (481, 198, 1, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (482, 198, 1, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (483, 198, 2, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (484, 198, 2, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (485, 198, 1, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (486, 198, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (487, 198, 2, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (488, 198, 2, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (489, 198, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (490, 200, 1, 0, 0, NULL, 4440000, 72, N'Samsung Galaxy S3', N'12 x 12 x 12 ', N'450 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (491, 200, 2, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (492, 201, 2, 0, 0, NULL, 110000, 12, N'Chân váy bút chì', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (493, 201, 1, 0, 0, NULL, 70000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (494, 201, 2, 0, 0, NULL, 150000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (495, 201, 1, 0, 0, NULL, 205000, 43, N'Langbiang', N'5 x 5 x 5 cm', N'2kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (496, 201, 2, 0, 0, NULL, 1, 47, N'enty', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (497, 201, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (498, 201, 2, 0, 0, NULL, 30000, 50, N'mouse Mitsumi', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (499, 201, 2, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (500, 201, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (501, 201, 2, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (502, 201, 2, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (503, 202, 2, 0, 0, NULL, 2500000, 71, N'iPhone 3Gs', N'12 x 12 x 12 ', N'300 gram')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (504, 202, 2, 0, 0, NULL, 444000, 73, N'Nokia 1280', N'12 x 12 x 12', N'3 tons')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (505, 203, 2, 0, 0, NULL, 17000000, 63, N'Dell Lattitude E6420', N'25 x 15 x 15 cm', N'2.89 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (506, 204, 2, 0, 0, NULL, 100000, 5, N'Shirt', N'M', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (507, 204, 2, 0, 0, NULL, 110000, 7, N'Shirt', N'L', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (508, 204, 1, 0, 0, NULL, 100000, 8, N'T-Shirt', N'M', N'')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (509, 204, 2, 0, 0, NULL, 12000000, 10, N'laptop HP', NULL, N'2,8 kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (510, 204, 2, 0, 0, NULL, 120000, 11, N'Váy in hoa', N'M', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (511, 204, 1, 0, 0, NULL, 200000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (512, 204, 1, 0, 0, NULL, 12000, 45, N'Conan', N'5 x 5 x 5 cn', N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (513, 204, 1, 0, 0, NULL, 50000, 49, N'đế quạt laptop', N'20 x 30 x 2 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (514, 204, 2, 0, 0, NULL, 40000, 52, N'usb 4gb', NULL, N'20g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (515, 204, 1, 0, 0, NULL, 130000, 53, N'usb 16 gb', NULL, N'30g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (516, 204, 1, 0, 0, NULL, 10000, 54, N'bộ lau chùi lap top', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (517, 204, 2, 0, 0, NULL, 50000, 55, N'túi chống xóc', NULL, N'100g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (518, 204, 1, 0, 0, NULL, 240000, 58, N'ly trẻ em', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (519, 204, 1, 0, 0, NULL, 50000, 60, N'đĩa hình chữ nhật', NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (520, 204, 1, 0, 0, NULL, 60000, 61, N'đĩa sứ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[Cargo]    Script Date: 04/29/2013 16:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[CargoColumn] [int] NULL,
	[PlanId] [int] NULL,
	[CargoType] [int] NULL,
	[RequestId] [int] NULL,
	[OrderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (1, NULL, NULL, 66, 0, 64, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (2, NULL, NULL, 66, 0, 65, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (3, NULL, NULL, 66, 0, 66, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (4, NULL, NULL, 66, 0, 67, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (5, NULL, NULL, 66, 0, 68, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (6, NULL, NULL, 66, 0, 69, NULL)
SET IDENTITY_INSERT [dbo].[Cargo] OFF
/****** Object:  Default [DF__aspnet_Ap__Appli__3493CFA7]    Script Date: 04/29/2013 16:19:29 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__395884C4]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__3A4CA8FD]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__3B40CD36]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__367C1819]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__3864608B]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__37703C52]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__3587F3E0]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__43D61337]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FKDistrict628970]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FKDistrict628970] FOREIGN KEY([CityProvinceId])
REFERENCES [dbo].[CityProvince] ([CityProvinceId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FKDistrict628970]
GO
/****** Object:  ForeignKey [FK__DeliveryM__Deliv__4D5F7D71]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[DeliveryMenInPlan]  WITH CHECK ADD FOREIGN KEY([DeliveryMenId])
REFERENCES [dbo].[DeliveryMen] ([DeliveryMenId])
GO
/****** Object:  ForeignKey [FK__DeliveryM__PlanI__46B27FE2]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[DeliveryMenInPlan]  WITH CHECK ADD  CONSTRAINT [FK__DeliveryM__PlanI__46B27FE2] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[DeliveryMenInPlan] CHECK CONSTRAINT [FK__DeliveryM__PlanI__46B27FE2]
GO
/****** Object:  ForeignKey [FKContact407943]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FKContact407943] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FKContact407943]
GO
/****** Object:  ForeignKey [FK__Product__Custome__489AC854]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Custome__489AC854] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Custome__489AC854]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__3E1D39E1]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__42E1EEFE]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__40058253]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__40F9A68C]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__41EDCAC5]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__3C34F16F]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__3D2915A8]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__3F115E1A]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FKWard334657]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FKWard334657] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FKWard334657]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__44CA3770]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__45BE5BA9]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FKCustomerAd699986]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd699986] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd699986]
GO
/****** Object:  ForeignKey [FKCustomerAd734436]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd734436] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd734436]
GO
/****** Object:  ForeignKey [FKCustomerAd999103]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd999103] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd999103]
GO
/****** Object:  ForeignKey [FK__Hub__HubCategory__503BEA1C]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD FOREIGN KEY([HubCategoryId])
REFERENCES [dbo].[HubCategory] ([HubCategoryId])
GO
/****** Object:  ForeignKey [FKHub419786]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub419786] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub419786]
GO
/****** Object:  ForeignKey [FKHub718903]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub718903] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub718903]
GO
/****** Object:  ForeignKey [FK__UserInfo__Custom__607251E5]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
/****** Object:  ForeignKey [FK__UserInfo__HubId__6166761E]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([HubId])
REFERENCES [dbo].[Hub] ([HubId])
GO
/****** Object:  ForeignKey [FKRequest241288]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest241288] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest241288]
GO
/****** Object:  ForeignKey [FKRequest484183]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest484183] FOREIGN KEY([CollectionAddressId])
REFERENCES [dbo].[CustomerAddress] ([CustomerAddressId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest484183]
GO
/****** Object:  ForeignKey [FK__Order__DeliveryT__59C55456]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__DeliveryT__59C55456] FOREIGN KEY([DeliveryTypeId])
REFERENCES [dbo].[DeliveryType] ([DeliveryTypeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__DeliveryT__59C55456]
GO
/****** Object:  ForeignKey [FK__Order__HubId__5AB9788F]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__HubId__5AB9788F] FOREIGN KEY([HubId])
REFERENCES [dbo].[Hub] ([HubId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__HubId__5AB9788F]
GO
/****** Object:  ForeignKey [FKOrder160108]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder160108] FOREIGN KEY([ReceiverAddressDistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder160108]
GO
/****** Object:  ForeignKey [FKOrder332980]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder332980] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder332980]
GO
/****** Object:  ForeignKey [FKOrder344193]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder344193] FOREIGN KEY([DeliveryOptionId])
REFERENCES [dbo].[DeliveryOption] ([DeliveryOptionId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder344193]
GO
/****** Object:  ForeignKey [FKOrder537128]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder537128] FOREIGN KEY([ReceiverAddressWardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder537128]
GO
/****** Object:  ForeignKey [FKOrder996545]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder996545] FOREIGN KEY([OrderPaymentTypeId])
REFERENCES [dbo].[OrderPaymentType] ([OrderPaymentTypeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder996545]
GO
/****** Object:  ForeignKey [FK__PriceCate__Order__6442E2C9]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[PriceCategory]  WITH CHECK ADD  CONSTRAINT [FK__PriceCate__Order__6442E2C9] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[PriceCategory] CHECK CONSTRAINT [FK__PriceCate__Order__6442E2C9]
GO
/****** Object:  ForeignKey [FK__PriceCate__Price__634EBE90]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[PriceCategory]  WITH CHECK ADD  CONSTRAINT [FK__PriceCate__Price__634EBE90] FOREIGN KEY([PriceTagId])
REFERENCES [dbo].[PriceTag] ([PriceTagId])
GO
ALTER TABLE [dbo].[PriceCategory] CHECK CONSTRAINT [FK__PriceCate__Price__634EBE90]
GO
/****** Object:  ForeignKey [FK__PriceCate__Staff__65370702]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[PriceCategory]  WITH CHECK ADD  CONSTRAINT [FK__PriceCate__Staff__65370702] FOREIGN KEY([StaffId])
REFERENCES [dbo].[TiktakStaff] ([StaffId])
GO
ALTER TABLE [dbo].[PriceCategory] CHECK CONSTRAINT [FK__PriceCate__Staff__65370702]
GO
/****** Object:  ForeignKey [FK__Item__OrderId__634EBE90]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK__Item__OrderId__634EBE90] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK__Item__OrderId__634EBE90]
GO
/****** Object:  ForeignKey [FK__Cargo__OrderId__6442E2C9]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [FK__Cargo__OrderId__6442E2C9] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [FK__Cargo__OrderId__6442E2C9]
GO
/****** Object:  ForeignKey [FK__Cargo__PlanId__690797E6]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [FK__Cargo__PlanId__690797E6] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [FK__Cargo__PlanId__690797E6]
GO
/****** Object:  ForeignKey [FK__Cargo__RequestId__662B2B3B]    Script Date: 04/29/2013 16:19:30 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [FK__Cargo__RequestId__662B2B3B] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [FK__Cargo__RequestId__662B2B3B]
GO

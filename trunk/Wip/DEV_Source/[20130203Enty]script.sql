USE [HDMS]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 04/01/2013 20:56:07 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 04/01/2013 20:55:45 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  Table [dbo].[TiktakStaff]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[CityProvince]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[DeliveryMen]    Script Date: 04/01/2013 20:56:03 ******/
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
SET IDENTITY_INSERT [dbo].[DeliveryMen] OFF
/****** Object:  Table [dbo].[DeliveryType]    Script Date: 04/01/2013 20:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryType](
	[DeliveryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryType] ON
INSERT [dbo].[DeliveryType] ([DeliveryTypeId], [DeliveryName]) VALUES (1, N'Normal')
INSERT [dbo].[DeliveryType] ([DeliveryTypeId], [DeliveryName]) VALUES (2, N'Fast')
SET IDENTITY_INSERT [dbo].[DeliveryType] OFF
/****** Object:  Table [dbo].[DeliveryOption]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[Plan]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (58, CAST(0x0000A191016926DA AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(8753.44 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (59, CAST(0x0000A1910169635D AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(16922.89 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (60, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(8753.44 AS Decimal(18, 2)), N'106.682571411133,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.686073303223,106.686088562012,106.686416625977,106.686500549316,106.686645507813,106.686782836914,106.687225341797,106.687393188477,106.687576293945,106.687850952148,106.687957763672,106.688095092773,106.688606262207,106.688812255859,106.689437866211,106.689735412598,106.690292358398,106.69051361084,106.691627502441,106.691123962402,106.690605163574,106.690093994141,106.689895629883,106.689544677734,106.689163208008,106.689079284668,106.688369750977,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.690780639648,106.690040588379,106.689208984375,106.689010620117,106.688751220703,106.688949584961,106.688903808594,106.689262390137,106.689102172852,106.688980102539,106.689193725586,106.688354492188,106.688789367676,106.689323425293,106.689613342285,106.68936920166,106.689109802246,106.68871307373,106.688690185547,106.688789367676,106.688903808594,106.688949584961,106.689086914063,106.68920135498,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682250976563,106.682472229004,106.682571411133', N'10.7663593292236,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7700567245483,10.7700777053833,10.7704248428345,10.7705097198486,10.7706737518311,10.7708206176758,10.7712984085083,10.7714824676514,10.7716798782349,10.7719764709473,10.7720899581909,10.7722415924072,10.7727909088135,10.7730083465576,10.7736864089966,10.7740116119385,10.7745981216431,10.7748346328735,10.7760457992554,10.7765045166016,10.7769784927368,10.7774515151978,10.7776327133179,10.7779541015625,10.7783012390137,10.7783737182617,10.7790269851685,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7835836410522,10.7842798233032,10.7850294113159,10.7851934432983,10.7854194641113,10.7856349945068,10.7856798171997,10.7860918045044,10.7862243652344,10.7863473892212,10.7865982055664,10.7874031066895,10.788197517395,10.7893238067627,10.7898864746094,10.790057182312,10.7902698516846,10.7905960083008,10.7906150817871,10.7907457351685,10.7909097671509,10.7909069061279,10.7911024093628,10.7913827896118,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7664680480957,10.7662677764893,10.7663593292236', N'10.7663593292236,10.7915821075439,10.7686891555786', N'10.7663593292236,10.7915821075439,10.7686891555786')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (61, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 1, CAST(9035.61 AS Decimal(18, 2)), N'106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682151794434,106.682258605957,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.685470581055,106.68579864502,106.686103820801,106.686386108398,106.686683654785,106.68701171875,106.687454223633,106.688301086426,106.688423156738,106.688522338867,106.688575744629,106.688941955566,106.689949035645,106.690208435059,106.690391540527,106.691055297852,106.691734313965,106.692344665527,106.692726135254,106.69295501709,106.694091796875,106.694175720215,106.695190429688,106.696670532227,106.697807312012,106.698043823242,106.69800567627,106.698051452637,106.698089599609,106.698112487793,106.698211669922,106.698364257813,106.698509216309,106.698638916016,106.698715209961,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.699035644531,106.700080871582,106.700164794922,106.701080322266,106.701965332031,106.702087402344,106.702186584473,106.70272064209,106.703315734863,106.703491210938,106.703491210938,106.703498840332,106.70352935791,106.703559875488,106.703605651855,106.703628540039,106.703674316406,106.703689575195,106.704345703125,106.70491027832,106.705467224121,106.706146240234,106.706176757813,106.706268310547,106.706253051758,106.706207275391,106.706207275391,106.706085205078,106.705993652344,106.704528808594,106.704246520996,106.70337677002,106.702415466309,106.701072692871,106.699226379395,106.698936462402,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.698707580566,106.698654174805,106.698608398438,106.698486328125,106.698318481445,106.698234558105,106.698181152344,106.698127746582,106.698043823242,106.697807312012,106.696670532227,106.695190429688,106.694175720215,106.694091796875,106.69295501709,106.692726135254,106.692344665527,106.691734313965,106.691055297852,106.690391540527,106.690208435059,106.689949035645,106.688941955566,106.688575744629,106.688522338867,106.688423156738,106.688301086426,106.687454223633,106.68701171875,106.686683654785,106.686386108398,106.686103820801,106.68579864502,106.685470581055,106.684547424316,106.684341430664,106.68431854248,106.683204650879,106.682647705078,106.682571411133,106.682472229004,106.682464599609,106.68229675293,106.681938171387,106.681762695313,106.681716918945,106.681625366211,106.681579589844,106.681533813477,106.681449890137,106.681419372559,106.681030273438,106.680458068848,106.680114746094,106.679794311523,106.67936706543,106.679321289063,106.678703308105,106.678268432617,106.67700958252,106.676361083984,106.676292419434,106.67601776123,106.675048828125,106.674743652344,106.67455291748,106.674545288086,106.674507141113,106.674430847168,106.674354553223,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786,10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133,106.674003601074,106.699104309082,106.699104309082,106.689224243164', N'10.7686891555786,10.77170753479,10.7663593292236,10.7686891555786,10.8186559677124,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (62, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(17527.55 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.694107055664,106.693336486816,106.692398071289,106.691955566406,106.690895080566,106.690742492676,106.690856933594,106.690689086914,106.69066619873,106.690788269043,106.690376281738,106.690361022949,106.690467834473,106.690582275391,106.69059753418,106.690650939941,106.690567016602,106.690551757813,106.690689086914,106.690818786621,106.690872192383,106.690460205078,106.690086364746,106.690147399902,106.689414978027,106.689498901367,106.689590454102,106.689674377441,106.689826965332,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786,10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133,106.674003601074,106.699104309082,106.699104309082,106.689224243164', N'10.7686891555786,10.77170753479,10.7663593292236,10.7686891555786,10.8186559677124,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (63, CAST(0x0000A19100000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(9035.61 AS Decimal(18, 2)), N'106.674003601074,106.674354553223,106.674293518066,106.674270629883,106.674270629883,106.674293518066,106.674354553223,106.674446105957,106.674499511719,106.67455291748,106.674743652344,106.675048828125,106.67601776123,106.676292419434,106.676361083984,106.67700958252,106.678268432617,106.678703308105,106.679321289063,106.67936706543,106.679794311523,106.680114746094,106.680458068848,106.681030273438,106.681213378906,106.681304931641,106.681442260742,106.681579589844,106.681747436523,106.681922912598,106.682006835938,106.682052612305,106.682136535645,106.682151794434,106.682258605957,106.682647705078,106.683204650879,106.68431854248,106.684341430664,106.684547424316,106.685470581055,106.68579864502,106.686103820801,106.686386108398,106.686683654785,106.68701171875,106.687454223633,106.688301086426,106.688423156738,106.688522338867,106.688575744629,106.688941955566,106.689949035645,106.690208435059,106.690391540527,106.691055297852,106.691734313965,106.692344665527,106.692726135254,106.69295501709,106.694091796875,106.694175720215,106.695190429688,106.696670532227,106.697807312012,106.698043823242,106.69800567627,106.698051452637,106.698089599609,106.698112487793,106.698211669922,106.698364257813,106.698509216309,106.698638916016,106.698715209961,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.699035644531,106.700080871582,106.700164794922,106.701080322266,106.701965332031,106.702087402344,106.702186584473,106.70272064209,106.703315734863,106.703491210938,106.703491210938,106.703498840332,106.70352935791,106.703559875488,106.703605651855,106.703628540039,106.703674316406,106.703689575195,106.704345703125,106.70491027832,106.705467224121,106.706146240234,106.706176757813,106.706268310547,106.706253051758,106.706207275391,106.706207275391,106.706085205078,106.705993652344,106.704528808594,106.704246520996,106.70337677002,106.702415466309,106.701072692871,106.699226379395,106.698936462402,106.698745727539,106.698799133301,106.698822021484,106.698829650879,106.698822021484,106.698707580566,106.698654174805,106.698608398438,106.698486328125,106.698318481445,106.698234558105,106.698181152344,106.698127746582,106.698043823242,106.697807312012,106.696670532227,106.695190429688,106.694175720215,106.694091796875,106.69295501709,106.692726135254,106.692344665527,106.691734313965,106.691055297852,106.690391540527,106.690208435059,106.689949035645,106.688941955566,106.688575744629,106.688522338867,106.688423156738,106.688301086426,106.687454223633,106.68701171875,106.686683654785,106.686386108398,106.686103820801,106.68579864502,106.685470581055,106.684547424316,106.684341430664,106.68431854248,106.683204650879,106.682647705078,106.682571411133,106.682472229004,106.682464599609,106.68229675293,106.681938171387,106.681762695313,106.681716918945,106.681625366211,106.681579589844,106.681533813477,106.681449890137,106.681419372559,106.681030273438,106.680458068848,106.680114746094,106.679794311523,106.67936706543,106.679321289063,106.678703308105,106.678268432617,106.67700958252,106.676361083984,106.676292419434,106.67601776123,106.675048828125,106.674743652344,106.67455291748,106.674545288086,106.674507141113,106.674430847168,106.674354553223,106.674003601074', N'10.7686891555786,10.7678270339966,10.7677783966064,10.7677202224731,10.767674446106,10.7676258087158,10.7675771713257,10.7675752639771,10.7676029205322,10.7676792144775,10.7676115036011,10.767523765564,10.7672243118286,10.7671394348145,10.7671175003052,10.7669172286987,10.7665271759033,10.7663927078247,10.7662029266357,10.766188621521,10.766056060791,10.7659587860107,10.7658519744873,10.7656755447388,10.7659015655518,10.766016960144,10.7661848068237,10.7663545608521,10.7665529251099,10.766770362854,10.7666864395142,10.7666511535645,10.7665815353394,10.7666101455688,10.7667322158813,10.7664289474487,10.7669668197632,10.7681674957275,10.7681884765625,10.7684106826782,10.7679843902588,10.7681646347046,10.7683305740356,10.7684011459351,10.7684450149536,10.7684278488159,10.7688846588135,10.7683000564575,10.7682247161865,10.7681856155396,10.7681722640991,10.7680521011353,10.768497467041,10.7686023712158,10.768684387207,10.7689647674561,10.7692260742188,10.7694549560547,10.7696161270142,10.7697010040283,10.7701644897461,10.7701988220215,10.7706079483032,10.7712068557739,10.7716274261475,10.7716569900513,10.771502494812,10.7713499069214,10.7712869644165,10.7712316513062,10.7711362838745,10.7711133956909,10.7711496353149,10.7711944580078,10.7712707519531,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.7720632553101,10.7731370925903,10.773232460022,10.7742557525635,10.7751893997192,10.7753276824951,10.7751960754395,10.7746906280518,10.7741537094116,10.7741298675537,10.774097442627,10.7740545272827,10.7740182876587,10.7739934921265,10.7739810943604,10.7739810943604,10.7739934921265,10.7740068435669,10.773401260376,10.7728681564331,10.7723560333252,10.7717332839966,10.77170753479,10.7716283798218,10.7714519500732,10.7708778381348,10.7707719802856,10.77077293396,10.770920753479,10.7710046768188,10.771014213562,10.7710437774658,10.7710847854614,10.7711591720581,10.7712802886963,10.7712993621826,10.7712984085083,10.7714033126831,10.7714939117432,10.7715864181519,10.7716903686523,10.771824836731,10.7718667984009,10.7718954086304,10.7719163894653,10.7718954086304,10.7718439102173,10.7717990875244,10.7717542648315,10.7716569900513,10.7716274261475,10.7712068557739,10.7706079483032,10.7701988220215,10.7701644897461,10.7697010040283,10.7696161270142,10.7694549560547,10.7692260742188,10.7689647674561,10.768684387207,10.7686023712158,10.768497467041,10.7680521011353,10.7681722640991,10.7681856155396,10.7682247161865,10.7683000564575,10.7688846588135,10.7684278488159,10.7684450149536,10.7684011459351,10.7683305740356,10.7681646347046,10.7679843902588,10.7684106826782,10.7681884765625,10.7681674957275,10.7669668197632,10.7664289474487,10.7663593292236,10.7662677764893,10.7662553787231,10.7661008834839,10.7657518386841,10.7656116485596,10.7656335830688,10.7656497955322,10.7656469345093,10.7656345367432,10.7655878067017,10.7655553817749,10.7656755447388,10.7658519744873,10.7659587860107,10.766056060791,10.766188621521,10.7662029266357,10.7663927078247,10.7665271759033,10.7669172286987,10.7671175003052,10.7671394348145,10.7672243118286,10.767523765564,10.7676115036011,10.7676792144775,10.7677431106567,10.7678022384644,10.7678327560425,10.7678270339966,10.7686891555786', N'106.674003601074,106.706176757813,106.682571411133', N'10.7686891555786,10.77170753479,10.7663593292236')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (64, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 4, CAST(17527.55 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.694107055664,106.693336486816,106.692398071289,106.691955566406,106.690895080566,106.690742492676,106.690856933594,106.690689086914,106.69066619873,106.690788269043,106.690376281738,106.690361022949,106.690467834473,106.690582275391,106.69059753418,106.690650939941,106.690567016602,106.690551757813,106.690689086914,106.690818786621,106.690872192383,106.690460205078,106.690086364746,106.690147399902,106.689414978027,106.689498901367,106.689590454102,106.689674377441,106.689826965332,106.689239501953,106.689224243164,106.689239501953,106.68920135498,106.689086914063,106.688949584961,106.688903808594,106.688789367676,106.688690185547,106.68871307373,106.689109802246,106.68936920166,106.689613342285,106.689582824707,106.689964294434,106.690078735352,106.690269470215,106.690460205078,106.690483093262,106.690780639648,106.691223144531,106.690803527832,106.690704345703,106.690635681152,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8029346466064,10.8030033111572,10.8031406402588,10.8031978607178,10.8033466339111,10.8024072647095,10.801118850708,10.8008852005005,10.8005952835083,10.8002681732178,10.8001089096069,10.799524307251,10.7987756729126,10.7980432510376,10.7973155975342,10.7968587875366,10.7967443466187,10.7964363098145,10.7961082458496,10.7954177856445,10.7950134277344,10.794942855835,10.7948980331421,10.7942428588867,10.7941102981567,10.7936382293701,10.7931089401245,10.7925987243652,10.7916870117188,10.7915849685669,10.7915821075439,10.7915849685669,10.7913827896118,10.7911024093628,10.7909069061279,10.7909097671509,10.7907457351685,10.7906150817871,10.7905960083008,10.7902698516846,10.790057182312,10.7898864746094,10.7898845672607,10.7895708084106,10.7894763946533,10.7893199920654,10.7891607284546,10.7891426086426,10.7888956069946,10.7885322570801,10.7879581451416,10.7877931594849,10.7876262664795,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.699104309082,106.689224243164', N'10.7686891555786,10.8186559677124,10.7915821075439')
INSERT [dbo].[Plan] ([PlanId], [CreatedDate], [CreatedByUserId], [FinishedDate], [Note], [StaffId], [PlanTypeId], [StartDate], [Status], [Distance], [SegmentsLongitude], [SegmentsLatitude], [WaypointsLongitude], [WaypointsLatitude]) VALUES (65, CAST(0x0000A18D00000000 AS DateTime), 1, NULL, NULL, NULL, 0, NULL, 3, CAST(16922.89 AS Decimal(18, 2)), N'106.674003601074,106.673049926758,106.673393249512,106.673789978027,106.673919677734,106.674331665039,106.674812316895,106.677314758301,106.677825927734,106.678688049316,106.67951965332,106.679672241211,106.679779052734,106.680229187012,106.680763244629,106.681343078613,106.681381225586,106.681411743164,106.681480407715,106.681549072266,106.681617736816,106.681747436523,106.681793212891,106.681846618652,106.681900024414,106.68278503418,106.683753967285,106.684074401855,106.684242248535,106.684883117676,106.686065673828,106.687255859375,106.688461303711,106.689102172852,106.68970489502,106.690795898438,106.691703796387,106.692825317383,106.693336486816,106.693778991699,106.694755554199,106.69556427002,106.695938110352,106.696029663086,106.696189880371,106.696640014648,106.697036743164,106.697509765625,106.697311401367,106.696983337402,106.696502685547,106.696060180664,106.695838928223,106.695953369141,106.695960998535,106.69605255127,106.696075439453,106.696144104004,106.696189880371,106.696365356445,106.696464538574,106.696586608887,106.697486877441,106.697814941406,106.697975158691,106.698135375977,106.69856262207,106.698669433594,106.699584960938,106.699661254883,106.700325012207,106.701438903809,106.701599121094,106.702651977539,106.702857971191,106.703506469727,106.703994750977,106.70484161377,106.706077575684,106.706657409668,106.70711517334,106.708122253418,106.709381103516,106.71061706543,106.711387634277,106.711433410645,106.711456298828,106.71150970459,106.711517333984,106.711547851563,106.711547851563,106.711555480957,106.711563110352,106.711563110352,106.711585998535,106.711624145508,106.711715698242,106.711837768555,106.712036132813,106.712158203125,106.712303161621,106.712066650391,106.711547851563,106.710922241211,106.710830688477,106.710578918457,106.710433959961,106.709533691406,106.708854675293,106.708168029785,106.707801818848,106.707092285156,106.706451416016,106.706184387207,106.706146240234,106.706115722656,106.705863952637,106.705833435059,106.705574035645,106.705360412598,106.70482635498,106.704643249512,106.704383850098,106.704132080078,106.704032897949,106.703742980957,106.702575683594,106.701751708984,106.701354980469,106.70068359375,106.699760437012,106.699378967285,106.699127197266,106.699104309082,106.698883056641,106.698623657227,106.698165893555,106.69792175293,106.697830200195,106.697830200195,106.697898864746,106.69792175293,106.697898864746,106.697891235352,106.697845458984,106.697578430176,106.697105407715,106.695922851563,106.695579528809,106.695449829102,106.69539642334,106.695236206055,106.695159912109,106.695106506348,106.695083618164,106.695053100586,106.695007324219,106.69499206543,106.69499206543,106.69499206543,106.694953918457,106.69603729248,106.696586608887,106.696464538574,106.696365356445,106.696189880371,106.696144104004,106.696075439453,106.69605255127,106.695960998535,106.695953369141,106.695838928223,106.69499206543,106.694709777832,106.694686889648,106.694526672363,106.694297790527,106.693840026855,106.693145751953,106.692977905273,106.692680358887,106.692413330078,106.692253112793,106.69197845459,106.691566467285,106.691253662109,106.691116333008,106.690742492676,106.69068145752,106.690559387207,106.690017700195,106.689628601074,106.689567565918,106.689300537109,106.689208984375,106.689102172852,106.689086914063,106.68871307373,106.688026428223,106.686805725098,106.685401916504,106.684211730957,106.683052062988,106.681945800781,106.681930541992,106.68189239502,106.681846618652,106.681793212891,106.681732177734,106.681640625,106.681549072266,106.681480407715,106.681419372559,106.681381225586,106.681358337402,106.681343078613,106.680763244629,106.680229187012,106.679779052734,106.679672241211,106.67951965332,106.678688049316,106.677825927734,106.677314758301,106.674812316895,106.674331665039,106.673919677734,106.673789978027,106.673393249512,106.673049926758,106.674003601074', N'10.7686891555786,10.7710027694702,10.7711744308472,10.7714395523071,10.7715129852295,10.7717552185059,10.7720594406128,10.7736330032349,10.7739572525024,10.7745189666748,10.7750864028931,10.7752523422241,10.7753639221191,10.7760553359985,10.7770709991455,10.7778978347778,10.7777633666992,10.7776985168457,10.7776336669922,10.7775993347168,10.7775821685791,10.7775974273682,10.7776184082031,10.7776556015015,10.7777223587036,10.7772645950317,10.7767362594604,10.7770233154297,10.7771806716919,10.7778196334839,10.7789468765259,10.7800512313843,10.7812099456787,10.7817945480347,10.7823534011841,10.7834548950195,10.7843494415283,10.7855024337769,10.7860336303711,10.7865190505981,10.7875604629517,10.7883710861206,10.7887344360352,10.7888336181641,10.7889919281006,10.7894735336304,10.7898769378662,10.7903718948364,10.7905435562134,10.790843963623,10.7912702560425,10.7916765213013,10.7918748855591,10.7926626205444,10.7928457260132,10.7942333221436,10.7945728302002,10.7956790924072,10.7960996627808,10.7990446090698,10.8006706237793,10.80260181427,10.8024892807007,10.8024587631226,10.802453994751,10.8024883270264,10.8026723861694,10.8027334213257,10.803092956543,10.8031244277954,10.8034038543701,10.8038187026978,10.8038415908813,10.8035774230957,10.8035163879395,10.8034038543701,10.8033695220947,10.8033132553101,10.8032169342041,10.8031797409058,10.8031444549561,10.8030757904053,10.8029870986938,10.8028774261475,10.8028450012207,10.8032922744751,10.8036603927612,10.8043146133423,10.8053035736084,10.8055267333984,10.8058443069458,10.8065547943115,10.8068189620972,10.8068418502808,10.8074684143066,10.8078498840332,10.8082685470581,10.8086385726929,10.8092060089111,10.8094778060913,10.8102550506592,10.8104915618896,10.8110733032227,10.8117647171021,10.8118705749512,10.8121700286865,10.8123407363892,10.8133163452148,10.8140354156494,10.8148775100708,10.815318107605,10.8160848617554,10.8168449401855,10.817271232605,10.8173398971558,10.8173751831055,10.8176794052124,10.8177156448364,10.8178701400757,10.8179922103882,10.8184928894043,10.8187408447266,10.8191261291504,10.8196020126343,10.8200340270996,10.8198862075806,10.8194456100464,10.8192415237427,10.8190956115723,10.8189115524292,10.818943977356,10.8188352584839,10.8186721801758,10.8186559677124,10.8185148239136,10.8182792663574,10.8178291320801,10.817440032959,10.8171367645264,10.8167419433594,10.8161334991455,10.8157205581665,10.8149290084839,10.814847946167,10.8144760131836,10.8139390945435,10.8132982254028,10.8118162155151,10.8114032745361,10.8112545013428,10.8110828399658,10.810450553894,10.8096580505371,10.8083019256592,10.8077831268311,10.8061027526855,10.805757522583,10.8055067062378,10.8053140640259,10.8044013977051,10.8028497695923,10.8026933670044,10.80260181427,10.8006706237793,10.7990446090698,10.7960996627808,10.7956790924072,10.7945728302002,10.7942333221436,10.7928457260132,10.7926626205444,10.7918748855591,10.7910165786743,10.7907342910767,10.7907114028931,10.7905492782593,10.7903184890747,10.7898235321045,10.7891407012939,10.7889833450317,10.7886848449707,10.7884168624878,10.7882518768311,10.7878789901733,10.7874956130981,10.7871446609497,10.7870121002197,10.7866430282593,10.7865762710571,10.7864561080933,10.7858953475952,10.7854719161987,10.7853651046753,10.7850980758667,10.7850294113159,10.7849340438843,10.7849225997925,10.7845697402954,10.7839050292969,10.7827558517456,10.7813348770142,10.7801332473755,10.7789669036865,10.7778520584106,10.777982711792,10.7780427932739,10.7780952453613,10.7781372070313,10.7781620025635,10.778172492981,10.7781553268433,10.7781171798706,10.7780590057373,10.7780046463013,10.7779026031494,10.7778978347778,10.7770709991455,10.7760553359985,10.7753639221191,10.7752523422241,10.7750864028931,10.7745189666748,10.7739572525024,10.7736330032349,10.7720594406128,10.7717552185059,10.7715129852295,10.7714395523071,10.7711744308472,10.7710027694702,10.7686891555786', N'106.674003601074,106.699104309082', N'10.7686891555786,10.8186559677124')
SET IDENTITY_INSERT [dbo].[Plan] OFF
/****** Object:  Table [dbo].[OrderPaymentType]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[HubCategory]    Script Date: 04/01/2013 20:56:03 ******/
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
SET IDENTITY_INSERT [dbo].[HubCategory] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'a4c43593-5652-421c-8be7-98836dcc9e95', N'Customer1', N'customer1', NULL, 0, CAST(0x0000A19300DB56E3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'f78373a2-598e-4c13-97ac-26349721a4e7', N'Hub1', N'hub1', NULL, 0, CAST(0x0000A18F01248BCE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'Staff1', N'staff1', NULL, 0, CAST(0x0000A19300E41986 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  Table [dbo].[DeliveryMenInPlan]    Script Date: 04/01/2013 20:56:03 ******/
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
SET IDENTITY_INSERT [dbo].[DeliveryMenInPlan] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 04/01/2013 20:56:03 ******/
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
	[IsPermanent] [bit] NULL,
	[ImageURL] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK__Product__B40CC6CD45F365D3] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (5, N'1', N'test', NULL, NULL, 20000, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (7, N'3534534', N'5345', NULL, N'345345.00', 34534, 1, 1, N'53454', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (8, N'1', N'test1', NULL, N'32.10', 200, 1, 1, N'21', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (9, NULL, N'Khanh', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (10, NULL, N'do con heo', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (11, NULL, N'Quan xi lip siu nhan', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (12, NULL, N'Quan xip siu nhan do', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (13, NULL, N'Bộ truyện Jindo', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (14, NULL, N'Harry Potter', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (15, NULL, N'Mật mã Tây Tạng', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (16, NULL, N'Bộ truyện Jindo', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (17, NULL, N'Harry Potter', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (18, NULL, N'Mật mã Tây Tạng', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (19, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (20, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (21, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (22, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (23, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (24, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (25, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (26, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (27, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (28, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (29, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (30, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (31, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (32, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (33, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (34, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (35, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (36, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (37, N'Book', N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (38, N'Book', N'Harry Potter', N'5 x 5 x 5 cm', N'250g', NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductCategory], [Name], [Size], [ProductWeight], [ProductPrice], [CustomerId], [IsPermanent], [ImageURL], [Active], [Description]) VALUES (39, N'Book', N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g', NULL, 1, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 04/01/2013 20:56:02 ******/
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
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'a4c43593-5652-421c-8be7-98836dcc9e95', N'YcvNfbgTcHgUhVENoIAb26qfEH8=', 1, N'5cVwxwUBqmd1liTqQTsMkQ==', NULL, N'KhanhNHV@fpt.edu.vn', N'khanhnhv@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A18F011EE618 AS DateTime), CAST(0x0000A19300DB56E3 AS DateTime), CAST(0x0000A18F011EE618 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'c3211ee8-239f-43d6-832a-5b31ae8ef791', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'R4Gk4cdzjAJOmHnxvvnd4nszBt8=', 1, N'/67zVbdF+tyq/v90RWFUwg==', NULL, N'KhanhNHV@fpt.edu.vn', N'khanhnhv@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A18F0121D1C0 AS DateTime), CAST(0x0000A19300E41986 AS DateTime), CAST(0x0000A18F0121D1C0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 04/01/2013 20:56:02 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 04/01/2013 20:56:03 ******/
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
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a4c43593-5652-421c-8be7-98836dcc9e95', N'8bde2e2d-05e1-49c9-a4b2-016bd0143df9')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dda6f972-8605-4860-af55-1ab2ffdb1aab', N'34852945-276a-4ed3-a976-1f39a6f4b3d6')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e', N'be78dcdc-8e8e-4946-8209-75bf3f2ee7c7')
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (3, 2, N'36/18 Trần Não', 126, 10, CAST(10.7992535000000000 AS Decimal(19, 16)), CAST(106.7334419000000000 AS Decimal(19, 16)), 0, NULL)
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[Hub]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (5, N'Shop & Go Hoang Van Thu', N'413 Hoang Van Thu', 154, 12, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (6, N'Shop & Go Quang Trung', N'30 Quang Trung', 154, 12, CAST(10.8370470000000000 AS Decimal(19, 16)), CAST(106.6561910000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (7, N'Shop & Go Hung Vuong', N'145 Hung Vuong', 154, 12, CAST(10.8002620000000000 AS Decimal(19, 16)), CAST(106.6610570000000000 AS Decimal(19, 16)), 1, 1)
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [HubCategoryId]) VALUES (9, N'Shop & Go Ly Thuong Kiet', N'120 Ly Thuong Kiet', 154, 12, CAST(10.7907310000000000 AS Decimal(19, 16)), CAST(106.6526130000000000 AS Decimal(19, 16)), 1, 1)
SET IDENTITY_INSERT [dbo].[Hub] OFF
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 04/01/2013 20:56:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 04/01/2013 20:56:07 ******/
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
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 04/01/2013 20:56:07 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 04/01/2013 20:55:55 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 04/01/2013 20:55:56 ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 04/01/2013 20:56:03 ******/
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
	[PricedDate] [date] NULL,
	[ApprovedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Request] ON
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (1, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, CAST(0x0000A11B0138393C AS DateTime), 6, 6, N'sgdfhrha sgs gsd gs dg s d', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (2, N'7e7359ae-92ca-4125-aef4-60423d5b7372', 3, 5, CAST(0x0000A11B01385BB4 AS DateTime), 2, 6, N'scsg gs ewwd scxz', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (3, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01387CFD AS DateTime), 2, 6, N'asdkljasdjasl jdlasj dlasj d', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (5, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, NULL, NULL, 0, N'dvfdsg dfg sdag dsaf', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (6, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 2, CAST(0x0000A11B01389FB1 AS DateTime), 2, 6, N'fgfhfhgjgh t hfgh gfh df', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (7, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 5, 7, CAST(0x0000A11B0138A48A AS DateTime), NULL, 4, N'sdf sgfd g df', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (8, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 6, 8, CAST(0x0000A11B01392918 AS DateTime), 2, 4, N'gdf gfdg fg', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (10, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01394349 AS DateTime), 2, 4, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (11, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 6, 8, CAST(0x0000A11B013946F0 AS DateTime), NULL, 10, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (16, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, CAST(0x0000A11B01394A0B AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (17, N'd850c11b-6e02-4a29-9044-684369503bdf', 3, 5, CAST(0x0000A11B01395A0A AS DateTime), NULL, 10, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (18, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, CAST(0x0000A11B01395DEB AS DateTime), NULL, 8, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (19, N'd850c11b-6e02-4a29-9044-684369503bdf', 1, 1, CAST(0x0000A11B01396142 AS DateTime), NULL, 8, N'A Customer Request', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (25, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 1, CAST(0x0000A11B013964BC AS DateTime), NULL, 8, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (26, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01396A1D AS DateTime), NULL, 8, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (27, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, CAST(0x0000A11B01396DBF AS DateTime), NULL, 8, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (29, N'd850c11b-6e02-4a29-9044-684369503bdf', 1, 9, CAST(0x0000A11B01396DBF AS DateTime), NULL, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (30, N'0de6ee0c-b356-4745-a893-d857137b7c5d', 7, 11, CAST(0x0000A1230112F488 AS DateTime), 6, 10, N'Transfer', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (31, N'0de6ee0c-b356-4745-a893-d857137b7c5d', 7, 10, CAST(0x0000A12301184531 AS DateTime), NULL, 10, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (32, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A12C00F0129F AS DateTime), NULL, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (33, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A12400BE8767 AS DateTime), NULL, 10, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (34, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A1230126D931 AS DateTime), NULL, 10, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (35, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 6, 8, CAST(0x0000A12400B49612 AS DateTime), NULL, 10, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (36, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 4, 6, CAST(0x0000A12400B90212 AS DateTime), 6, 6, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (37, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 5, 7, CAST(0x0000A12400BB721E AS DateTime), 6, 6, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (38, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 3, 10, CAST(0x0000A12400BD59AC AS DateTime), NULL, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (39, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 6, 11, CAST(0x0000A125017EAE20 AS DateTime), NULL, 2, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (40, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 8, 12, CAST(0x0000A12600EE83A7 AS DateTime), NULL, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (41, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A12C00CA1F4A AS DateTime), 3, 8, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (42, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 9, 13, CAST(0x0000A12C00E7D57D AS DateTime), 4, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (43, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, CAST(0x0000A12C00EDF395 AS DateTime), NULL, 4, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (44, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A12C00F14D60 AS DateTime), 5, 2, N'', NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (45, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A12C00F14D60 AS DateTime), NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (46, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A12C00F14D60 AS DateTime), NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (47, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A12C00F14D60 AS DateTime), NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (48, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A18E0168927E AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (49, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (50, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (51, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (52, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (53, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (54, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (55, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (56, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (57, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (58, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A18F016CBF47 AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (59, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (60, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (61, N'00000000-0000-0000-0000-000000000000', 1, 1, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (62, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A18F016FD26A AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note], [PricedDate], [ApprovedDate]) VALUES (63, N'00000000-0000-0000-0000-000000000000', 1, 1, CAST(0x0000A190009B2AD9 AS DateTime), NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
/****** Object:  Table [dbo].[UserInfo]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'Lazada Số 1', 1, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'Account Phương Nam 01', 9, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'kartorafuma', 8, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'TK Nhóm Mua số 01', 4, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'a4c43593-5652-421c-8be7-98836dcc9e95', N'Customer So 1', 1, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'Em gái có dái', 4, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd06a2987-f853-47eb-952c-cdd2782170d7', N'admin', NULL, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'Loan Phung Dre', 5, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'Nguyen Thanh Truc Dao', NULL, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'kartorafuma', 7, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'9f668001-713a-42d1-94aa-d9d7ed62ba52', N'Bao', 3, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'TK zalora số 01', 2, 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'Linh Nguyen Bá', 7, 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'kartorafuma', 3, 6)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId], [HubId]) VALUES (N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'TK Tiki số 01', 3, 1)
/****** Object:  Table [dbo].[Order]    Script Date: 04/01/2013 20:56:03 ******/
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
	[CreatedDate] [date] NULL,
	[ApprovedDate] [date] NULL,
	[RejectedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (4, 7, 2, 1, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Cao Thái Sơn', N'09888664421', N'185 Lê Quang Định', 70, 6, CAST(10.8085784000000000 AS Decimal(19, 16)), CAST(106.6944176000000000 AS Decimal(19, 16)), 15000, 175000, 11, N'sdf sdf ds ds', 1, N'123456', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (5, 8, 1, 2, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hoàng Vũ', N'09942533362', N'332 Trường Chinh', 86, 7, CAST(10.7977060000000000 AS Decimal(19, 16)), CAST(106.6443440000000000 AS Decimal(19, 16)), 12000, 23000, 11, N'ewt rt drg drg', 1, N'321', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (6, 8, 2, 1, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Thành Tín', N'0918428873', N'125 Thành Công', 102, 8, CAST(10.7937941707837180 AS Decimal(19, 16)), CAST(106.6315128211488200 AS Decimal(19, 16)), 15000, 275000, 11, N'af sf dsfdsf dsg', 1, N'111', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (7, 8, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hồ Hữu Tài', N'091 2334566', N'47 Lê Duẩn', 3, 1, CAST(10.7810242000000000 AS Decimal(19, 16)), CAST(106.6988700000000000 AS Decimal(19, 16)), 14000, 240000, 11, NULL, 1, N'212', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (9, 2, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hoàng Hữu Danh', N'0121388499', N'409/4 Nguyễn Oanh', 49, 5, CAST(10.8393967000000000 AS Decimal(19, 16)), CAST(106.6758406000000000 AS Decimal(19, 16)), 20000, 350000, 11, N'rewret re re g gfr', 1, N'999', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (10, 2, 2, 2, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hứa Trọng Bình', N'0122856209', N'1024 Xa Lộ HN', 36, 4, CAST(10.8166981225894790 AS Decimal(19, 16)), CAST(106.6978132089843700 AS Decimal(19, 16)), 25000, 0, 9, N'fd sgdsf dsf ', 1, N'888', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (11, 3, 2, 3, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Huỳnh Hữu Thịnh', N'093683659', N'85 Hòa Hưng', 152, 12, CAST(10.7794068000000000 AS Decimal(19, 16)), CAST(106.6749303000000000 AS Decimal(19, 16)), 30000, 12000, 9, N'efs fds fd f', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (12, 3, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Phan Nam Phương', N'0911223344', N'100 Nguyễn Tất Thành', 181, 14, CAST(10.7635787000000000 AS Decimal(19, 16)), CAST(106.7079099000000000 AS Decimal(19, 16)), 10000, 185000, 9, N'fds gdfg fdg dfg', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (13, 3, 2, 2, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hoàng Khương', N'0946328345', N'125 Kinh Dương Vương', 214, 16, CAST(10.7511128449225450 AS Decimal(19, 16)), CAST(106.6309334640016000 AS Decimal(19, 16)), 15000, 0, 9, N'g fdg dfs dg', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (14, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Lê Hoài Nam', N'0935253652', N'54 Thân Nhân Trung', 86, 7, CAST(10.8052786382176030 AS Decimal(19, 16)), CAST(106.6427944163940500 AS Decimal(19, 16)), 14000, 123000, 9, N'gf dgdf gdf g', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (21, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hoàng Như Hải', N'0914838589', N'163 Nguyễn Phạm Tuân', 212, 16, CAST(10.7540209000000000 AS Decimal(19, 16)), CAST(106.6418463000000000 AS Decimal(19, 16)), 25000, 2560000, 12, N' hgery hj zffxhy', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (26, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Đào Hồng Hạnh', N'0912435664', N'140 Lê Hồng Phong', 197, 15, CAST(10.7577048000000000 AS Decimal(19, 16)), CAST(106.6779864000000000 AS Decimal(19, 16)), 13000, 246000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (27, 16, 1, 1, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Phạm Thành Phát', N'0934563325', N'43 Trần Hưng Đạo', 6, 1, CAST(10.7656678842730230 AS Decimal(19, 16)), CAST(106.6931850135645200 AS Decimal(19, 16)), 12000, 145000, 1, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (28, 10, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tôn Trung Sơn', N'0912436363', N'135 Nguyễn Đình Chiểu', NULL, 11, CAST(10.7842954967687900 AS Decimal(19, 16)), CAST(106.6952640212402900 AS Decimal(19, 16)), 11000, 285000, 4, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (29, 10, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Napoleon', N'0935644487', N'48 Hoàng Diệu', NULL, 14, CAST(10.7615369146221320 AS Decimal(19, 16)), CAST(106.7011727592469000 AS Decimal(19, 16)), 20000, 145000, 13, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (30, 17, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Thanh Nhan', N'0934562642', N'83 Tran Hung Dao', NULL, 1, CAST(10.7640259702792510 AS Decimal(19, 16)), CAST(106.6915855392151100 AS Decimal(19, 16)), 15000, 145000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (31, 11, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Phan Hồng An', N'0914345343', N'215 Nguyễn Văn Cừ', NULL, 15, CAST(10.7610935000000000 AS Decimal(19, 16)), CAST(106.6833293000000000 AS Decimal(19, 16)), 25000, 250000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (32, 11, 1, 2, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tăng Minh Triết', N'0984356432', N'339 Nguyễn Văn Luông', 214, 16, CAST(10.7504000000000000 AS Decimal(19, 16)), CAST(106.6350000000000000 AS Decimal(19, 16)), 10000, 0, 3, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (33, 1, 1, 1, NULL, CAST(0x0000A11D00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Lê Kiều Như', N'0996433433', N'72 Calmette', 5, 1, CAST(10.7691316429754170 AS Decimal(19, 16)), CAST(106.6983822020995400 AS Decimal(19, 16)), 10000, 235000, 6, N'safsgdh dsf dsgewrt ear', NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (34, 1, 1, 1, NULL, CAST(0x0000A11D00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Lê Kiều Như', N'0994352266', N'32 Calmette', 5, 1, CAST(10.7667753000000000 AS Decimal(19, 16)), CAST(106.7002535000000000 AS Decimal(19, 16)), 12000, 235000, 6, N'sdhhg dsf sdf iosafo', NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (35, 19, 1, 1, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tăng Thanh Hà', N'0935637445', N'275 Nguyễn Chí Thanh', NULL, 15, CAST(10.7590558000000000 AS Decimal(19, 16)), CAST(106.6646462000000000 AS Decimal(19, 16)), NULL, 283000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (36, 19, 1, 2, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tuấn Hưng', N'0913534374', N'487 Bà Hạt', 157, 12, CAST(10.7646084203212360 AS Decimal(19, 16)), CAST(106.6626197640014200 AS Decimal(19, 16)), NULL, 0, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (37, 18, 1, 1, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Jennifer Phạm', N'0935216364', N'135 Nguyễn Oanh', NULL, 5, CAST(10.8269173000000000 AS Decimal(19, 16)), CAST(106.6798670000000000 AS Decimal(19, 16)), NULL, 275000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (38, 25, 1, 1, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Dương Thanh Long', N'0935363456', N'526 Lạc Long Quân', 171, 13, CAST(10.7810105734542900 AS Decimal(19, 16)), CAST(106.6501339598022500 AS Decimal(19, 16)), NULL, 175000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (39, 26, 1, 1, NULL, NULL, NULL, CAST(0x0000A11C00000000 AS DateTime), N'Đàm Vĩnh Hưng', N'0998386424', N'249 Bạch Đằng', NULL, 6, CAST(10.8031932000000000 AS Decimal(19, 16)), CAST(106.7063695000000000 AS Decimal(19, 16)), NULL, 250000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (40, 27, 1, 1, NULL, CAST(0x0000A12600000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Võ Hoài Nam', N'01235464433', N'325 Nguyễn Văn Trỗi', NULL, 9, CAST(10.7932811000000000 AS Decimal(19, 16)), CAST(106.6795734000000000 AS Decimal(19, 16)), 101, 248000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (41, 30, 2, 3, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tai Nguyen', N'01268794635', N'10 le hong phong', 199, 15, NULL, NULL, 50000, 0, 9, N'Transfer', 1, N'123432', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (42, 30, 2, 3, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Mrs Loc Nguyen', N'0199554667', N'125 Cách Mạng Tháng 8', 4, 1, CAST(10.7736149000000000 AS Decimal(19, 16)), CAST(106.6893804000000000 AS Decimal(19, 16)), 50000, 0, 7, N'ASAP', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (43, 30, 2, 3, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Kevin Pham Dinh', N'0996788547', N' 474 3 Tháng 2', 151, 12, CAST(10.7674175000000000 AS Decimal(19, 16)), CAST(106.6664904000000000 AS Decimal(19, 16)), 45000, 0, 7, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (44, 31, 2, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Huy Tran', N'0998213123', N'15 Lão Tử', 204, 15, CAST(10.7538216000000000 AS Decimal(19, 16)), CAST(106.6597517000000000 AS Decimal(19, 16)), 50000, 200000, 9, N'In day', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (45, 31, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Toan Do', N'01689996393', N'268, Tô Hiến Thành', NULL, 12, NULL, NULL, 67000, 570000, 3, N'in day', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (46, 34, 2, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hồ Hữu Tài', N'01687533843', N'16/14 Đường số 7', 15, 2, NULL, NULL, 45000, 200000, 3, N'Giao gấp !!!', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (47, 34, 2, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Nguyen Ba Linh', N'0244444444', N'16/14 To Ky', 52, 5, NULL, NULL, 99000, 1500000, 14, N':)', 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (48, 34, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Thanh Than', N'0998123432', N'3 lê tấn kế', 217, 16, CAST(10.7487507000000000 AS Decimal(19, 16)), CAST(106.6504991000000000 AS Decimal(19, 16)), 20000, 1575000, 3, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (49, 35, 1, 1, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Nhien Nguyen', N'01227682778', N'207, Tuy Lý Vương', NULL, 17, CAST(10.7427259000000000 AS Decimal(19, 16)), CAST(106.6526630000000000 AS Decimal(19, 16)), 27000, 1500000, 3, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (50, 35, 2, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Pan Huynh', N'0862574983', N'37 thanh thai', 151, 12, CAST(10.7715606000000000 AS Decimal(19, 16)), CAST(106.6654776000000000 AS Decimal(19, 16)), 15000, 245000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (51, 36, 2, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Johnny Deep', N'099-353-2210', N'18 ho thi ky', 156, 12, CAST(10.7635184000000000 AS Decimal(19, 16)), CAST(106.6776105000000000 AS Decimal(19, 16)), 15000, 1500000, 12, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (52, 36, 1, 1, NULL, CAST(0x0000A12D00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Thang Ngo', N'01231887127', N'47 Cong Quynh', 9, 1, CAST(10.7642257000000000 AS Decimal(19, 16)), CAST(106.6907055000000000 AS Decimal(19, 16)), 27000, 246700, 6, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (53, 36, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Pan Dut', N'01234567890', N'69 Vo Van Tan', 141, 11, CAST(10.7768928000000000 AS Decimal(19, 16)), CAST(106.6906464000000000 AS Decimal(19, 16)), 45000, 1500000, 6, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (54, 37, 2, 2, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Samuel Etto', N'08625004747', N'22 Tran Quang Dieu', 137, 11, CAST(10.7882279000000000 AS Decimal(19, 16)), CAST(106.6781848000000000 AS Decimal(19, 16)), 22000, 2200000, 6, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (55, 37, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tommy Teo`', N'0011474527', N'102 hoa lan', 115, 9, CAST(10.7972784000000000 AS Decimal(19, 16)), CAST(106.6894519000000000 AS Decimal(19, 16)), 111000, 1540000, 6, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (56, 37, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Steffany Loan', N'00922132881', N'17 Hoang Dieu', 118, 9, CAST(10.7962745000000000 AS Decimal(19, 16)), CAST(106.6714257000000000 AS Decimal(19, 16)), 20000, 500000, 6, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (57, 38, 2, 1, NULL, CAST(0x0000A13100000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Dinh Phuong Thuy', N'01228982929', N'17 dang huu pho', 124, 10, CAST(10.8032130000000000 AS Decimal(19, 16)), CAST(106.7351228000000000 AS Decimal(19, 16)), 47000, 250000, 11, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (58, 38, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Louis Nguyen', N'0123123123', N'45 luong dinh cua', 130, 10, CAST(10.7830929000000000 AS Decimal(19, 16)), CAST(106.7255666000000000 AS Decimal(19, 16)), 20000, 250000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (59, 33, 1, 2, NULL, CAST(0x0000A12D00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Linda Tran', N'234234234', N'3, Công Trường Mê Linh', 3, 1, CAST(10.7752718000000000 AS Decimal(19, 16)), CAST(106.7059095000000000 AS Decimal(19, 16)), 17000, 1000000, 3, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (60, 33, 1, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Frank Mai Ho', N'0988776654', N'15 huynh thuc khang', 3, 1, CAST(10.7734565000000000 AS Decimal(19, 16)), CAST(106.7033347000000000 AS Decimal(19, 16)), 22000, 2000000, 3, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (61, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Huy Dut', N'01234567890', N'211 hong bang', 200, 15, CAST(10.7558648000000000 AS Decimal(19, 16)), CAST(106.6657951000000000 AS Decimal(19, 16)), 18000, 2500000, 2, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (62, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Pan Huynh', N'0987654321', N'5 cao xuan duc', 228, 17, CAST(10.7468639000000000 AS Decimal(19, 16)), CAST(106.6597688000000000 AS Decimal(19, 16)), 22000, 25000, 12, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (63, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Chuong Nguyen Tan', N'08625774882', N'17 Han Hai Nguyen', 179, 13, CAST(10.7579251000000000 AS Decimal(19, 16)), CAST(106.6506997000000000 AS Decimal(19, 16)), 27000, 278000, 12, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (64, 40, 1, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Long Le', N'09877654567', N'25 tan thuan tay', 254, 19, CAST(10.7496128000000000 AS Decimal(19, 16)), CAST(106.7274680000000000 AS Decimal(19, 16)), 99000, 250000, 9, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (65, 40, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Phong Le', N'01127665431', N'53 tang bach ho', 64, 6, CAST(10.8145522000000000 AS Decimal(19, 16)), CAST(106.6701819000000000 AS Decimal(19, 16)), 99000, 150000, 13, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (66, 41, 1, 1, 16, CAST(0x0000A12E00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Trần Nhật Hoàng', N'0988767521', N'19 Trần Thiện Chánh', 152, 12, CAST(10.7708123000000000 AS Decimal(19, 16)), CAST(106.6710660000000000 AS Decimal(19, 16)), 150000, 150000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (67, 42, 1, 1, 16, CAST(0x0000A13500000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Tommy Hứa', N'0976543218', N'7 hồ thị kỷ', 156, 12, CAST(10.7651372000000000 AS Decimal(19, 16)), CAST(106.6770034000000000 AS Decimal(19, 16)), 88888, 227000, 11, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (68, 42, 2, 2, 16, CAST(0x0000A13400000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Frank De Ngô', N'0998288377', N'335 hùng vương', 196, 15, CAST(10.7579367000000000 AS Decimal(19, 16)), CAST(106.6697144000000000 AS Decimal(19, 16)), 89999999, 123123, 14, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (69, 43, 1, 1, NULL, CAST(0x0000A12400000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Trần Nhật Hoàng', N'01234567983', N'159, Lý Thường Kiệt', 174, 13, CAST(10.7627279000000000 AS Decimal(19, 16)), CAST(106.6602827000000000 AS Decimal(19, 16)), 88000, 250000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (70, 43, 2, 1, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Hồ Mạnh Đại', N'01234565432', N'335, Hùng Vương', 196, 15, CAST(10.7627279000000000 AS Decimal(19, 16)), CAST(106.6602827000000000 AS Decimal(19, 16)), 12000, 275000, 6, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (71, 32, 1, 1, NULL, CAST(0x0000A13600000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Trần Nhật Hoàng', N'01227665757', N'159, Lý Thường Kiệt', 174, 13, CAST(10.7627279000000000 AS Decimal(19, 16)), CAST(106.6602827000000000 AS Decimal(19, 16)), 40000, 100000, 4, NULL, 1, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (72, 32, 1, 2, NULL, CAST(0x0000A13100000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Nguyễn Quốc Vương', N'01233455676', N'335, Hùng Vương', 196, 15, CAST(10.7579367000000000 AS Decimal(19, 16)), CAST(106.6697144000000000 AS Decimal(19, 16)), 37000, 150000, 13, NULL, 1, N'', NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (73, 44, 1, 3, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, CAST(0x0000A11C00000000 AS DateTime), N'Vương Tất Khang', N'0909677355', N'1 Hồ Thị Kỷ', 156, 12, CAST(10.7651883000000000 AS Decimal(19, 16)), CAST(106.6769939000000000 AS Decimal(19, 16)), 22000, 25000, 6, N'Tiền đặt cọc', NULL, NULL, NULL, NULL, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (77, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'01219050305', N'54 Pham Huu Chi', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 54534, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, NULL, CAST(0x77360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (81, NULL, 1, 1, NULL, NULL, NULL, NULL, N'KHANH', N'01219050305', N'54 Pham Huu Chi', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 54534, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (82, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh', N'01219050305', N'54 Pham Huu Chi', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 54734, 1, NULL, NULL, NULL, N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (83, NULL, 1, 1, NULL, NULL, NULL, NULL, N'khanh', N'01219050305', N'54 Pham Huu Chi', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 54534, 1, NULL, 5, N'Fm9B8VL', N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (84, NULL, 1, 1, NULL, NULL, NULL, NULL, N'Khanh', N'01219050305', N'54 Pham Huu Chi', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 74534, 1, NULL, 5, N'AryVZcR', N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (85, NULL, 1, 1, NULL, NULL, NULL, NULL, N'khanh', N'01291029100', N'54 Pham Huu Ch', 1, 1, CAST(10.8230989000000000 AS Decimal(19, 16)), CAST(106.6296638000000000 AS Decimal(19, 16)), NULL, 40000, 1, NULL, 5, N'!sQZZPe', N'KhanhNHV60566@fpt.edu.vn', 1, 1, CAST(0xE2360B00 AS Date), NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (86, 47, 1, 1, NULL, NULL, NULL, NULL, N'Khanh', N'01219050305', N'45 Bà Lê Chân', 10, 1, NULL, NULL, NULL, 45000, 0, N'Không có chi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (87, 48, 1, 1, NULL, NULL, NULL, NULL, N'Khasnh', N'01219050405', N'145 Trần Quang Khải', 1, 1, NULL, NULL, 30000, 450000, 1, N'Khong co chi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (88, 48, 1, 1, NULL, NULL, NULL, NULL, N'Anh Vuong', N'01219050305', N'120 Nguyen Thi Minh Khai', 1, 1, NULL, NULL, NULL, 45000, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (89, 54, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (90, 54, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (91, 54, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (92, 55, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (93, 55, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (94, 55, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (95, 56, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (96, 56, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (97, 56, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (98, 57, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (99, 57, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (100, 57, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (101, 58, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (102, 58, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (103, 58, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (104, 59, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (105, 59, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (106, 59, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (107, 60, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (108, 60, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (109, 60, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (110, 62, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (111, 62, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (112, 62, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (113, 63, 1, 2, NULL, NULL, NULL, NULL, N'Vương Kim Long', N'0946328456', N'47 Nguyễn Chí Thanh', 196, 15, NULL, NULL, NULL, 60000, 1, N'Gọi điện trước khi giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (114, 63, 1, 2, NULL, NULL, NULL, NULL, N'Lương Sơn Dương', N'0946328456', N'45 Cộng Hòa', 84, 7, NULL, NULL, NULL, 60000, 1, N'Giao gấp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note], [HubId], [Passcode], [ReceiverMail], [DeliveryTypeId], [CustomerId], [CreatedDate], [ApprovedDate], [RejectedDate]) VALUES (115, 63, 1, 3, NULL, NULL, NULL, NULL, N'Đỗ Thu Hà', N'013344567', N'30 Lê Đức Thọ', 47, 5, NULL, NULL, NULL, 80000, 1, N'Giao vào buổi chiều', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[PriceCategory]    Script Date: 04/01/2013 20:56:03 ******/
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
 CONSTRAINT [PK__PriceCat__68DAA1A232AB8735] PRIMARY KEY CLUSTERED 
(
	[PriceCategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PriceCategory] ON
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId]) VALUES (1, CAST(20000 AS Decimal(18, 0)), NULL, NULL, CAST(0xED360B00 AS Date), N'Phi giao hang lan thu 1 ty', NULL)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId]) VALUES (2, CAST(500 AS Decimal(18, 0)), NULL, NULL, CAST(0xED360B00 AS Date), N'Phi giao hang lan thu 800', NULL)
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId]) VALUES (4, CAST(2000 AS Decimal(18, 0)), 98, NULL, CAST(0xEE360B00 AS Date), N'Phi giao hang lan thu 1 ty', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e')
INSERT [dbo].[PriceCategory] ([PriceCategoryId], [Price], [OrderId], [StaffId], [EditDate], [PriceContent], [UserId]) VALUES (5, CAST(10000 AS Decimal(18, 0)), 98, NULL, CAST(0xEE360B00 AS Date), N'Phi giao hang lan 2', N'0fc2489d-d1f4-422d-b5a6-4b2c56a35e7e')
SET IDENTITY_INSERT [dbo].[PriceCategory] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (10, 4, 1, 1, 0, N'adf afsd sf sd', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (11, 36, 1, 1, 0, N'adf afsd sf sd', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (12, 38, 2, 0, 0, N'f efdsgewt gertert er', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (16, 5, 2, 0, 0, N'e fr regt rh ty ut ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (17, 37, 2, 0, 0, N'e fr regt rh ty ut ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (18, 13, 1, 0, 1, N'df gh yj mjre', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (19, 34, 1, 0, 1, N'df gh yj mjre', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (21, 7, 2, 1, 0, N'màu xanh', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (22, 9, 1, 0, 1, N'chụp tai', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (23, 39, 4, 0, 0, N'màu vàng', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (24, 10, 2, 0, 1, N'sf df sdf sd f', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (25, 33, 2, 0, 0, N'ef dsfd sf s', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (26, 11, 1, 0, 1, N'se fdsf dsf ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (27, 12, 1, 0, 0, N'hình tam giác', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (28, 21, 1, 0, 1, N'Màu đỏ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (29, 26, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (30, 14, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (31, 27, 1, 0, 0, N'Xanh đen', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (32, 30, 1, 0, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (34, 28, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (35, 29, 2, 0, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (36, 31, 2, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (37, 32, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (38, 35, 2, 0, 0, N'Màu hồng phấn', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (39, 40, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (40, 6, 3, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (41, 41, 2, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (42, 41, 5, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (43, 42, 1, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (44, 42, 1, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (45, 41, 2, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (46, 43, 1, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (47, 44, 2, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (48, 44, 1, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (49, 45, 2, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (50, 45, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (51, 45, 12, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (52, 46, 2, 1, 1, N'Mau xanh', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (53, 46, 5, 1, 1, N'Mau xam', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (54, 47, 1, 1, 1, N'Dễ vỡ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (55, 47, 1, 1, 1, N'Dễ vỡ', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (56, 48, 2, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (57, 49, 10, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (58, 49, 2, 0, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (59, 50, 2, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (60, 50, 1, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (61, 51, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (62, 51, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (63, 52, 7, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (64, 53, 50, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (65, 54, 5, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (66, 54, 2, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (67, 55, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (68, 56, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (69, 57, 100, 1, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (70, 57, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (71, 58, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (72, 59, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (73, 60, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (74, 61, 10, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (75, 62, 5, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (76, 63, 1, 1, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (77, 64, 1, 0, 1, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (78, 64, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (79, 65, 10, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (80, 66, 2, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (81, 67, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (82, 68, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (83, 69, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (84, 70, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (85, 71, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (86, 72, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (87, 73, 1, 0, 0, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (88, 77, 0, 0, 0, NULL, 20000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (89, 77, 0, 0, 0, NULL, 34534, 7, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (90, 81, 1, 0, 0, NULL, 20000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (91, 81, 1, 0, 0, NULL, 34534, 7, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (92, 82, 1, 0, 0, NULL, 20000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (93, 82, 1, 0, 0, NULL, 34534, 7, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (94, 82, 1, 0, 0, NULL, 200, 8, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (95, 83, 1, 0, 0, NULL, 20000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (96, 83, 1, 0, 0, NULL, 34534, 7, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (97, 84, 2, 0, 0, NULL, 40000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (98, 84, 1, 0, 0, NULL, 34534, 7, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (99, 85, 2, 0, 0, NULL, 40000, 5, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (100, 87, 1, 1, 1, N'Khong co gi', NULL, 9, N'Khanh', N'100 x 200 x 300', N'350')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (101, 87, 3, 1, 1, N'Ngu nhu bo', NULL, 10, N'do con heo', N'100x200x300', N'450')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (103, 88, 2, 0, 1, N'Mac chiec quan xip nay se giup ban bay duoc vong quanh vu tru', NULL, 12, N'Quan xip siu nhan do', N'100x200x300', N'200 tan')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (104, 89, 1, 0, 1, N'59 Quyển', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (105, 90, 1, 0, 1, N'Màu đen', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (106, 91, 1, 0, 1, N'Tập 10', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (107, 92, 1, 0, 1, N'59 Quyển', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (108, 93, 1, 0, 1, N'Màu đen', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (109, 94, 1, 0, 1, N'Tập 10', 60000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (110, 95, 1, 0, 1, N'59 Quyển', 60000, NULL, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (111, 96, 1, 0, 1, N'Màu đen', 60000, NULL, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (112, 97, 1, 0, 1, N'Tập 10', 60000, NULL, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (113, 98, 1, 0, 1, N'59 Quyển', 60000, NULL, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (114, 99, 1, 0, 1, N'Màu đen', 60000, NULL, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (115, 100, 1, 0, 1, N'Tập 10', 60000, NULL, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
GO
print 'Processed 100 total records'
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (116, 101, 1, 0, 1, N'59 Quyển', 60000, NULL, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (117, 102, 1, 0, 1, N'Màu đen', 60000, NULL, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (118, 103, 1, 0, 1, N'Tập 10', 60000, NULL, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (119, 104, 1, 0, 1, N'59 Quyển', 60000, 28, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (120, 105, 1, 0, 1, N'Màu đen', 60000, 29, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (121, 107, 1, 0, 1, N'59 Quyển', 60000, 31, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (122, 108, 1, 0, 1, N'Màu đen', 60000, 32, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (123, 110, 1, 0, 1, N'59 Quyển', 60000, 34, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (124, 111, 1, 0, 1, N'Màu đen', 60000, 35, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (125, 112, 1, 0, 1, N'Tập 10', 60000, 36, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (126, 113, 1, 0, 1, N'59 Quyển', 60000, 37, N'Bộ truyện Jindo', N'25 x 15 x 25 cm', N'1 Kg')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (127, 114, 1, 0, 1, N'Màu đen', 60000, 38, N'Harry Potter', N'5 x 5 x 5 cm', N'250g')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Quantity], [IsFragile], [HasHighValue], [Note], [Price], [ProductId], [Name], [Size], [Weight]) VALUES (128, 115, 1, 0, 1, N'Tập 10', 60000, 39, N'Mật mã Tây Tạng', N'15 x 15 x 10 cm', N'500g')
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[Cargo]    Script Date: 04/01/2013 20:56:03 ******/
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
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (3, NULL, NULL, 10, 0, 7, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (4, NULL, NULL, 10, 0, 32, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (7, NULL, NULL, 14, 0, 38, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (9, NULL, NULL, 14, 0, 43, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (12, NULL, NULL, 19, 0, 41, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (13, NULL, NULL, 20, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (15, NULL, NULL, 22, 0, 38, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (18, NULL, NULL, 25, 0, 41, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (19, NULL, NULL, 26, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (20, NULL, NULL, 27, 0, 43, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (22, NULL, NULL, 29, 0, 18, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (23, NULL, NULL, 29, 0, 19, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (24, NULL, NULL, 29, 0, 25, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (25, NULL, NULL, 29, 0, 26, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (26, NULL, NULL, 29, 0, 27, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (28, NULL, NULL, 31, 0, 18, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (29, NULL, NULL, 32, 0, 19, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (30, NULL, NULL, 33, 0, 25, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (31, NULL, NULL, 34, 0, 26, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (32, NULL, NULL, 35, 0, 27, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (34, NULL, NULL, 41, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (35, NULL, NULL, 41, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (36, NULL, NULL, 41, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (37, NULL, NULL, 41, NULL, NULL, 53)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (38, NULL, NULL, 41, NULL, NULL, 73)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (39, NULL, NULL, 45, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (40, NULL, NULL, 46, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (41, NULL, NULL, 45, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (42, NULL, NULL, 46, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (43, NULL, NULL, 45, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (44, NULL, NULL, 46, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (45, NULL, NULL, 45, NULL, NULL, 53)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (46, NULL, NULL, 46, NULL, NULL, 53)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (47, NULL, NULL, 45, NULL, NULL, 73)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (48, NULL, NULL, 46, NULL, NULL, 73)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (49, NULL, NULL, 48, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (50, NULL, NULL, 48, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (51, NULL, NULL, 48, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (52, NULL, NULL, 50, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (53, NULL, NULL, 50, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (54, NULL, NULL, 50, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (55, NULL, NULL, 50, NULL, NULL, 53)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (56, NULL, NULL, 50, NULL, NULL, 73)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (57, NULL, NULL, 52, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (58, NULL, NULL, 52, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (59, NULL, NULL, 52, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (60, NULL, NULL, 54, NULL, NULL, 33)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (61, NULL, NULL, 54, NULL, NULL, 34)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (62, NULL, NULL, 54, NULL, NULL, 52)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (63, NULL, NULL, 56, NULL, NULL, 53)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (64, NULL, NULL, 56, NULL, NULL, 54)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (66, NULL, NULL, 58, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (67, NULL, NULL, 58, 0, 43, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (68, NULL, NULL, 59, 0, 41, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (70, NULL, NULL, 60, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (71, NULL, NULL, 60, 0, 43, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (73, NULL, NULL, 61, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (74, NULL, NULL, 62, 0, 41, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (75, NULL, NULL, 62, 0, 43, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (78, NULL, NULL, 63, 0, 42, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (79, NULL, NULL, 64, 0, 41, NULL)
INSERT [dbo].[Cargo] ([CargoId], [Address], [CargoColumn], [PlanId], [CargoType], [RequestId], [OrderId]) VALUES (80, NULL, NULL, 64, 0, 43, NULL)
SET IDENTITY_INSERT [dbo].[Cargo] OFF
/****** Object:  Default [DF__aspnet_Ap__Appli__6501FCD8]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__7DCDAAA2]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__351DDF8C]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__408F9238]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__1E3A7A34]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__6ABAD62E]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__6BAEFA67]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__6CA31EA0]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__7BE56230]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__7CD98669]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__3429BB53]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__3BCADD1B]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__4183B671]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__4277DAAA]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__11D4A34F]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__1D4655FB]    Script Date: 04/01/2013 20:56:02 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__69C6B1F5]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__23F3538A]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__22FF2F51]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__Cargo__OrderId__681373AD]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
/****** Object:  ForeignKey [FK__Cargo__PlanId__690797E6]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD  CONSTRAINT [FK__Cargo__PlanId__690797E6] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[Cargo] CHECK CONSTRAINT [FK__Cargo__PlanId__690797E6]
GO
/****** Object:  ForeignKey [FK__Cargo__RequestId__69FBBC1F]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
/****** Object:  ForeignKey [FKContact407943]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FKContact407943] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FKContact407943]
GO
/****** Object:  ForeignKey [FKCustomerAd699986]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd699986] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd699986]
GO
/****** Object:  ForeignKey [FKCustomerAd734436]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd734436] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd734436]
GO
/****** Object:  ForeignKey [FKCustomerAd999103]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd999103] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd999103]
GO
/****** Object:  ForeignKey [FK__DeliveryM__Deliv__45BE5BA9]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[DeliveryMenInPlan]  WITH CHECK ADD FOREIGN KEY([DeliveryMenId])
REFERENCES [dbo].[DeliveryMen] ([DeliveryMenId])
GO
/****** Object:  ForeignKey [FK__DeliveryM__PlanI__46B27FE2]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[DeliveryMenInPlan]  WITH CHECK ADD  CONSTRAINT [FK__DeliveryM__PlanI__46B27FE2] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[DeliveryMenInPlan] CHECK CONSTRAINT [FK__DeliveryM__PlanI__46B27FE2]
GO
/****** Object:  ForeignKey [FKDistrict628970]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FKDistrict628970] FOREIGN KEY([CityProvinceId])
REFERENCES [dbo].[CityProvince] ([CityProvinceId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FKDistrict628970]
GO
/****** Object:  ForeignKey [FK__Hub__HubCategory__56E8E7AB]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD FOREIGN KEY([HubCategoryId])
REFERENCES [dbo].[HubCategory] ([HubCategoryId])
GO
/****** Object:  ForeignKey [FKHub419786]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub419786] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub419786]
GO
/****** Object:  ForeignKey [FKHub718903]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub718903] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub718903]
GO
/****** Object:  ForeignKey [FK__Item__ProductId__662B2B3B]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK__Item__ProductId__662B2B3B] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK__Item__ProductId__662B2B3B]
GO
/****** Object:  ForeignKey [FKItem829908]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FKItem829908] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FKItem829908]
GO
/****** Object:  ForeignKey [FK__Order__DeliveryT__5D95E53A]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([DeliveryTypeId])
REFERENCES [dbo].[DeliveryType] ([DeliveryTypeId])
GO
/****** Object:  ForeignKey [FK__Order__HubId__5E8A0973]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([HubId])
REFERENCES [dbo].[Hub] ([HubId])
GO
/****** Object:  ForeignKey [FKOrder160108]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder160108] FOREIGN KEY([ReceiverAddressDistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder160108]
GO
/****** Object:  ForeignKey [FKOrder332980]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder332980] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder332980]
GO
/****** Object:  ForeignKey [FKOrder344193]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder344193] FOREIGN KEY([DeliveryOptionId])
REFERENCES [dbo].[DeliveryOption] ([DeliveryOptionId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder344193]
GO
/****** Object:  ForeignKey [FKOrder537128]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder537128] FOREIGN KEY([ReceiverAddressWardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder537128]
GO
/****** Object:  ForeignKey [FKOrder996545]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder996545] FOREIGN KEY([OrderPaymentTypeId])
REFERENCES [dbo].[OrderPaymentType] ([OrderPaymentTypeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder996545]
GO
/****** Object:  ForeignKey [FK__PriceCate__Order__6442E2C9]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[PriceCategory]  WITH CHECK ADD  CONSTRAINT [FK__PriceCate__Order__6442E2C9] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[PriceCategory] CHECK CONSTRAINT [FK__PriceCate__Order__6442E2C9]
GO
/****** Object:  ForeignKey [FK__PriceCate__Staff__65370702]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[PriceCategory]  WITH CHECK ADD  CONSTRAINT [FK__PriceCate__Staff__65370702] FOREIGN KEY([StaffId])
REFERENCES [dbo].[TiktakStaff] ([StaffId])
GO
ALTER TABLE [dbo].[PriceCategory] CHECK CONSTRAINT [FK__PriceCate__Staff__65370702]
GO
/****** Object:  ForeignKey [FK__Product__Custome__489AC854]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Custome__489AC854] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Custome__489AC854]
GO
/****** Object:  ForeignKey [FKRequest241288]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest241288] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest241288]
GO
/****** Object:  ForeignKey [FKRequest484183]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest484183] FOREIGN KEY([CollectionAddressId])
REFERENCES [dbo].[CustomerAddress] ([CustomerAddressId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest484183]
GO
/****** Object:  ForeignKey [FK__UserInfo__Custom__5BAD9CC8]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
/****** Object:  ForeignKey [FK__UserInfo__HubId__5CA1C101]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([HubId])
REFERENCES [dbo].[Hub] ([HubId])
GO
/****** Object:  ForeignKey [FKWard334657]    Script Date: 04/01/2013 20:56:03 ******/
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FKWard334657] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FKWard334657]
GO

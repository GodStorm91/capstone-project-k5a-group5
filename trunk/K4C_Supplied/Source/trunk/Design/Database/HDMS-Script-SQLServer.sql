declare @n char(1)
set @n = char(10)

declare @stmt nvarchar(max)

-- procedures
select @stmt = isnull( @stmt + @n, '' ) +
    'drop procedure [' + schema_name(schema_id) + '].[' + name + ']'
from sys.procedures


-- check constraints
select @stmt = isnull( @stmt + @n, '' ) +
'alter table [' + schema_name(schema_id) + '].[' + object_name( parent_object_id ) + ']    drop constraint [' + name + ']'
from sys.check_constraints

-- functions
select @stmt = isnull( @stmt + @n, '' ) +
    'drop function [' + schema_name(schema_id) + '].[' + name + ']'
from sys.objects
where type in ( 'FN', 'IF', 'TF' )

-- views
select @stmt = isnull( @stmt + @n, '' ) +
    'drop view [' + schema_name(schema_id) + '].[' + name + ']'
from sys.views

-- foreign keys
select @stmt = isnull( @stmt + @n, '' ) +
    'alter table [' + schema_name(schema_id) + '].[' + object_name( parent_object_id ) + '] drop constraint [' + name + ']'
from sys.foreign_keys

-- tables
select @stmt = isnull( @stmt + @n, '' ) +
    'drop table [' + schema_name(schema_id) + '].[' + name + ']'
from sys.tables

-- user defined types
select @stmt = isnull( @stmt + @n, '' ) +
    'drop type [' + schema_name(schema_id) + '].[' + name + ']'
from sys.types
where is_user_defined = 1


exec sp_executesql @stmt





USE [HDMS]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 12/19/2012 18:28:43 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 12/19/2012 18:28:45 ******/
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
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', NULL)
/****** Object:  Table [dbo].[OrderPaymentType]    Script Date: 12/19/2012 18:28:45 ******/
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
/****** Object:  Table [dbo].[DeliveryPlan]    Script Date: 12/19/2012 18:28:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryPlan](
	[DeliveryPlanId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[AssignedDeliveryStaffId] [uniqueidentifier] NULL,
	[FinishedDate] [datetime] NULL,
	[DeliveryPlanStatus] [int] NOT NULL,
	[Note] [ntext] NULL,
	[DeliveryOrder] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeliveryPlan] ON
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (5, CAST(0x0000A11B017652FA AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (6, CAST(0x0000A11B01776950 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'7e7359ae-92ca-4125-aef4-60423d5b7372', NULL, 3, NULL, NULL)
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (13, CAST(0x0000A11C01689E9B AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (15, CAST(0x0000A124016F8D8A AS DateTime), N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', NULL, 3, NULL, NULL)
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (16, CAST(0x0000A12C00E87AE7 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', NULL, 4, NULL, N'66,68,67')
INSERT [dbo].[DeliveryPlan] ([DeliveryPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [DeliveryPlanStatus], [Note], [DeliveryOrder]) VALUES (17, CAST(0x0000A12C011A8241 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', NULL, NULL, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DeliveryPlan] OFF
/****** Object:  Table [dbo].[DeliveryOption]    Script Date: 12/19/2012 18:28:45 ******/
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
/****** Object:  Table [dbo].[CollectionPlan]    Script Date: 12/19/2012 18:28:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionPlan](
	[CollectionPlanId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedByUserId] [uniqueidentifier] NOT NULL,
	[AssignedDeliveryStaffId] [uniqueidentifier] NULL,
	[FinishedDate] [datetime] NULL,
	[CollectionPlanStatus] [int] NOT NULL,
	[Note] [ntext] NULL,
	[CollectionOrder] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CollectionPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CollectionPlan] ON
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (1, CAST(0x0000A11B013B2FC1 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', NULL, 3, NULL, NULL)
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (2, CAST(0x0000A11B016F810B AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', NULL, 2, NULL, NULL)
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (3, CAST(0x0000A12C00CB93B7 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', NULL, 4, NULL, NULL)
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (4, CAST(0x0000A12C00E84278 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', NULL, 4, NULL, NULL)
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (5, CAST(0x0000A12C00F1F547 AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', NULL, 4, NULL, NULL)
INSERT [dbo].[CollectionPlan] ([CollectionPlanId], [CreatedDate], [CreatedByUserId], [AssignedDeliveryStaffId], [FinishedDate], [CollectionPlanStatus], [Note], [CollectionOrder]) VALUES (6, CAST(0x0000A12C0116365D AS DateTime), N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', NULL, 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CollectionPlan] OFF
/****** Object:  Table [dbo].[CityProvince]    Script Date: 12/19/2012 18:28:45 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 12/19/2012 18:28:45 ******/
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
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (1, N'Lazada Việt Nam', N'lazada.vn', N'0836265724', N'5yh7j2f', 1, N'asdasdasd')
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (2, N'Zalora Việt Nam', N'zalora.vn', N'08385137328', N'6uef23', 0, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (3, N'Tiki', N'tiki.vn', N'0838364448', N'43t43d', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (4, N'Công ty Nhóm Mua', N'nhommua.com', N'0838435732', N'6u238f', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (5, N'Website 123.vn', N'123.vn', N'0835682940', N'34t55g3', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (6, N'Website sendo.vn', N'sendo.vn', N'0838475564', N'4fn35k', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (7, N'Cửa hàng trái cây Bà Liễu', N'MrsLieuFruitStore', N'0862502451', N'HC200', 1, N'Delivery only in-day')
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (8, N'E fashion online', N'e-fashion.vn', N'0873456789', N'HJ2206', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (9, N'Phương Nam Book', N'phuongnambook.vn', N'(08) 3832 1849 - 3832 1848 - 3832 1846', N'HJ009', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 12/19/2012 18:28:45 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 12/19/2012 18:28:48 ******/
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
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd06a2987-f853-47eb-952c-cdd2782170d7', N'admin', N'admin', NULL, 0, CAST(0x0000A12A0128CD0B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'Baschoka', N'baschoka', NULL, 0, CAST(0x0000A12A012F4CEC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'binhhn', N'binhhn', NULL, 0, CAST(0x0000A100008A55F7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'daola', N'daola', NULL, 0, CAST(0x0000A12C00A9EA42 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'DaoNTT', N'daontt', NULL, 0, CAST(0x0000A12A0128636D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'DonalTrum', N'donaltrum', NULL, 0, CAST(0x0000A12A012C7404 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'Elcakislo', N'elcakislo', NULL, 0, CAST(0x0000A12A01300F74 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'kartora', N'kartora', NULL, 0, CAST(0x0000A123009FD70C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'KartoraFuma', N'kartorafuma', NULL, 0, CAST(0x0000A12A012AE7EC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd850c11b-6e02-4a29-9044-684369503bdf', N'lazada01', N'lazada01', NULL, 0, CAST(0x0000A11C00C42AE4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'LongDictica', N'longdictica', NULL, 0, CAST(0x0000A12A012E5800 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'nhommua01', N'nhommua01', NULL, 0, CAST(0x0000A11C00C76104 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'phuongnam01', N'phuongnam01', NULL, 0, CAST(0x0000A12C00BCFAA9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'cabd319c-8c36-4f50-a62f-06a43b3d44f1', N'taihh', N'taihh', NULL, 0, CAST(0x0000A12C00BBA6AC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'tandhd', N'tandhd', NULL, 0, CAST(0x0000A0FF011B343B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'tiki01', N'tiki01', NULL, 0, CAST(0x0000A11C00B2D928 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'vuph', N'vuph', NULL, 0, CAST(0x0000A0FC009709F2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'zalora01', N'zalora01', NULL, 0, CAST(0x0000A11C00A35930 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 12/19/2012 18:28:48 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'cabd319c-8c36-4f50-a62f-06a43b3d44f1', N'Hồ Hữu Tài', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'Huỳnh Ngọc Bình', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'Đỗ Hoàng Duy Tân', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'Lê Anh Đảo', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'Phan Hoàng Vũ', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'Lazada Số 1', 1)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'Account Phương Nam 01', 9)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'kartorafuma', 8)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'TK Nhóm Mua số 01', 4)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'Em gái có dái', 4)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'd06a2987-f853-47eb-952c-cdd2782170d7', N'admin', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'Loan Phung Dre', 5)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'Nguyen Thanh Truc Dao', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'kartorafuma', 7)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'TK zalora số 01', 2)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'Linh Nguyen Bá', 7)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'kartorafuma', 3)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'TK Tiki số 01', 3)
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 12/19/2012 18:28:49 ******/
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
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 12/19/2012 18:28:49 ******/
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
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'ebfef0f5-8396-49b4-b178-0fab38a75336', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd', N'Customer', N'customer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f', N'Delivery Staff', N'delivery staff', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7', N'Office Staff', N'office staff', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 12/19/2012 18:28:49 ******/
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
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 12/19/2012 18:28:49 ******/
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
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'TWVBRXcg4+rdfvyQYWBYImoPsBE=', 1, N'+qShE1yXVXGMB7EigL45Rw==', NULL, N'binhhn@tictac.vn', N'binhhn@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A1000084DC80 AS DateTime), CAST(0x0000A1000084DC80 AS DateTime), CAST(0x0000A1000084DC80 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'xynDSnyUZRXzreREvmr4Y2KuQvw=', 1, N'sRMayGVfqmtNKRkx/lw8bg==', NULL, N'daola@tictac.vn', N'daola@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A0FC000D0F5C AS DateTime), CAST(0x0000A12C00A9EA42 AS DateTime), CAST(0x0000A0FC000D0F5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd06a2987-f853-47eb-952c-cdd2782170d7', N'Rf3UTHk6eGyMnjipE6jmPhF/Sq4=', 1, N'Q3gOywf6M842G6dniIexZA==', NULL, N'kartora@gmail.com', N'kartora@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A12300931200 AS DateTime), CAST(0x0000A12A0128CD0B AS DateTime), CAST(0x0000A12300931200 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'QCo51b4iRvhspS/fdEaplCH9wiA=', 1, N'opZN0EylHqd9L7FbJ9k0Qg==', NULL, N'kartora@gmail.com', N'kartora@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A12300966978 AS DateTime), CAST(0x0000A1230096D478 AS DateTime), CAST(0x0000A12300966978 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'+TcMW7/y67VEsFdL2KqbpnjwrTo=', 1, N'MIcrb63qGGqtWDKjOnhPwQ==', NULL, N'kartora@gmail.com', N'kartora@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A1230096B478 AS DateTime), CAST(0x0000A12A0128636D AS DateTime), CAST(0x0000A1230096B478 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'Dlepx8QDwvOSlqerLJTZxKDfVcs=', 1, N'd1IAZDgttT/DJjDKem4Mmw==', NULL, N'kartora@gmail.com', N'kartora@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A12A012AE7EC AS DateTime), CAST(0x0000A12A012AE7EC AS DateTime), CAST(0x0000A12A012AE7EC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd850c11b-6e02-4a29-9044-684369503bdf', N'varKbjWfLvy/exu3okKJfuuFq4M=', 1, N'sR2GyywVRIPUUGL2ds8J4Q==', NULL, N'lazada01@lazada.vn', N'lazada01@lazada.vn', NULL, NULL, 1, 0, CAST(0x0000A10100ED67C8 AS DateTime), CAST(0x0000A11C00C42AE4 AS DateTime), CAST(0x0000A10100ED67C8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'wally9PQPvYCnU3H10WY6gYjwOg=', 1, N'eZwNns5B8rugeGhlrwyWzA==', NULL, N'LinhNB60153@fpt.edu.vn', N'linhnb60153@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A12A012C7404 AS DateTime), CAST(0x0000A12A012C7404 AS DateTime), CAST(0x0000A12A012C7404 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'gtDWJFdxN9StWXKoyvO1HZk68g4=', 1, N'skUtMjiIZM27Vde6ng446g==', NULL, N'LinhNB60153@fpt.edu.vn', N'linhnb60153@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A12A012E5800 AS DateTime), CAST(0x0000A12A012E5800 AS DateTime), CAST(0x0000A12A012E5800 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'YbrD2yRdiDNKOwVp3L/uyWNJZXk=', 1, N'nnFXoI2bifF9h4Xl9ipnJQ==', NULL, N'LinhNB60153@fpt.edu.vn', N'linhnb60153@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A12A012F4CEC AS DateTime), CAST(0x0000A12A012F4CEC AS DateTime), CAST(0x0000A12A01381F43 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'Md3NCSkfkU59iGzlg2vavxRwDMU=', 1, N'Dht+F8tQLLYHBl19VXNdaw==', NULL, N'LinhNB60153@fpt.edu.vn', N'linhnb60153@fpt.edu.vn', NULL, NULL, 1, 0, CAST(0x0000A12A01300F74 AS DateTime), CAST(0x0000A12A01300F74 AS DateTime), CAST(0x0000A12A01300F74 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'hFea+wXTn632NtnMEsXKowxrmFk=', 1, N'EP2go1Z410DNIua4IAT/sQ==', NULL, N'nhommua01@nhommua.com', N'nhommua01@nhommua.com', NULL, NULL, 1, 0, CAST(0x0000A11C00C76104 AS DateTime), CAST(0x0000A11C00C76104 AS DateTime), CAST(0x0000A11C00C76104 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'azKxqKEBPwhExl6HUhm7NxR7MjY=', 1, N'12hxEoBqd7FRVkKWajqUQA==', NULL, N'tandhd@tictac.vn', N'tandhd@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'JEFgssmMqlMjuRWlyCILY8/WdSo=', 1, N'z/4uX0WJioUh8Tp+LidVQw==', NULL, N'tiki01@tiki.vn', N'tiki01@tiki.vn', NULL, NULL, 1, 0, CAST(0x0000A11C00B2D928 AS DateTime), CAST(0x0000A11C00B2D928 AS DateTime), CAST(0x0000A11C00B2D928 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'YaCGmOxkEF3ipUCdDTTTH8nGJC8=', 1, N'PJdPKc9e9s1mDeLQc6X+XA==', NULL, N'trickyken+phuongnam01@gmail.com', N'trickyken+phuongnam01@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A12C00BCA87C AS DateTime), CAST(0x0000A12C00BCFAA9 AS DateTime), CAST(0x0000A12C00BCF1FE AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'cabd319c-8c36-4f50-a62f-06a43b3d44f1', N'u4Lb0SDVIYphWzCnE8j8Ta0/xho=', 1, N'wSxK5Jl7BwLXCQKL0wY6/A==', NULL, N'trickyken+taihh@gmail.com', N'trickyken+taihh@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A12C00BBA6AC AS DateTime), CAST(0x0000A12C00BBA6AC AS DateTime), CAST(0x0000A12C00BBA6AC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 3, CAST(0x0000A12C00BC43CE AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'SvRh0H9NcBZAb/uhjzAcV+7hYzM=', 1, N'vEnTqbtCmrpa9NN5hsjdrw==', NULL, N'vuph@tictac.vn', N'vuph@tictac.vn', NULL, NULL, 0, 0, CAST(0x0000A0FC000E31FC AS DateTime), CAST(0x0000A0FC000E31FC AS DateTime), CAST(0x0000A0FC000E31FC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'cRSR0bQQ8blKBFmgB6DYUCMZ51g=', 1, N'GbpdQ+DVCJs/6WSar0p4aw==', NULL, N'zalora01@zalora.vn', N'zalora01@zalora.vn', NULL, NULL, 1, 0, CAST(0x0000A11C00A35930 AS DateTime), CAST(0x0000A11C00A35930 AS DateTime), CAST(0x0000A11C00A35930 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 12/19/2012 18:28:49 ******/
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
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'ebfef0f5-8396-49b4-b178-0fab38a75336')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd06a2987-f853-47eb-952c-cdd2782170d7', N'ebfef0f5-8396-49b4-b178-0fab38a75336')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0557aaad-cb3f-42eb-96d4-d148a97058d3', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cabd319c-8c36-4f50-a62f-06a43b3d44f1', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'72a01cde-a2bd-4558-8c7c-7c1c244789dd', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'76d86a29-f587-4175-9a4a-7c3639e7824d', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'471a4c86-d6e2-43cd-a198-87dda1d8a04d', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2df53ed7-95ca-401f-8401-a2059eaacbb1', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd76b33c9-1f37-45de-a32c-d0bb444bdfe9', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0de6ee0c-b356-4745-a893-d857137b7c5d', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0a6ada34-0585-44d5-a31a-edb168b09c43', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e060c46a-dceb-4a0e-a7de-ee61d9741bd7', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c90d9c4d-e868-49c9-980a-f430f2bc595e', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'22f8899a-ee86-4bc0-b88d-fc5b9312eb53', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[Hub]    Script Date: 12/19/2012 18:28:49 ******/
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
PRIMARY KEY CLUSTERED 
(
	[HubId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hub] ON
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive]) VALUES (1, N'Head Quarter', N'107 Lê Hồng Phong', 154, 12, CAST(10.7687243311629000 AS Decimal(19, 16)), CAST(106.6740849566223200 AS Decimal(19, 16)), 1)
SET IDENTITY_INSERT [dbo].[Hub] OFF
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 12/19/2012 18:28:49 ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 12/19/2012 18:28:49 ******/
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
PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Request] ON
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (1, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, CAST(0x0000A11B0138393C AS DateTime), 6, 6, N'sgdfhrha sgs gsd gs dg s d')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (2, N'7e7359ae-92ca-4125-aef4-60423d5b7372', 3, 5, CAST(0x0000A11B01385BB4 AS DateTime), 2, 6, N'scsg gs ewwd scxz')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (3, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01387CFD AS DateTime), 2, 6, N'asdkljasdjasl jdlasj dlasj d')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (5, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, NULL, NULL, 0, N'dvfdsg dfg sdag dsaf')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (6, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 2, CAST(0x0000A11B01389FB1 AS DateTime), 2, 6, N'fgfhfhgjgh t hfgh gfh df')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (7, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 5, 7, CAST(0x0000A11B0138A48A AS DateTime), NULL, 2, N'sdf sgfd g df')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (8, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 6, 8, CAST(0x0000A11B01392918 AS DateTime), 2, 4, N'gdf gfdg fg')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (10, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01394349 AS DateTime), 2, 4, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (11, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 6, 8, CAST(0x0000A11B013946F0 AS DateTime), NULL, 10, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (16, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, CAST(0x0000A11B01394A0B AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (17, N'd850c11b-6e02-4a29-9044-684369503bdf', 3, 5, CAST(0x0000A11B01395A0A AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (18, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, CAST(0x0000A11B01395DEB AS DateTime), NULL, 1, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (19, N'd850c11b-6e02-4a29-9044-684369503bdf', 1, 1, CAST(0x0000A11B01396142 AS DateTime), NULL, 1, N'A Customer Request')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (25, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, CAST(0x0000A11B013964BC AS DateTime), NULL, 1, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (26, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A11B01396A1D AS DateTime), NULL, 1, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (27, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, CAST(0x0000A11B01396DBF AS DateTime), NULL, 1, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (29, N'd850c11b-6e02-4a29-9044-684369503bdf', 1, 9, NULL, NULL, 0, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (30, N'0de6ee0c-b356-4745-a893-d857137b7c5d', 7, 11, CAST(0x0000A1230112F488 AS DateTime), 6, 10, N'Transfer')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (31, N'0de6ee0c-b356-4745-a893-d857137b7c5d', 7, 10, CAST(0x0000A12301184531 AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (32, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A12C00F0129F AS DateTime), NULL, 2, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (33, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A12400BE8767 AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (34, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 1, 9, CAST(0x0000A1230126D931 AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (35, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 6, 8, CAST(0x0000A12400B49612 AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (36, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 4, 6, CAST(0x0000A12400B90212 AS DateTime), 6, 6, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (37, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 5, 7, CAST(0x0000A12400BB721E AS DateTime), 6, 6, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (38, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 3, 5, CAST(0x0000A12400BD59AC AS DateTime), NULL, 2, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (39, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 6, 8, CAST(0x0000A125017EAE20 AS DateTime), NULL, 2, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (40, N'0557aaad-cb3f-42eb-96d4-d148a97058d3', 8, 12, CAST(0x0000A12600EE83A7 AS DateTime), NULL, 2, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (41, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A12C00CA1F4A AS DateTime), 3, 8, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (42, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 9, 13, CAST(0x0000A12C00E7D57D AS DateTime), 4, 8, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (43, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, CAST(0x0000A12C00EDF395 AS DateTime), NULL, 10, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (44, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, CAST(0x0000A12C00F14D60 AS DateTime), 5, 6, N'')
SET IDENTITY_INSERT [dbo].[Request] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (4, 7, 2, 1, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, NULL, N'Cao Thái Sơn', N'09888664421', N'185 Lê Quang Định', 70, 6, CAST(10.8085784000000000 AS Decimal(19, 16)), CAST(106.6944176000000000 AS Decimal(19, 16)), 15000, 175000, 2, N'sdf sdf ds ds')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (5, 8, 1, 2, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Hoàng Vũ', N'09942533362', N'332 Trường Chinh', 86, 7, CAST(10.7977060000000000 AS Decimal(19, 16)), CAST(106.6443440000000000 AS Decimal(19, 16)), 12000, 23000, 4, N'ewt rt drg drg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (6, 8, 2, 1, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, NULL, N'Thành Tín', N'0918428873', N'125 Thành Công', 102, 8, CAST(10.7937941707837180 AS Decimal(19, 16)), CAST(106.6315128211488200 AS Decimal(19, 16)), 15000, 275000, 4, N'af sf dsfdsf dsg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (7, 8, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Hồ Hữu Tài', N'091 2334566', N'47 Lê Duẩn', 3, 1, CAST(10.7810242000000000 AS Decimal(19, 16)), CAST(106.6988700000000000 AS Decimal(19, 16)), 14000, 240000, 4, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (9, 2, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Hoàng Hữu Danh', N'0121388499', N'409/4 Nguyễn Oanh', 49, 5, CAST(10.8393967000000000 AS Decimal(19, 16)), CAST(106.6758406000000000 AS Decimal(19, 16)), 20000, 350000, 6, N'rewret re re g gfr')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (10, 2, 2, 2, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, NULL, N'Hứa Trọng Bình', N'0122856209', N'1024 Xa Lộ HN', 36, 4, CAST(10.8166981225894790 AS Decimal(19, 16)), CAST(106.6978132089843700 AS Decimal(19, 16)), 25000, 0, 6, N'fd sgdsf dsf ')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (11, 3, 2, 3, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, NULL, N'Huỳnh Hữu Thịnh', N'093683659', N'85 Hòa Hưng', 152, 12, CAST(10.7794068000000000 AS Decimal(19, 16)), CAST(106.6749303000000000 AS Decimal(19, 16)), 30000, 12000, 6, N'efs fds fd f')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (12, 3, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Phan Nam Phương', N'0911223344', N'100 Nguyễn Tất Thành', 181, 14, CAST(10.7635787000000000 AS Decimal(19, 16)), CAST(106.7079099000000000 AS Decimal(19, 16)), 10000, 185000, 6, N'fds gdfg fdg dfg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (13, 3, 2, 2, NULL, CAST(0x0000A11C00000000 AS DateTime), NULL, NULL, N'Hoàng Khương', N'0946328345', N'125 Kinh Dương Vương', 214, 16, CAST(10.7511128449225450 AS Decimal(19, 16)), CAST(106.6309334640016000 AS Decimal(19, 16)), 15000, 0, 6, N'g fdg dfs dg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (14, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Lê Hoài Nam', N'0935253652', N'54 Thân Nhân Trung', 86, 7, CAST(10.8052786382176030 AS Decimal(19, 16)), CAST(106.6427944163940500 AS Decimal(19, 16)), 14000, 123000, 6, N'gf dgdf gdf g')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (21, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Hoàng Như Hải', N'0914838589', N'163 Nguyễn Phạm Tuân', 212, 16, CAST(10.7540209000000000 AS Decimal(19, 16)), CAST(106.6418463000000000 AS Decimal(19, 16)), 25000, 2560000, 6, N' hgery hj zffxhy')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (26, 6, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Đào Hồng Hạnh', N'0912435664', N'140 Lê Hồng Phong', 197, 15, CAST(10.7577048000000000 AS Decimal(19, 16)), CAST(106.6779864000000000 AS Decimal(19, 16)), 13000, 246000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (27, 16, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Phạm Thành Phát', N'0934563325', N'43 Trần Hưng Đạo', 6, 1, CAST(10.7656678842730230 AS Decimal(19, 16)), CAST(106.6931850135645200 AS Decimal(19, 16)), 12000, 145000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (28, 10, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Tôn Trung Sơn', N'0912436363', N'135 Nguyễn Đình Chiểu', NULL, 11, CAST(10.7842954967687900 AS Decimal(19, 16)), CAST(106.6952640212402900 AS Decimal(19, 16)), 11000, 285000, 4, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (29, 10, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Napoleon', N'0935644487', N'48 Hoàng Diệu', NULL, 14, CAST(10.7615369146221320 AS Decimal(19, 16)), CAST(106.7011727592469000 AS Decimal(19, 16)), 20000, 145000, 4, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (30, 17, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Thanh Nhan', N'0934562642', N'83 Tran Hung Dao', NULL, 1, CAST(10.7640259702792510 AS Decimal(19, 16)), CAST(106.6915855392151100 AS Decimal(19, 16)), 15000, 145000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (31, 11, 1, 1, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Phan Hồng An', N'0914345343', N'215 Nguyễn Văn Cừ', NULL, 15, CAST(10.7610935000000000 AS Decimal(19, 16)), CAST(106.6833293000000000 AS Decimal(19, 16)), 25000, 250000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (32, 11, 1, 2, NULL, CAST(0x0000A11E00000000 AS DateTime), NULL, NULL, N'Tăng Minh Triết', N'0984356432', N'339 Nguyễn Văn Luông', 214, 16, CAST(10.7504000000000000 AS Decimal(19, 16)), CAST(106.6350000000000000 AS Decimal(19, 16)), 10000, 0, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (33, 1, 1, 1, NULL, CAST(0x0000A11D00000000 AS DateTime), NULL, NULL, N'Lê Kiều Như', N'0996433433', N'72 Calmette', 5, 1, CAST(10.7691316429754170 AS Decimal(19, 16)), CAST(106.6983822020995400 AS Decimal(19, 16)), 10000, 235000, 6, N'safsgdh dsf dsgewrt ear')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (34, 1, 1, 1, NULL, CAST(0x0000A11D00000000 AS DateTime), NULL, NULL, N'Lê Kiều Như', N'0994352266', N'32 Calmette', 5, 1, CAST(10.7667753000000000 AS Decimal(19, 16)), CAST(106.7002535000000000 AS Decimal(19, 16)), 12000, 235000, 6, N'sdhhg dsf sdf iosafo')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (35, 19, 1, 1, NULL, NULL, NULL, NULL, N'Tăng Thanh Hà', N'0935637445', N'275 Nguyễn Chí Thanh', NULL, 15, CAST(10.7590558000000000 AS Decimal(19, 16)), CAST(106.6646462000000000 AS Decimal(19, 16)), NULL, 283000, 1, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (36, 19, 1, 2, NULL, NULL, NULL, NULL, N'Tuấn Hưng', N'0913534374', N'487 Bà Hạt', 157, 12, CAST(10.7646084203212360 AS Decimal(19, 16)), CAST(106.6626197640014200 AS Decimal(19, 16)), NULL, 0, 1, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (37, 18, 1, 1, NULL, NULL, NULL, NULL, N'Jennifer Phạm', N'0935216364', N'135 Nguyễn Oanh', NULL, 5, CAST(10.8269173000000000 AS Decimal(19, 16)), CAST(106.6798670000000000 AS Decimal(19, 16)), NULL, 275000, 1, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (38, 25, 1, 1, NULL, NULL, NULL, NULL, N'Dương Thanh Long', N'0935363456', N'526 Lạc Long Quân', 171, 13, CAST(10.7810105734542900 AS Decimal(19, 16)), CAST(106.6501339598022500 AS Decimal(19, 16)), NULL, 175000, 1, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (39, 26, 1, 1, NULL, NULL, NULL, NULL, N'Đàm Vĩnh Hưng', N'0998386424', N'249 Bạch Đằng', NULL, 6, CAST(10.8031932000000000 AS Decimal(19, 16)), CAST(106.7063695000000000 AS Decimal(19, 16)), NULL, 250000, 1, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (40, 27, 1, 1, NULL, CAST(0x0000A12600000000 AS DateTime), NULL, NULL, N'Võ Hoài Nam', N'01235464433', N'325 Nguyễn Văn Trỗi', NULL, 9, CAST(10.7932811000000000 AS Decimal(19, 16)), CAST(106.6795734000000000 AS Decimal(19, 16)), 101, 248000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (41, 30, 2, 3, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, NULL, N'Tai Nguyen', N'01268794635', N'10 le hong phong', 199, 15, NULL, NULL, 50000, 0, 7, N'Transfer')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (42, 30, 2, 3, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, NULL, N'Mrs Loc Nguyen', N'0199554667', N'125 Cách Mạng Tháng 8', 4, 1, CAST(10.7736149000000000 AS Decimal(19, 16)), CAST(106.6893804000000000 AS Decimal(19, 16)), 50000, 0, 7, N'ASAP')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (43, 30, 2, 3, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Kevin Pham Dinh', N'0996788547', N' 474 3 Tháng 2', 151, 12, CAST(10.7674175000000000 AS Decimal(19, 16)), CAST(106.6664904000000000 AS Decimal(19, 16)), 45000, 0, 7, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (44, 31, 2, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Huy Tran', N'0998213123', N'15 Lão Tử', 204, 15, CAST(10.7538216000000000 AS Decimal(19, 16)), CAST(106.6597517000000000 AS Decimal(19, 16)), 50000, 200000, 3, N'In day')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (45, 31, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Toan Do', N'01689996393', N'268, Tô Hiến Thành', NULL, 12, NULL, NULL, 67000, 570000, 3, N'in day')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (46, 34, 2, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Hồ Hữu Tài', N'01687533843', N'16/14 Đường số 7', 15, 2, NULL, NULL, 45000, 200000, 3, N'Giao gấp !!!')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (47, 34, 2, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Nguyen Ba Linh', N'0244444444', N'16/14 To Ky', 52, 5, NULL, NULL, 99000, 1500000, 3, N':)')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (48, 34, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Thanh Than', N'0998123432', N'3 lê tấn kế', 217, 16, CAST(10.7487507000000000 AS Decimal(19, 16)), CAST(106.6504991000000000 AS Decimal(19, 16)), 20000, 1575000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (49, 35, 1, 1, NULL, CAST(0x0000A12A00000000 AS DateTime), NULL, NULL, N'Nhien Nguyen', N'01227682778', N'207, Tuy Lý Vương', NULL, 17, CAST(10.7427259000000000 AS Decimal(19, 16)), CAST(106.6526630000000000 AS Decimal(19, 16)), 27000, 1500000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (50, 35, 2, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Pan Huynh', N'0862574983', N'37 thanh thai', 151, 12, CAST(10.7715606000000000 AS Decimal(19, 16)), CAST(106.6654776000000000 AS Decimal(19, 16)), 15000, 245000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (51, 36, 2, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Johnny Deep', N'099-353-2210', N'18 ho thi ky', 156, 12, CAST(10.7635184000000000 AS Decimal(19, 16)), CAST(106.6776105000000000 AS Decimal(19, 16)), 15000, 1500000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (52, 36, 1, 1, NULL, CAST(0x0000A12D00000000 AS DateTime), NULL, NULL, N'Thang Ngo', N'01231887127', N'47 Cong Quynh', 9, 1, CAST(10.7642257000000000 AS Decimal(19, 16)), CAST(106.6907055000000000 AS Decimal(19, 16)), 27000, 246700, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (53, 36, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Pan Dut', N'01234567890', N'69 Vo Van Tan', 141, 11, CAST(10.7768928000000000 AS Decimal(19, 16)), CAST(106.6906464000000000 AS Decimal(19, 16)), 45000, 1500000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (54, 37, 2, 2, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, NULL, N'Samuel Etto', N'08625004747', N'22 Tran Quang Dieu', 137, 11, CAST(10.7882279000000000 AS Decimal(19, 16)), CAST(106.6781848000000000 AS Decimal(19, 16)), 22000, 2200000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (55, 37, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Tommy Teo`', N'0011474527', N'102 hoa lan', 115, 9, CAST(10.7972784000000000 AS Decimal(19, 16)), CAST(106.6894519000000000 AS Decimal(19, 16)), 111000, 1540000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (56, 37, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Steffany Loan', N'00922132881', N'17 Hoang Dieu', 118, 9, CAST(10.7962745000000000 AS Decimal(19, 16)), CAST(106.6714257000000000 AS Decimal(19, 16)), 20000, 500000, 6, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (57, 38, 2, 1, NULL, CAST(0x0000A13100000000 AS DateTime), NULL, NULL, N'Dinh Phuong Thuy', N'01228982929', N'17 dang huu pho', 124, 10, CAST(10.8032130000000000 AS Decimal(19, 16)), CAST(106.7351228000000000 AS Decimal(19, 16)), 47000, 250000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (58, 38, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Louis Nguyen', N'0123123123', N'45 luong dinh cua', 130, 10, CAST(10.7830929000000000 AS Decimal(19, 16)), CAST(106.7255666000000000 AS Decimal(19, 16)), 20000, 250000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (59, 33, 1, 2, NULL, CAST(0x0000A12D00000000 AS DateTime), NULL, NULL, N'Linda Tran', N'234234234', N'3, Công Trường Mê Linh', 3, 1, CAST(10.7752718000000000 AS Decimal(19, 16)), CAST(106.7059095000000000 AS Decimal(19, 16)), 17000, 1000000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (60, 33, 1, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Frank Mai Ho', N'0988776654', N'15 huynh thuc khang', 3, 1, CAST(10.7734565000000000 AS Decimal(19, 16)), CAST(106.7033347000000000 AS Decimal(19, 16)), 22000, 2000000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (61, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Huy Dut', N'01234567890', N'211 hong bang', 200, 15, CAST(10.7558648000000000 AS Decimal(19, 16)), CAST(106.6657951000000000 AS Decimal(19, 16)), 18000, 2500000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (62, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Pan Huynh', N'0987654321', N'5 cao xuan duc', 228, 17, CAST(10.7468639000000000 AS Decimal(19, 16)), CAST(106.6597688000000000 AS Decimal(19, 16)), 22000, 25000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (63, 39, 1, 1, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Chuong Nguyen Tan', N'08625774882', N'17 Han Hai Nguyen', 179, 13, CAST(10.7579251000000000 AS Decimal(19, 16)), CAST(106.6506997000000000 AS Decimal(19, 16)), 27000, 278000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (64, 40, 1, 2, NULL, CAST(0x0000A12B00000000 AS DateTime), NULL, NULL, N'Long Le', N'09877654567', N'25 tan thuan tay', 254, 19, CAST(10.7496128000000000 AS Decimal(19, 16)), CAST(106.7274680000000000 AS Decimal(19, 16)), 99000, 250000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (65, 40, 1, 1, NULL, CAST(0x0000A12C00000000 AS DateTime), NULL, NULL, N'Phong Le', N'01127665431', N'53 tang bach ho', 64, 6, CAST(10.8145522000000000 AS Decimal(19, 16)), CAST(106.6701819000000000 AS Decimal(19, 16)), 99000, 150000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (66, 41, 1, 1, 16, CAST(0x0000A12E00000000 AS DateTime), NULL, NULL, N'Trần Nhật Hoàng', N'0988767521', N'19 Trần Thiện Chánh', 152, 12, CAST(10.7708123000000000 AS Decimal(19, 16)), CAST(106.6710660000000000 AS Decimal(19, 16)), 150000, 150000, 11, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (67, 42, 1, 1, 16, CAST(0x0000A13500000000 AS DateTime), NULL, NULL, N'Tommy Hứa', N'0976543218', N'7 hồ thị kỷ', 156, 12, CAST(10.7651372000000000 AS Decimal(19, 16)), CAST(106.6770034000000000 AS Decimal(19, 16)), 88888, 227000, 11, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (68, 42, 2, 2, 16, CAST(0x0000A13400000000 AS DateTime), NULL, NULL, N'Frank De Ngô', N'0998288377', N'335 hùng vương', 196, 15, CAST(10.7579367000000000 AS Decimal(19, 16)), CAST(106.6697144000000000 AS Decimal(19, 16)), 89999999, 123123, 11, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (69, 43, 1, 1, NULL, CAST(0x0000A12400000000 AS DateTime), NULL, NULL, N'Trần Nhật Hoàng', N'01234567983', N'159, Lý Thường Kiệt', 174, 13, CAST(10.7627279000000000 AS Decimal(19, 16)), CAST(106.6602827000000000 AS Decimal(19, 16)), 88000, 250000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (70, 43, 2, 1, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, NULL, N'Hồ Mạnh Đại', N'01234565432', N'335, Hùng Vương', 196, 15, NULL, NULL, 12000, 275000, 3, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (71, 32, 1, 1, NULL, CAST(0x0000A13600000000 AS DateTime), NULL, NULL, N'Trần Nhật Hoàng', N'01227665757', N'159, Lý Thường Kiệt', 174, 13, CAST(10.7627279000000000 AS Decimal(19, 16)), CAST(106.6602827000000000 AS Decimal(19, 16)), 40000, 100000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (72, 32, 1, 2, NULL, CAST(0x0000A13100000000 AS DateTime), NULL, NULL, N'Nguyễn Quốc Vương', N'01233455676', N'335, Hùng Vương', 196, 15, CAST(10.7579367000000000 AS Decimal(19, 16)), CAST(106.6697144000000000 AS Decimal(19, 16)), 37000, 150000, 2, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (73, 44, 1, 3, NULL, CAST(0x0000A12F00000000 AS DateTime), NULL, NULL, N'Vương Tất Khang', N'0909677355', N'1 Hồ Thị Kỷ', 156, 12, CAST(10.7651883000000000 AS Decimal(19, 16)), CAST(106.6769939000000000 AS Decimal(19, 16)), 22000, 25000, 6, N'Tiền đặt cọc')
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 12/19/2012 18:28:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsFragile] [bit] NOT NULL,
	[HasHighValue] [bit] NOT NULL,
	[Size] [nvarchar](255) NOT NULL,
	[Weight] [nvarchar](255) NOT NULL,
	[Note] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (10, 4, N'Kính mát', 1, 1, 0, N'10x15x12 cm', N'200g', N'adf afsd sf sd')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (11, 36, N'Kính mát', 1, 1, 0, N'10x15x12 cm', N'200g', N'adf afsd sf sd')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (12, 38, N'Sách Toefl', 2, 0, 0, N'10x20x25 cm', N'400g', N'f efdsgewt gertert er')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (16, 5, N'Máy tính bỏ túi', 2, 0, 0, N'5x10x15cm', N'200g', N'e fr regt rh ty ut ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (17, 37, N'Máy tính bỏ túi', 2, 0, 0, N'5x10x15cm', N'200g', N'e fr regt rh ty ut ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (18, 13, N'USB 3G', 1, 0, 1, N'5x10x15cm', N'150g', N'df gh yj mjre')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (19, 34, N'USB 3G', 1, 0, 1, N'5x10x15cm', N'150g', N'df gh yj mjre')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (21, 7, N'Chuột quang K310', 2, 1, 0, N'15 x 5 x 10 cm', N'100g', N'màu xanh')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (22, 9, N'Tai nghe Sennheiser K750', 1, 0, 1, N'20 x 30 x 15 cm', N'600g', N'chụp tai')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (23, 39, N'Dao cạo râu Gillete', 4, 0, 0, N'15 x 5 x 10 cm', N'400g', N'màu vàng')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (24, 10, N'Nhẫn bạc PNJ', 2, 0, 1, N'5x7x4cm', N'100g', N'sf df sdf sd f')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (25, 33, N'Hộp bút bi Thiên Long', 2, 0, 0, N'4x8x15cm', N'200g', N'ef dsfd sf s')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (26, 11, N'Đồng hồ Casio GA1200', 1, 0, 1, N'10x12x10cm', N'300g', N'se fdsf dsf ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (27, 12, N'Đồng hồ báo thức', 1, 0, 0, N'15 x 15 x 10 cm', N'200g', N'hình tam giác')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (28, 21, N'Máy ảnh Canon', 1, 0, 1, N'20x30x15cm', N'400g', N'Màu đỏ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (29, 26, N'Máy sấy tóc Phillip', 1, 0, 0, N'15x20x20cm', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (30, 14, N'Gấu bông', 1, 0, 0, N'50x50x50cm', N'800g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (31, 27, N'Chuột quang Genius', 1, 0, 0, N'10x10x15cm', N'200g', N'Xanh đen')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (32, 30, N'sach A', 1, 0, 1, N'15 x 5 x 10 cm', N'400g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (34, 28, N'Đồng hồ báo thức hiệu con gà', 1, 0, 0, N'20x20x15 cm', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (35, 29, N'Bút Parker', 2, 0, 1, N'5x5x15cm', N'200g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (36, 31, N'Quần super man', 2, 1, 1, N'5x15x15cm', N'200g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (37, 32, N'Sách tiếng Nhật', 1, 0, 0, N'7 x 12 x 20 cm', N'400g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (38, 35, N'Áo 2 dây', 2, 0, 0, N'5 x 15 x 20 cm', N'300g', N'Màu hồng phấn')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (39, 40, N'Chuột không dây', 1, 0, 0, N'10 x 7 x 13 cm', N'150g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (40, 6, N'Son môi', 3, 0, 0, N'5 x 5 x 10 cm', N'100g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (41, 41, N'American Apple Box', 2, 1, 0, N'200 x 500 x 300mm', N'20kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (42, 41, N'New Zealand Kiwi box', 5, 1, 0, N'150 x 250 x 450mm', N'24', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (43, 42, N'Mango Box', 1, 1, 0, N'300 x 250 x 410mm', N'25kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (44, 42, N'Water melon box', 1, 1, 0, N'500 x 600 x 1000mm', N'34kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (45, 41, N'Grape Box', 2, 1, 0, N'100x200x300 mm', N'5kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (46, 43, N'strawberry box', 1, 1, 0, N'100 x 100 x 100', N'2kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (47, 44, N'Coconut carton', 2, 0, 0, N'200 x 300 x 200', N'7kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (48, 44, N'Orange box', 1, 1, 0, N'200 x 200 x 400', N'9kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (49, 45, N'grapefruit box', 2, 0, 0, N'1000 x 700 x 450mm', N'40kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (50, 45, N'Coconut box', 1, 0, 0, N'500 x 600 x 700', N'17kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (51, 45, N'banana carton', 12, 1, 0, N'300 x 500 x 100mm', N'120kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (52, 46, N'Ao thun', 2, 1, 1, N'Big', N'0.5KG', N'Mau xanh')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (53, 46, N'Quan Jean', 5, 1, 1, N'Big', N'0.5KG', N'Mau xam')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (54, 47, N'Tivi', 1, 1, 1, N'Medium', N'10KG', N'Dễ vỡ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (55, 47, N'Tủ lạnh', 1, 1, 1, N'Big', N'100KG', N'Dễ vỡ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (56, 48, N'Google Nexus 7', 2, 1, 1, N'100 x 100 x 300mm', N'1kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (57, 49, N'Dai Viet Su Ky toan thu', 10, 0, 0, N'100 x 200 x 50', N'300g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (58, 49, N'Gundam model', 2, 0, 1, N'300 x 350 x 100mm', N'2kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (59, 50, N'Sting carton', 2, 1, 0, N'100 x 200 x 300', N'4kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (60, 50, N'Heiniken carton', 1, 1, 0, N'200 x 400 x50mm', N'12kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (61, 51, N'HTC HD one', 1, 1, 1, N'90 x 45 x 12 mm', N'475g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (62, 51, N'Bao Da HTC', 1, 0, 0, N'100 x 100 x 25', N'100g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (63, 52, N'Neptune', 7, 0, 0, N'150 x 150 x 300mm', N'1200g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (64, 53, N'Heiniken', 50, 0, 0, N'200 x 500 x 100', N'7kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (65, 54, N'Donal Duck Toy', 5, 0, 0, N'200 x 200 x 200mm', N'1kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (66, 54, N'Dragon Glass', 2, 1, 0, N'300 x 300 x 300', N'2kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (67, 55, N'Air Conditioner', 1, 1, 1, N'200 x 700 x 200', N'7kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (68, 56, N'Korea Ginsen', 1, 1, 1, N'300 x 200 x 300', N'1kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (69, 57, N'Casio Calculator', 100, 1, 0, N'100 x 250 x 50mm', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (70, 57, N'Hp laser printer', 1, 1, 1, N'300 x 300 x 800mm', N'14kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (71, 58, N'Nokia lumina 620', 1, 1, 1, N'200 x 300 x 200', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (72, 59, N'Johnny walker', 1, 1, 1, N'100 x 100 x 300', N'1kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (73, 60, N'Space bown', 1, 1, 1, N'300 x 400x 500mm', N'3kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (74, 61, N'Himejo model', 10, 0, 0, N'100 x 200 x 300', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (75, 62, N'vertu', 5, 1, 1, N'200 x 200 x 400', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (76, 63, N'SDD Sata', 1, 1, 1, N'200 x 200 x 100', N'975g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (77, 64, N'Rose box', 1, 0, 1, N'500 x 500  x 500', N'2kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (78, 64, N'Love chocolate box', 1, 0, 0, N'100x200x300mm', N'475g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (79, 65, N'Nokia c300', 10, 0, 0, N'300x400x250mm', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (80, 66, N'Chuột không dây Apple', 2, 0, 0, N'200 x 300 x 150 mm', N'500g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (81, 67, N'Harry Porter Seri Book', 1, 0, 0, N'300 x 300 x 450', N'5kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (82, 68, N'con ga`', 1, 0, 0, N'200 x 200 x 300', N'400', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (83, 69, N'nokia 1100i', 1, 0, 0, N'300 x 400 x 500 mm', N'457g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (84, 70, N'Chuot không dây ISS3', 1, 0, 0, N'300 x 200 x 150 mm', N'450g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (85, 71, N'Nokia 1100i', 1, 0, 0, N'200 x 100 x 200', N'450g', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (86, 72, N'chuột ko dây razor', 1, 0, 0, N'20 x 30 x 40 cm', N'0.5 kg', NULL)
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (87, 73, N'Bình nước cách nhiệt', 1, 0, 0, N'100 x 100 x 350 mm', N'450 g', NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Default [DF__aspnet_Ap__Appli__78EB5BF9]    Script Date: 12/19/2012 18:28:45 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__79DF8032]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__7AD3A46B]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__7BC7C8A4]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__7CBBECDD]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__7DB01116]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__7EA4354F]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__7F985988]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__008C7DC1]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FKContact407943]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FKContact407943] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FKContact407943]
GO
/****** Object:  ForeignKey [FKDistrict628970]    Script Date: 12/19/2012 18:28:48 ******/
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FKDistrict628970] FOREIGN KEY([CityProvinceId])
REFERENCES [dbo].[CityProvince] ([CityProvinceId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FKDistrict628970]
GO
/****** Object:  ForeignKey [FKUserInfo221814]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FKUserInfo221814] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FKUserInfo221814]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__045D0EA5]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__055132DE]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__06455717]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__07397B50]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__082D9F89]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__0921C3C2]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__0A15E7FB]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__0B0A0C34]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FKWard334657]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FKWard334657] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FKWard334657]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__0CF254A6]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__0DE678DF]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FKHub419786]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub419786] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub419786]
GO
/****** Object:  ForeignKey [FKHub718903]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Hub]  WITH CHECK ADD  CONSTRAINT [FKHub718903] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Hub] CHECK CONSTRAINT [FKHub718903]
GO
/****** Object:  ForeignKey [FKCustomerAd699986]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd699986] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd699986]
GO
/****** Object:  ForeignKey [FKCustomerAd734436]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd734436] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd734436]
GO
/****** Object:  ForeignKey [FKCustomerAd999103]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FKCustomerAd999103] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FKCustomerAd999103]
GO
/****** Object:  ForeignKey [FKRequest241288]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest241288] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest241288]
GO
/****** Object:  ForeignKey [FKRequest470781]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest470781] FOREIGN KEY([CollectionPlanId])
REFERENCES [dbo].[CollectionPlan] ([CollectionPlanId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest470781]
GO
/****** Object:  ForeignKey [FKRequest484183]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest484183] FOREIGN KEY([CollectionAddressId])
REFERENCES [dbo].[CustomerAddress] ([CustomerAddressId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest484183]
GO
/****** Object:  ForeignKey [FKOrder160108]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder160108] FOREIGN KEY([ReceiverAddressDistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder160108]
GO
/****** Object:  ForeignKey [FKOrder332980]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder332980] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder332980]
GO
/****** Object:  ForeignKey [FKOrder344193]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder344193] FOREIGN KEY([DeliveryOptionId])
REFERENCES [dbo].[DeliveryOption] ([DeliveryOptionId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder344193]
GO
/****** Object:  ForeignKey [FKOrder537128]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder537128] FOREIGN KEY([ReceiverAddressWardId])
REFERENCES [dbo].[Ward] ([WardId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder537128]
GO
/****** Object:  ForeignKey [FKOrder949808]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder949808] FOREIGN KEY([DeliveryPlanId])
REFERENCES [dbo].[DeliveryPlan] ([DeliveryPlanId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder949808]
GO
/****** Object:  ForeignKey [FKOrder996545]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FKOrder996545] FOREIGN KEY([OrderPaymentTypeId])
REFERENCES [dbo].[OrderPaymentType] ([OrderPaymentTypeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FKOrder996545]
GO
/****** Object:  ForeignKey [FKItem829908]    Script Date: 12/19/2012 18:28:49 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FKItem829908] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FKItem829908]
GO

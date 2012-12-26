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




CREATE TABLE Request (
  RequestId           int IDENTITY NOT NULL, 
  CreatedByUserId     uniqueidentifier NOT NULL, 
  CustomerId          int NOT NULL, 
  CollectionAddressId int NOT NULL, 
  RequestedDate       datetime NULL, 
  CollectionPlanId    int NULL, 
  RequestStatus       int NOT NULL, 
  Note                ntext NULL, 
  PRIMARY KEY (RequestId));
CREATE TABLE Customer (
  CustomerId          int IDENTITY NOT NULL, 
  CompanyName         nvarchar(1000) NOT NULL, 
  DisplayName         nvarchar(1000) NOT NULL, 
  PhoneNumber         nvarchar(255) NOT NULL, 
  CurrentContractCode nvarchar(255) NOT NULL, 
  IsActive            bit NOT NULL, 
  Note                ntext NULL, 
  PRIMARY KEY (CustomerId));
CREATE TABLE CustomerAddress (
  CustomerAddressId int IDENTITY NOT NULL, 
  CustomerId        int NOT NULL, 
  Address           nvarchar(255) NOT NULL, 
  WardId            int NULL, 
  DistrictId        int NOT NULL, 
  Latitude          decimal(19, 16) NULL, 
  Longitude         decimal(19, 16) NULL, 
  IsActive          bit NOT NULL, 
  Note              ntext NULL, 
  PRIMARY KEY (CustomerAddressId));
CREATE TABLE [Order] (
  OrderId                         int IDENTITY NOT NULL, 
  RequestId                       int NOT NULL, 
  DeliveryOptionId                int NOT NULL, 
  OrderPaymentTypeId              int NOT NULL, 
  DeliveryPlanId                  int NULL, 
  DueDate                         datetime NULL, 
  CollectedDate                   datetime NULL, 
  DeliveryDate                    datetime NULL, 
  ReceiverName                    nvarchar(255) NULL, 
  ReceiverPhone                   nvarchar(255) NOT NULL, 
  ReceiverAddress                 nvarchar(255) NOT NULL, 
  ReceiverAddressWardId           int NULL, 
  ReceiverAddressDistrictId       int NOT NULL, 
  Latitude                        decimal(19, 16) NULL, 
  Longitude                       decimal(19, 16) NULL, 
  Fee                             int NULL, 
  AmountToBeCollectedFromReceiver int NOT NULL, 
  OrderStatus                     int NOT NULL, 
  Note                            ntext NULL, 
  PRIMARY KEY (OrderId));
CREATE TABLE CollectionPlan (
  CollectionPlanId        int IDENTITY NOT NULL, 
  CreatedDate             datetime NOT NULL, 
  CreatedByUserId         uniqueidentifier NOT NULL, 
  AssignedDeliveryStaffId uniqueidentifier NULL, 
  FinishedDate            datetime NULL, 
  CollectionPlanStatus    int NOT NULL, 
  Note                    ntext NULL, 
  CollectionOrder         nvarchar(1000) NULL, 
  PRIMARY KEY (CollectionPlanId));
CREATE TABLE Contact (
  ContactId    int IDENTITY NOT NULL, 
  CustomerId   int NOT NULL, 
  Title        nvarchar(255) NOT NULL, 
  Name         nvarchar(255) NOT NULL, 
  Position     nvarchar(255) NULL, 
  EmailAddress nvarchar(255) NOT NULL, 
  PhoneNumber  nvarchar(255) NOT NULL, 
  IsActive     bit NOT NULL, 
  PRIMARY KEY (ContactId));
CREATE TABLE Ward (
  WardId       int IDENTITY NOT NULL, 
  DistrictId   int NOT NULL, 
  Name         nvarchar(255) NOT NULL, 
  IsActive     bit NOT NULL, 
  DisplayOrder int NULL, 
  PRIMARY KEY (WardId));
CREATE TABLE CityProvince (
  CityProvinceId int IDENTITY NOT NULL, 
  Name           nvarchar(255) NOT NULL, 
  IsActive       bit NOT NULL, 
  DisplayOrder   int NULL, 
  PRIMARY KEY (CityProvinceId));
CREATE TABLE District (
  DistrictId     int IDENTITY NOT NULL, 
  CityProvinceId int NOT NULL, 
  Name           nvarchar(255) NOT NULL, 
  IsActive       bit NOT NULL, 
  DisplayOrder   int NULL, 
  PRIMARY KEY (DistrictId));
CREATE TABLE DeliveryOption (
  DeliveryOptionId int IDENTITY NOT NULL, 
  Name             nvarchar(255) NOT NULL, 
  Description      ntext NULL, 
  IsActive         bit NOT NULL, 
  PRIMARY KEY (DeliveryOptionId));
CREATE TABLE OrderPaymentType (
  OrderPaymentTypeId int IDENTITY NOT NULL, 
  Name               nvarchar(255) NOT NULL, 
  Description        ntext NULL, 
  IsActive           bit NOT NULL, 
  PRIMARY KEY (OrderPaymentTypeId));
CREATE TABLE DeliveryPlan (
  DeliveryPlanId          int IDENTITY NOT NULL, 
  CreatedDate             datetime NOT NULL, 
  CreatedByUserId         uniqueidentifier NOT NULL, 
  AssignedDeliveryStaffId uniqueidentifier NULL, 
  FinishedDate            datetime NULL, 
  DeliveryPlanStatus      int NOT NULL, 
  Note                    ntext NULL, 
  DeliveryOrder           nvarchar(1000) NULL, 
  PRIMARY KEY (DeliveryPlanId));
CREATE TABLE Item (
  ItemId       int IDENTITY NOT NULL, 
  OrderId      int NOT NULL, 
  Name         nvarchar(255) NOT NULL, 
  Quantity     int NOT NULL, 
  IsFragile    bit NOT NULL, 
  HasHighValue bit NOT NULL, 
  Size         nvarchar(255) NOT NULL, 
  Weight       nvarchar(255) NOT NULL, 
  Note         ntext NULL, 
  PRIMARY KEY (ItemId));
CREATE TABLE UserInfo (
  UserId     uniqueidentifier NOT NULL, 
  FullName   nvarchar(255) NOT NULL, 
  CustomerId int NULL, 
  PRIMARY KEY (UserId));
CREATE TABLE Hub (
  HubId      int IDENTITY NOT NULL, 
  Name       nvarchar(255) NOT NULL, 
  Address    nvarchar(255) NOT NULL, 
  WardId     int NULL, 
  DistrictId int NOT NULL, 
  Latitude   decimal(19, 16) NULL, 
  Longitude  decimal(19, 16) NULL, 
  IsActive   bit NOT NULL, 
  PRIMARY KEY (HubId));
ALTER TABLE Contact ADD CONSTRAINT FKContact407943 FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
ALTER TABLE CustomerAddress ADD CONSTRAINT FKCustomerAd699986 FOREIGN KEY (WardId) REFERENCES Ward (WardId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder332980 FOREIGN KEY (RequestId) REFERENCES Request (RequestId);
ALTER TABLE District ADD CONSTRAINT FKDistrict628970 FOREIGN KEY (CityProvinceId) REFERENCES CityProvince (CityProvinceId);
ALTER TABLE Ward ADD CONSTRAINT FKWard334657 FOREIGN KEY (DistrictId) REFERENCES District (DistrictId);
ALTER TABLE Request ADD CONSTRAINT FKRequest241288 FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
ALTER TABLE Request ADD CONSTRAINT FKRequest484183 FOREIGN KEY (CollectionAddressId) REFERENCES CustomerAddress (CustomerAddressId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder344193 FOREIGN KEY (DeliveryOptionId) REFERENCES DeliveryOption (DeliveryOptionId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder996545 FOREIGN KEY (OrderPaymentTypeId) REFERENCES OrderPaymentType (OrderPaymentTypeId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder949808 FOREIGN KEY (DeliveryPlanId) REFERENCES DeliveryPlan (DeliveryPlanId);
ALTER TABLE Item ADD CONSTRAINT FKItem829908 FOREIGN KEY (OrderId) REFERENCES [Order] (OrderId);
ALTER TABLE Request ADD CONSTRAINT FKRequest470781 FOREIGN KEY (CollectionPlanId) REFERENCES CollectionPlan (CollectionPlanId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder537128 FOREIGN KEY (ReceiverAddressWardId) REFERENCES Ward (WardId);
ALTER TABLE CustomerAddress ADD CONSTRAINT FKCustomerAd734436 FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder160108 FOREIGN KEY (ReceiverAddressDistrictId) REFERENCES District (DistrictId);
ALTER TABLE CustomerAddress ADD CONSTRAINT FKCustomerAd999103 FOREIGN KEY (DistrictId) REFERENCES District (DistrictId);
ALTER TABLE UserInfo ADD CONSTRAINT FKUserInfo221814 FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
ALTER TABLE Hub ADD CONSTRAINT FKHub718903 FOREIGN KEY (DistrictId) REFERENCES District (DistrictId);
ALTER TABLE Hub ADD CONSTRAINT FKHub419786 FOREIGN KEY (WardId) REFERENCES Ward (WardId);
ALTER TABLE Request ADD CONSTRAINT FKRequest311886 FOREIGN KEY (CreatedByUserId) REFERENCES aspnet_Users (UserId);
ALTER TABLE UserInfo ADD CONSTRAINT FKUserInfo647347 FOREIGN KEY (UserId) REFERENCES aspnet_Users (UserId);
ALTER TABLE CollectionPlan ADD CONSTRAINT FKCollection181717 FOREIGN KEY (CreatedByUserId) REFERENCES aspnet_Users (UserId);
ALTER TABLE DeliveryPlan ADD CONSTRAINT FKDeliveryPl120898 FOREIGN KEY (CreatedByUserId) REFERENCES aspnet_Users (UserId);
ALTER TABLE CollectionPlan ADD CONSTRAINT FKCollection3113 FOREIGN KEY (AssignedDeliveryStaffId) REFERENCES aspnet_Users (UserId);
ALTER TABLE DeliveryPlan ADD CONSTRAINT FKDeliveryPl665862 FOREIGN KEY (AssignedDeliveryStaffId) REFERENCES aspnet_Users (UserId);




USE [HDMS]
GO
/****** Object:  Table [dbo].[DeliveryOption]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[DeliveryOption] ON
INSERT [dbo].[DeliveryOption] ([DeliveryOptionId], [Name], [Description], [IsActive]) VALUES (1, N'Normal', N'1-3 ngày làm việc', 1)
INSERT [dbo].[DeliveryOption] ([DeliveryOptionId], [Name], [Description], [IsActive]) VALUES (2, N'Fast', N'Trong vòng 1 ngày làm việc', 1)
SET IDENTITY_INSERT [dbo].[DeliveryOption] OFF
/****** Object:  Table [dbo].[OrderPaymentType]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[OrderPaymentType] ON
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (1, N'COD', N'Giao hàng thu tiền', 1)
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (2, N'Pre-Paid', N'Trả trước', 1)
INSERT [dbo].[OrderPaymentType] ([OrderPaymentTypeId], [Name], [Description], [IsActive]) VALUES (3, N'Post-Paid', N'Trả sau', 1)
SET IDENTITY_INSERT [dbo].[OrderPaymentType] OFF
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 12/02/2012 16:58:23 ******/
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', NULL)
/****** Object:  Table [dbo].[CityProvince]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[CityProvince] ON
INSERT [dbo].[CityProvince] ([CityProvinceId], [Name], [IsActive], [DisplayOrder]) VALUES (1, N'Thành Phố Hồ Chí Minh', 1, NULL)
SET IDENTITY_INSERT [dbo].[CityProvince] OFF
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 12/02/2012 16:58:24 ******/
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Customer]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (1, N'Lazada Việt Nam', N'lazada.vn', N'0836265724', N'5yh7j2f', 1, N'asdasdasd')
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (2, N'Zalora Việt Nam', N'zalora.vn', N'08385137328', N'6uef23', 0, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (3, N'Tiki', N'tiki.vn', N'0838364448', N'43t43d', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (4, N'Công ty Nhóm Mua', N'nhommua.com', N'0838435732', N'6u238f', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (5, N'Website 123.vn', N'123.vn', N'0835682940', N'34t55g3', 1, NULL)
INSERT [dbo].[Customer] ([CustomerId], [CompanyName], [DisplayName], [PhoneNumber], [CurrentContractCode], [IsActive], [Note]) VALUES (6, N'Website sendo.vn', N'sendo.vn', N'0838475564', N'4fn35k', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Contact] ON
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (2, 1, N'Ms.', N'Hoàng Thị Tố Như', N'Logistics Manager', N'nhu@lazada.vn', N'0938532564', 1)
INSERT [dbo].[Contact] ([ContactId], [CustomerId], [Title], [Name], [Position], [EmailAddress], [PhoneNumber], [IsActive]) VALUES (3, 3, N'Mr.', N'Hoàng Minh Hải', NULL, N'hai.hoang@tiki.vn', N'0987676234', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'ebfef0f5-8396-49b4-b178-0fab38a75336', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd', N'Customer', N'customer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f', N'Delivery Staff', N'delivery staff', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7', N'Office Staff', N'office staff', NULL)
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'binhhn', N'binhhn', NULL, 0, CAST(0x0000A100008A55F7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'daola', N'daola', NULL, 0, CAST(0x0000A11B009791A2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd850c11b-6e02-4a29-9044-684369503bdf', N'lazada01', N'lazada01', NULL, 0, CAST(0x0000A11B00977016 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'tandhd', N'tandhd', NULL, 0, CAST(0x0000A0FF011B343B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'vuph', N'vuph', NULL, 0, CAST(0x0000A0FC009709F2 AS DateTime))
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 12/02/2012 16:58:24 ******/
/****** Object:  Table [dbo].[District]    Script Date: 12/02/2012 16:58:24 ******/
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
/****** Object:  Table [dbo].[Ward]    Script Date: 12/02/2012 16:58:24 ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'Huỳnh Ngọc Bình', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'Đỗ Hoàng Duy Tân', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'Lê Anh Đảo', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'Phan Hoàng Vũ', NULL)
INSERT [dbo].[UserInfo] ([UserId], [FullName], [CustomerId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'Lazada Số 1', 1)
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'TWVBRXcg4+rdfvyQYWBYImoPsBE=', 1, N'+qShE1yXVXGMB7EigL45Rw==', NULL, N'binhhn@tictac.vn', N'binhhn@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A1000084DC80 AS DateTime), CAST(0x0000A1000084DC80 AS DateTime), CAST(0x0000A1000084DC80 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'xynDSnyUZRXzreREvmr4Y2KuQvw=', 1, N'sRMayGVfqmtNKRkx/lw8bg==', NULL, N'daola@tictac.vn', N'daola@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A0FC000D0F5C AS DateTime), CAST(0x0000A11B009791A2 AS DateTime), CAST(0x0000A0FC000D0F5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'd850c11b-6e02-4a29-9044-684369503bdf', N'varKbjWfLvy/exu3okKJfuuFq4M=', 1, N'sR2GyywVRIPUUGL2ds8J4Q==', NULL, N'lazada01@lazada.vn', N'lazada01@lazada.vn', NULL, NULL, 1, 0, CAST(0x0000A10100ED67C8 AS DateTime), CAST(0x0000A11B00977016 AS DateTime), CAST(0x0000A10100ED67C8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'azKxqKEBPwhExl6HUhm7NxR7MjY=', 1, N'12hxEoBqd7FRVkKWajqUQA==', NULL, N'tandhd@tictac.vn', N'tandhd@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0x0000A0FF011A9E64 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8b0b8c26-4b6c-4e06-b1fc-d1f38fe667d7', N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'SvRh0H9NcBZAb/uhjzAcV+7hYzM=', 1, N'vEnTqbtCmrpa9NN5hsjdrw==', NULL, N'vuph@tictac.vn', N'vuph@tictac.vn', NULL, NULL, 1, 0, CAST(0x0000A0FC000E31FC AS DateTime), CAST(0x0000A0FC000E31FC AS DateTime), CAST(0x0000A0FC000E31FC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 12/02/2012 16:58:24 ******/
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'ebfef0f5-8396-49b4-b178-0fab38a75336')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'67fbbc21-936c-4bf4-8b52-3d6f01485954', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7e7359ae-92ca-4125-aef4-60423d5b7372', N'54c8145f-1405-4f86-a7b6-734ffa5e8dd7')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a835a4e2-3d0e-4232-8311-3d7bc8ff6608', N'c125e3b9-5216-4e13-b01d-a57d73a0a35f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd850c11b-6e02-4a29-9044-684369503bdf', N'ac38d841-4345-4b23-b0f3-d1fab34c84bd')
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 12/02/2012 16:58:24 ******/
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 12/02/2012 16:58:24 ******/
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 12/02/2012 16:58:24 ******/
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (1, 1, N'214 Trần Quang Khải', 1, 1, CAST(10.7916743691173200 AS Decimal(19, 16)), CAST(106.6892067962951400 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (2, 1, N'75 Trần Xuân Soạn', 253, 19, CAST(10.7517559000000000 AS Decimal(19, 16)), CAST(106.7047653000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (3, 2, N'36/18 Trần Não', 126, 10, CAST(10.7992535000000000 AS Decimal(19, 16)), CAST(106.7334419000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (4, 2, N'74/8 Điện Biên Phủ', 156, 12, CAST(10.7943985000000000 AS Decimal(19, 16)), CAST(106.7017615000000000 AS Decimal(19, 16)), 0, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (5, 3, N'274 Nguyễn Thị Định', 131, 10, CAST(10.7786327000000000 AS Decimal(19, 16)), CAST(106.7637085000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (6, 4, N'72/8B Nơ Trang Long', 77, 6, CAST(10.8186582237134610 AS Decimal(19, 16)), CAST(106.6991006693115200 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (7, 5, N'132 Thích Quảng Đức', 111, 9, CAST(10.8072343000000000 AS Decimal(19, 16)), CAST(106.6798130000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (8, 6, N'Lô 3A đường C5, Khu chế xuất Tân Thuận', NULL, 19, CAST(10.7556416000000000 AS Decimal(19, 16)), CAST(106.7428234000000000 AS Decimal(19, 16)), 1, NULL)
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive], [Note]) VALUES (9, 1, N'73/15 Hoàng Diệu', NULL, 14, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
/****** Object:  Table [dbo].[Hub]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Hub] ON
INSERT [dbo].[Hub] ([HubId], [Name], [Address], [WardId], [DistrictId], [Latitude], [Longitude], [IsActive]) VALUES (1, N'Head Quarter', N'107 Lê Hồng Phong', 154, 12, CAST(10.7687243311629000 AS Decimal(19, 16)), CAST(106.6740849566223200 AS Decimal(19, 16)), 1)
SET IDENTITY_INSERT [dbo].[Hub] OFF
/****** Object:  Table [dbo].[Request]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Request] ON
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (1, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, NULL, NULL, 0, N'sgdfhrha sgs gsd gs dg s d')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (2, N'7e7359ae-92ca-4125-aef4-60423d5b7372', 3, 5, NULL, NULL, 0, N'scsg gs ewwd scxz')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (3, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, NULL, NULL, 0, N'asdkljasdjasl jdlasj dlasj d')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (5, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, NULL, NULL, 0, N'dvfdsg dfg sdag dsaf')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (6, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 2, NULL, NULL, 0, N'fgfhfhgjgh t hfgh gfh df')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (7, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 5, 7, NULL, NULL, 0, N'sdf sgfd g df')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (8, N'67fbbc21-936c-4bf4-8b52-3d6f01485954', 6, 8, NULL, NULL, 0, N'gdf gfdg fg')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (10, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, NULL, NULL, 0, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (11, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 6, 8, NULL, NULL, 0, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (16, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 3, 5, NULL, NULL, 0, NULL)
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (17, N'd850c11b-6e02-4a29-9044-684369503bdf', 3, 5, NULL, NULL, 0, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (18, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, NULL, NULL, 0, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (19, N'd850c11b-6e02-4a29-9044-684369503bdf', 1, 1, NULL, NULL, 0, N'A Customer Request')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (25, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 1, 1, NULL, NULL, 0, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (26, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 4, 6, NULL, NULL, 0, N'')
INSERT [dbo].[Request] ([RequestId], [CreatedByUserId], [CustomerId], [CollectionAddressId], [RequestedDate], [CollectionPlanId], [RequestStatus], [Note]) VALUES (27, N'e6bbe739-5a0e-4f41-b2c2-4c2950206479', 5, 7, NULL, NULL, 0, N'')
SET IDENTITY_INSERT [dbo].[Request] OFF
/****** Object:  Table [dbo].[Order]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (4, 7, 2, 1, NULL, NULL, NULL, NULL, N'Cao Thái Sơn', N'09888664421', N'185 Lê Quang Định', 70, 6, CAST(10.8085784000000000 AS Decimal(19, 16)), CAST(106.6944176000000000 AS Decimal(19, 16)), NULL, 175000, 0, N'sdf sdf ds ds')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (5, 8, 1, 2, NULL, NULL, NULL, NULL, N'Hoàng Vũ', N'09942533362', N'332 Trường Chinh', 86, 7, CAST(10.7977060000000000 AS Decimal(19, 16)), CAST(106.6443440000000000 AS Decimal(19, 16)), NULL, 23000, 0, N'ewt rt drg drg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (6, 8, 2, 1, NULL, NULL, NULL, NULL, N'Thành Tín', N'0918428873', N'125 Thành Công', 102, 8, CAST(10.7937941707837180 AS Decimal(19, 16)), CAST(106.6315128211488200 AS Decimal(19, 16)), NULL, 275000, 0, N'af sf dsfdsf dsg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (7, 8, 1, 1, NULL, NULL, NULL, NULL, N'Hồ Hữu Tài', N'091 2334566', N'47 Lê Duẩn', 3, 1, CAST(10.7810242000000000 AS Decimal(19, 16)), CAST(106.6988700000000000 AS Decimal(19, 16)), NULL, 240000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (9, 2, 1, 1, NULL, NULL, NULL, NULL, N'Hoàng Hữu Danh', N'0121388499', N'409/4 Nguyễn Oanh', 49, 5, CAST(10.8393967000000000 AS Decimal(19, 16)), CAST(106.6758406000000000 AS Decimal(19, 16)), NULL, 350000, 0, N'rewret re re g gfr')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (10, 2, 2, 2, NULL, NULL, NULL, NULL, N'Hứa Trọng Bình', N'0122856209', N'1024 Xa Lộ HN', 36, 4, CAST(10.8166981225894790 AS Decimal(19, 16)), CAST(106.6978132089843700 AS Decimal(19, 16)), NULL, 0, 0, N'fd sgdsf dsf ')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (11, 3, 2, 3, NULL, NULL, NULL, NULL, N'Huỳnh Hữu Thịnh', N'093683659', N'85 Hòa Hưng', 152, 12, CAST(10.7794068000000000 AS Decimal(19, 16)), CAST(106.6749303000000000 AS Decimal(19, 16)), NULL, 12000, 0, N'efs fds fd f')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (12, 3, 1, 1, NULL, NULL, NULL, NULL, N'Phan Nam Phương', N'0911223344', N'100 Nguyễn Tất Thành', 181, 14, CAST(10.7635787000000000 AS Decimal(19, 16)), CAST(106.7079099000000000 AS Decimal(19, 16)), NULL, 185000, 0, N'fds gdfg fdg dfg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (13, 3, 2, 2, NULL, NULL, NULL, NULL, N'Hoàng Khương', N'0946328345', N'125 Kinh Dương Vương', 214, 16, CAST(10.7511128449225450 AS Decimal(19, 16)), CAST(106.6309334640016000 AS Decimal(19, 16)), NULL, 0, 0, N'g fdg dfs dg')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (14, 6, 1, 1, NULL, NULL, NULL, NULL, N'Lê Hoài Nam', N'0935253652', N'54 Thân Nhân Trung', 86, 7, CAST(10.8052786382176030 AS Decimal(19, 16)), CAST(106.6427944163940500 AS Decimal(19, 16)), NULL, 123000, 0, N'gf dgdf gdf g')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (21, 6, 1, 1, NULL, NULL, NULL, NULL, N'Hoàng Như Hải', N'0914838589', N'163 Nguyễn Phạm Tuân', 212, 16, CAST(10.7540209000000000 AS Decimal(19, 16)), CAST(106.6418463000000000 AS Decimal(19, 16)), NULL, 2560000, 0, N' hgery hj zffxhy')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (26, 6, 1, 1, NULL, NULL, NULL, NULL, N'Đào Hồng Hạnh', N'0912435664', N'140 Lê Hồng Phong', 197, 15, CAST(10.7577048000000000 AS Decimal(19, 16)), CAST(106.6779864000000000 AS Decimal(19, 16)), NULL, 246000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (27, 16, 1, 1, NULL, NULL, NULL, NULL, N'Phạm Thành Phát', N'0934563325', N'43 Trần Hưng Đạo', 6, 1, CAST(10.7656678842730230 AS Decimal(19, 16)), CAST(106.6931850135645200 AS Decimal(19, 16)), NULL, 145000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (28, 10, 1, 1, NULL, NULL, NULL, NULL, N'Tôn Trung Sơn', N'0912436363', N'135 Nguyễn Đình Chiểu', NULL, 11, CAST(10.7842954967687900 AS Decimal(19, 16)), CAST(106.6952640212402900 AS Decimal(19, 16)), NULL, 285000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (29, 10, 1, 1, NULL, NULL, NULL, NULL, N'Napoleon', N'0935644487', N'48 Hoàng Diệu', NULL, 14, CAST(10.7615369146221320 AS Decimal(19, 16)), CAST(106.7011727592469000 AS Decimal(19, 16)), NULL, 145000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (30, 17, 1, 1, NULL, NULL, NULL, NULL, N'Thanh Nhan', N'0934562642', N'83 Tran Hung Dao', NULL, 1, CAST(10.7640259702792510 AS Decimal(19, 16)), CAST(106.6915855392151100 AS Decimal(19, 16)), NULL, 145000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (31, 11, 1, 1, NULL, NULL, NULL, NULL, N'Phan Hồng An', N'0914345343', N'215 Nguyễn Văn Cừ', NULL, 15, CAST(10.7610935000000000 AS Decimal(19, 16)), CAST(106.6833293000000000 AS Decimal(19, 16)), NULL, 250000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (32, 11, 1, 2, NULL, NULL, NULL, NULL, N'Tăng Minh Triết', N'0984356432', N'339 Nguyễn Văn Luông', 214, 16, CAST(10.7504000000000000 AS Decimal(19, 16)), CAST(106.6350000000000000 AS Decimal(19, 16)), NULL, 0, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (33, 1, 1, 1, NULL, NULL, NULL, NULL, N'Lê Kiều Như', N'0996433433', N'72 Calmette', 5, 1, NULL, NULL, NULL, 235000, 0, N'safsgdh dsf dsgewrt ear')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (34, 1, 1, 1, NULL, NULL, NULL, NULL, N'Lê Kiều Như', N'0994352266', N'32 Calmette', 5, 1, CAST(10.7667753000000000 AS Decimal(19, 16)), CAST(106.7002535000000000 AS Decimal(19, 16)), NULL, 235000, 0, N'sdhhg dsf sdf iosafo')
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (35, 19, 1, 1, NULL, NULL, NULL, NULL, N'Tăng Thanh Hà', N'0935637445', N'275 Nguyễn Chí Thanh', NULL, 15, CAST(10.7590558000000000 AS Decimal(19, 16)), CAST(106.6646462000000000 AS Decimal(19, 16)), NULL, 283000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (36, 19, 1, 2, NULL, NULL, NULL, NULL, N'Tuấn Hưng', N'0913534374', N'487 Bà Hạt', 157, 12, CAST(10.7646084203212360 AS Decimal(19, 16)), CAST(106.6626197640014200 AS Decimal(19, 16)), NULL, 0, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (37, 18, 1, 1, NULL, NULL, NULL, NULL, N'Jennifer Phạm', N'0935216364', N'135 Nguyễn Oanh', NULL, 5, CAST(10.8269173000000000 AS Decimal(19, 16)), CAST(106.6798670000000000 AS Decimal(19, 16)), NULL, 275000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (38, 25, 1, 1, NULL, NULL, NULL, NULL, N'Dương Thanh Long', N'0935363456', N'526 Lạc Long Quân', 171, 13, CAST(10.7810105734542900 AS Decimal(19, 16)), CAST(106.6501339598022500 AS Decimal(19, 16)), NULL, 175000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (39, 26, 1, 1, NULL, NULL, NULL, NULL, N'Đàm Vĩnh Hưng', N'0998386424', N'249 Bạch Đằng', NULL, 6, CAST(10.8031932000000000 AS Decimal(19, 16)), CAST(106.7063695000000000 AS Decimal(19, 16)), NULL, 250000, 0, NULL)
INSERT [dbo].[Order] ([OrderId], [RequestId], [DeliveryOptionId], [OrderPaymentTypeId], [DeliveryPlanId], [DueDate], [CollectedDate], [DeliveryDate], [ReceiverName], [ReceiverPhone], [ReceiverAddress], [ReceiverAddressWardId], [ReceiverAddressDistrictId], [Latitude], [Longitude], [Fee], [AmountToBeCollectedFromReceiver], [OrderStatus], [Note]) VALUES (40, 27, 1, 1, NULL, NULL, NULL, NULL, N'Võ Hoài Nam', N'01235464433', N'325 Nguyễn Văn Trỗi', NULL, 9, CAST(10.7932811000000000 AS Decimal(19, 16)), CAST(106.6795734000000000 AS Decimal(19, 16)), NULL, 248000, 0, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 12/02/2012 16:58:24 ******/
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (10, 4, N'Kính mát', 1, 1, 0, N'10x15x12 cm', N'200g', N'adf afsd sf sd')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (11, 36, N'Kính mát', 1, 1, 0, N'10x15x12 cm', N'200g', N'adf afsd sf sd')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (12, 38, N'Sách Toefl', 2, 0, 0, N'10x20x25 cm', N'400g', N'f efdsgewt gertert er')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (16, 5, N'Máy tính bỏ túi', 2, 0, 0, N'5x10x15cm', N'200g', N'e fr regt rh ty ut ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (17, 37, N'Máy tính bỏ túi', 2, 0, 0, N'5x10x15cm', N'200g', N'e fr regt rh ty ut ')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (18, 5, N'USB 3G', 1, 0, 1, N'5x10x15cm', N'150g', N'df gh yj mjre')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (19, 34, N'USB 3G', 1, 0, 1, N'5x10x15cm', N'150g', N'df gh yj mjre')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (21, 7, N'Chuột quang K310', 2, 1, 0, N'15 x 5 x 10 cm', N'100g', N'màu xanh')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (22, 9, N'Tai nghe Sennheiser K750', 1, 0, 1, N'20 x 30 x 15 cm', N'600g', N'chụp tai')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (23, 39, N'Dao cạo râu Gillete', 4, 0, 0, N'15 x 5 x 10 cm', N'400g', N'màu vàng')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (24, 10, N'Nhẫn bạc PNJ', 2, 0, 1, N'5x7x4cm', N'100g', N'sf df sdf sd f')
INSERT [dbo].[Item] ([ItemId], [OrderId], [Name], [Quantity], [IsFragile], [HasHighValue], [Size], [Weight], [Note]) VALUES (25, 10, N'Hộp bút bi Thiên Long', 2, 0, 0, N'4x8x15cm', N'200g', N'ef dsfd sf s')
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
SET IDENTITY_INSERT [dbo].[Item] OFF

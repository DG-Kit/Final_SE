USE [master]
GO
/****** Object:  Database [FinalDatabase]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE DATABASE [FinalDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalDatabaseTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinalDatabaseTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalDatabaseTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinalDatabaseTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FinalDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FinalDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [FinalDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalDatabase] SET QUERY_STORE = OFF
GO
USE [FinalDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/6/2023 11:11:00 PM ******/
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
/****** Object:  Table [dbo].[Accountant]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accountant](
	[AccountantID] [int] IDENTITY(1,1) NOT NULL,
	[AccountantName] [nvarchar](max) NOT NULL,
	[AccountantEmail] [nvarchar](max) NOT NULL,
	[AccountantPassword] [nvarchar](max) NOT NULL,
	[WarehouseID] [int] NOT NULL,
 CONSTRAINT [PK_Accountant] PRIMARY KEY CLUSTERED 
(
	[AccountantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](max) NOT NULL,
	[AdminEmail] [nvarchar](max) NOT NULL,
	[AdminPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryStatus]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStatus](
	[DeliveryStatusId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryStatusName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeliveryStatus] PRIMARY KEY CLUSTERED 
(
	[DeliveryStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportReceipt]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportReceipt](
	[ExportReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[AccountantId] [int] NOT NULL,
 CONSTRAINT [PK_ExportReceipt] PRIMARY KEY CLUSTERED 
(
	[ExportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportReceiptDetails]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportReceiptDetails](
	[ResellerId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[ExportReceiptId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_ExportReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC,
	[ResellerId] ASC,
	[ExportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](max) NOT NULL,
	[ManufacturerYear] [int] NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneName] [nvarchar](max) NOT NULL,
	[PhoneDescription] [nvarchar](max) NOT NULL,
	[PhoneYear] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[AccountantId] [int] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetails]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetails](
	[ReceiptId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_ReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC,
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseller]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseller](
	[ResellerId] [int] IDENTITY(1,1) NOT NULL,
	[ResellerName] [nvarchar](max) NOT NULL,
	[ResellerEmail] [nvarchar](max) NOT NULL,
	[ResellerPassword] [nvarchar](max) NOT NULL,
	[ResellerLocation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reseller] PRIMARY KEY CLUSTERED 
(
	[ResellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResellerImportReceipt]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResellerImportReceipt](
	[ResellerImportReceiptId] [int] IDENTITY(1,1) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[PaymentMethod] [nvarchar](max) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[DeliveryStatusId] [int] NOT NULL,
	[ResellerId] [int] NOT NULL,
 CONSTRAINT [PK_ResellerImportReceipt] PRIMARY KEY CLUSTERED 
(
	[ResellerImportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResellerImportReceiptDetail]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResellerImportReceiptDetail](
	[ResellerImportReceiptId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_ResellerImportReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC,
	[ResellerImportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResellerStorage]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResellerStorage](
	[ResellerId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ResellerStorage] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC,
	[ResellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseName] [nvarchar](max) NOT NULL,
	[WarehouseLocation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseProducts]    Script Date: 5/6/2023 11:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseProducts](
	[WarehouseId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_WarehouseProducts] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC,
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accountant_WarehouseID]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accountant_WarehouseID] ON [dbo].[Accountant]
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportReceipt_AccountantId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportReceipt_AccountantId] ON [dbo].[ExportReceipt]
(
	[AccountantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportReceiptDetails_ExportReceiptId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportReceiptDetails_ExportReceiptId] ON [dbo].[ExportReceiptDetails]
(
	[ExportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportReceiptDetails_ResellerId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportReceiptDetails_ResellerId] ON [dbo].[ExportReceiptDetails]
(
	[ResellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phone_ManufacturerId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Phone_ManufacturerId] ON [dbo].[Phone]
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Receipt_AccountantId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Receipt_AccountantId] ON [dbo].[Receipt]
(
	[AccountantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptDetails_PhoneId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptDetails_PhoneId] ON [dbo].[ReceiptDetails]
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResellerImportReceipt_DeliveryStatusId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ResellerImportReceipt_DeliveryStatusId] ON [dbo].[ResellerImportReceipt]
(
	[DeliveryStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResellerImportReceipt_ResellerId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ResellerImportReceipt_ResellerId] ON [dbo].[ResellerImportReceipt]
(
	[ResellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResellerImportReceiptDetail_ResellerImportReceiptId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ResellerImportReceiptDetail_ResellerImportReceiptId] ON [dbo].[ResellerImportReceiptDetail]
(
	[ResellerImportReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ResellerStorage_ResellerId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ResellerStorage_ResellerId] ON [dbo].[ResellerStorage]
(
	[ResellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WarehouseProducts_PhoneId]    Script Date: 5/6/2023 11:11:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_WarehouseProducts_PhoneId] ON [dbo].[WarehouseProducts]
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResellerImportReceipt] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[ResellerImportReceipt] ADD  DEFAULT ((0)) FOR [ResellerId]
GO
ALTER TABLE [dbo].[Accountant]  WITH CHECK ADD  CONSTRAINT [FK_Accountant_Warehouse_WarehouseID] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accountant] CHECK CONSTRAINT [FK_Accountant_Warehouse_WarehouseID]
GO
ALTER TABLE [dbo].[ExportReceipt]  WITH CHECK ADD  CONSTRAINT [FK_ExportReceipt_Accountant_AccountantId] FOREIGN KEY([AccountantId])
REFERENCES [dbo].[Accountant] ([AccountantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportReceipt] CHECK CONSTRAINT [FK_ExportReceipt_Accountant_AccountantId]
GO
ALTER TABLE [dbo].[ExportReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExportReceiptDetails_ExportReceipt_ExportReceiptId] FOREIGN KEY([ExportReceiptId])
REFERENCES [dbo].[ExportReceipt] ([ExportReceiptId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportReceiptDetails] CHECK CONSTRAINT [FK_ExportReceiptDetails_ExportReceipt_ExportReceiptId]
GO
ALTER TABLE [dbo].[ExportReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExportReceiptDetails_Phone_PhoneId] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportReceiptDetails] CHECK CONSTRAINT [FK_ExportReceiptDetails_Phone_PhoneId]
GO
ALTER TABLE [dbo].[ExportReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ExportReceiptDetails_Reseller_ResellerId] FOREIGN KEY([ResellerId])
REFERENCES [dbo].[Reseller] ([ResellerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportReceiptDetails] CHECK CONSTRAINT [FK_ExportReceiptDetails_Reseller_ResellerId]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Manufacturer_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_Manufacturer_ManufacturerId]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Accountant_AccountantId] FOREIGN KEY([AccountantId])
REFERENCES [dbo].[Accountant] ([AccountantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Accountant_AccountantId]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetails_Phone_PhoneId] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [FK_ReceiptDetails_Phone_PhoneId]
GO
ALTER TABLE [dbo].[ReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetails_Receipt_ReceiptId] FOREIGN KEY([ReceiptId])
REFERENCES [dbo].[Receipt] ([ReceiptId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReceiptDetails] CHECK CONSTRAINT [FK_ReceiptDetails_Receipt_ReceiptId]
GO
ALTER TABLE [dbo].[ResellerImportReceipt]  WITH CHECK ADD  CONSTRAINT [FK_ResellerImportReceipt_DeliveryStatus_DeliveryStatusId] FOREIGN KEY([DeliveryStatusId])
REFERENCES [dbo].[DeliveryStatus] ([DeliveryStatusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerImportReceipt] CHECK CONSTRAINT [FK_ResellerImportReceipt_DeliveryStatus_DeliveryStatusId]
GO
ALTER TABLE [dbo].[ResellerImportReceipt]  WITH CHECK ADD  CONSTRAINT [FK_ResellerImportReceipt_Reseller_ResellerId] FOREIGN KEY([ResellerId])
REFERENCES [dbo].[Reseller] ([ResellerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerImportReceipt] CHECK CONSTRAINT [FK_ResellerImportReceipt_Reseller_ResellerId]
GO
ALTER TABLE [dbo].[ResellerImportReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ResellerImportReceiptDetail_Phone_PhoneId] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerImportReceiptDetail] CHECK CONSTRAINT [FK_ResellerImportReceiptDetail_Phone_PhoneId]
GO
ALTER TABLE [dbo].[ResellerImportReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ResellerImportReceiptDetail_ResellerImportReceipt_ResellerImportReceiptId] FOREIGN KEY([ResellerImportReceiptId])
REFERENCES [dbo].[ResellerImportReceipt] ([ResellerImportReceiptId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerImportReceiptDetail] CHECK CONSTRAINT [FK_ResellerImportReceiptDetail_ResellerImportReceipt_ResellerImportReceiptId]
GO
ALTER TABLE [dbo].[ResellerStorage]  WITH CHECK ADD  CONSTRAINT [FK_ResellerStorage_Phone_PhoneId] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerStorage] CHECK CONSTRAINT [FK_ResellerStorage_Phone_PhoneId]
GO
ALTER TABLE [dbo].[ResellerStorage]  WITH CHECK ADD  CONSTRAINT [FK_ResellerStorage_Reseller_ResellerId] FOREIGN KEY([ResellerId])
REFERENCES [dbo].[Reseller] ([ResellerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResellerStorage] CHECK CONSTRAINT [FK_ResellerStorage_Reseller_ResellerId]
GO
ALTER TABLE [dbo].[WarehouseProducts]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseProducts_Phone_PhoneId] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseProducts] CHECK CONSTRAINT [FK_WarehouseProducts_Phone_PhoneId]
GO
ALTER TABLE [dbo].[WarehouseProducts]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseProducts_Warehouse_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseProducts] CHECK CONSTRAINT [FK_WarehouseProducts_Warehouse_WarehouseId]
GO
USE [master]
GO
ALTER DATABASE [FinalDatabase] SET  READ_WRITE 
GO

select * from dbo.Accountant

GO

INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230416093623_Initial Migration', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230417005457_Add Phones and Manufacturer', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230417152809_Receipt and details', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230418001640_Add Warehouse Product', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230420144506_Add Reseller', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[Accountant] ON 

INSERT [dbo].[Accountant] ([AccountantID], [AccountantName], [AccountantEmail], [AccountantPassword], [WarehouseID]) VALUES (1, N'Accountant1', N'Accountant1@gmail.com', N'Accountant1', 1)
INSERT [dbo].[Accountant] ([AccountantID], [AccountantName], [AccountantEmail], [AccountantPassword], [WarehouseID]) VALUES (2, N'Accountant2', N'Accountant2@gmail.com', N'Accountant2', 2)
SET IDENTITY_INSERT [dbo].[Accountant] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminEmail], [AdminPassword]) VALUES (1, N'Admin1', N'Admin1@gmail.com', N'admin1')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (1, N'Samsung', 1969)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (2, N'Apple', 1976)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (3, N'Xiaomi', 2010)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (4, N'Oppo', 2004)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (5, N'realme', 2018)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (6, N'Vivo', 2009)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (7, N'Nokia', 1865)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (8, N'Sony', 1946)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (9, N'OnePlus', 2013)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (10, N'Huawei', 1987)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (11, N'Vertu', 1998)
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName], [ManufacturerYear]) VALUES (12, N'Asus', 1989)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([PhoneId], [PhoneName], [PhoneDescription], [PhoneYear], [Image], [Price], [ManufacturerId]) VALUES (1, N'iPhone 14 Pro Max 128GB', N'<div class="st-param"><ul><li data-info="Màn hình"><span class="icon-mobile"></span><p>6.7 inch, Super Retina XDR, 2796 x 1290 Pixels</p></li><li data-info="Camera sau"><span class="icon-cam"></span><p>48.0 MP + 12.0 MP + 12.0 MP </p></li><li data-info="Camera Selfie"><span class="icon-front-camera"></span><p>12.0 MP </p></li><li data-info="CPU"><span class="icon-cpu"></span><p>Apple A16 Bionic</p></li><li data-info="Bộ nhớ trong"><span class="icon-hdd-black"></span><p>128 GB</p></li></ul></div>', 2022, N'https://res.cloudinary.com/ddylildbb/image/upload/v1683393987/iphone_14_promax_128gb_lyogru.jpg', 26470000, 2)
INSERT [dbo].[Phone] ([PhoneId], [PhoneName], [PhoneDescription], [PhoneYear], [Image], [Price], [ManufacturerId]) VALUES (2, N'Samsung Galaxy S22 Plus 5G 128GB', N'<div class="st-param"><ul><li data-info="Màn hình"><span class="icon-mobile"></span><p>6.6 inch, Dynamic AMOLED 2X, FHD+, 1080 x 2340 Pixels</p></li><li data-info="Camera sau"><span class="icon-cam"></span><p>50.0 MP + 12.0 MP + 10.0 MP </p></li><li data-info="Camera Selfie"><span class="icon-front-camera"></span><p>10.0 MP </p></li><li data-info="CPU"><span class="icon-cpu"></span><p>Snapdragon 8 Gen 1</p></li><li data-info="Bộ nhớ trong"><span class="icon-hdd-black"></span><p>128 GB</p></li></ul></div>', 2021, N'https://res.cloudinary.com/ddylildbb/image/upload/v1683392450/samsung-galaxy-s22-den-1_p38dgy.jpg', 15990000, 1)
INSERT [dbo].[Phone] ([PhoneId], [PhoneName], [PhoneDescription], [PhoneYear], [Image], [Price], [ManufacturerId]) VALUES (3, N'Xiaomi 13 Pro 12GB-256GB', N'<div class="st-param"><ul><li data-info="Màn hình"><span class="icon-mobile"></span><p>6.73 inch, AMOLED, 2K+, 1440 x 3200 Pixels</p></li><li data-info="Camera sau"><span class="icon-cam"></span><p>50.0 MP + 50.0 MP + 50.0 MP </p></li><li data-info="Camera Selfie"><span class="icon-front-camera"></span><p>32.0 MP </p></li><li data-info="CPU"><span class="icon-cpu"></span><p>Snapdragon 8 Gen 2</p></li><li data-info="Bộ nhớ trong"><span class="icon-hdd-black"></span><p>256 GB</p></li></ul></div>', 2023, N'https://res.cloudinary.com/ddylildbb/image/upload/v1683394423/xiaomi_13_pro_qzx3hr.jpg', 23490000, 3)
INSERT [dbo].[Phone] ([PhoneId], [PhoneName], [PhoneDescription], [PhoneYear], [Image], [Price], [ManufacturerId]) VALUES (4, N'realme 10 8GB-256GB', N'<div class="st-param"><ul><li data-info="Màn hình"><span class="icon-mobile"></span><p>6.4 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels</p></li><li data-info="Camera sau"><span class="icon-cam"></span><p>50.0 MP </p></li><li data-info="Camera Selfie"><span class="icon-front-camera"></span><p>50.0 MP </p></li><li data-info="CPU"><span class="icon-cpu"></span><p>MediaTek Helio G99</p></li><li data-info="Bộ nhớ trong"><span class="icon-hdd-black"></span><p>256 GB</p></li></ul></div>', 2023, N'https://res.cloudinary.com/ddylildbb/image/upload/v1683394575/realme_10_8GB-256GB_ikilo4.jpg', 6390000, 5)
INSERT [dbo].[Phone] ([PhoneId], [PhoneName], [PhoneDescription], [PhoneYear], [Image], [Price], [ManufacturerId]) VALUES (5, N'OPPO Reno8 4G 8GB - 256GB', N'<div class="st-param"><ul><li data-info="Màn hình"><span class="icon-mobile"></span><p>Chính: 6.4 inch, Chính: AMOLED, FHD+, 1080 x 2400 Pixels</p></li><li data-info="Camera sau"><span class="icon-cam"></span><p>64.0 MP + 2.0 MP + 2.0 MP </p></li><li data-info="Camera Selfie"><span class="icon-front-camera"></span><p>32.0 MP </p></li><li data-info="CPU"><span class="icon-cpu"></span><p>Snapdragon 680</p></li><li data-info="Bộ nhớ trong"><span class="icon-hdd-black"></span><p>256 GB</p></li></ul></div>', 2023, N'https://res.cloudinary.com/ddylildbb/image/upload/v1683394766/OPPO_Reno8_4G_8GB_-_256GB_ndkrax.jpg', 6990000, 4)
SET IDENTITY_INSERT [dbo].[Phone] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseller] ON 

INSERT [dbo].[Reseller] ([ResellerId], [ResellerName], [ResellerEmail], [ResellerPassword], [ResellerLocation]) VALUES (1, N'FPT Shop', N'fptshop@gmail.com', N'fptshop', N'261 - 263 Khanh Hoi, Ward 5, District 4, Ho Chi Minh City')
INSERT [dbo].[Reseller] ([ResellerId], [ResellerName], [ResellerEmail], [ResellerPassword], [ResellerLocation]) VALUES (2, N'The Gioi Di Dong', N'thegioididong@gmail.com', N'thegioididong', N'128 Tran Quang Khai, Tan Dinh Ward , District 1, Ho Chi Minh City')
INSERT [dbo].[Reseller] ([ResellerId], [ResellerName], [ResellerEmail], [ResellerPassword], [ResellerLocation]) VALUES (3, N'CellPhoneS ', N'cellphones@gmail.com', N'cellphones', N'350-352 Vo Van Kiet, Co Giang Ward, District 1, Ho Chi Minh City')
SET IDENTITY_INSERT [dbo].[Reseller] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseLocation]) VALUES (1, N'FPT Trading', N'Lot 29B-31B-33B Tan Thuan Street, Tan Thuan EPZ, District 7, Ho Chi Minh City.')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseLocation]) VALUES (2, N'PSD', N'1-5 Le Duan, District 1, Ho Chi Minh City')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseLocation]) VALUES (3, N'PETROSETCO', N'1-5 Le Duan, District 1, Ho Chi Minh City')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
INSERT [dbo].[WarehouseProducts] ([WarehouseId], [PhoneId], [Quantity]) VALUES (1, 2, 11)
INSERT [dbo].[WarehouseProducts] ([WarehouseId], [PhoneId], [Quantity]) VALUES (2, 3, 5)
INSERT [dbo].[WarehouseProducts] ([WarehouseId], [PhoneId], [Quantity]) VALUES (2, 4, 3)
INSERT [dbo].[WarehouseProducts] ([WarehouseId], [PhoneId], [Quantity]) VALUES (3, 5, 5)
GO
SET IDENTITY_INSERT [dbo].[DeliveryStatus] ON 

INSERT [dbo].[DeliveryStatus] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (1, 'Wait for confirmation')
INSERT [dbo].[DeliveryStatus] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (2, 'Being transported')
INSERT [dbo].[DeliveryStatus] ([DeliveryStatusId], [DeliveryStatusName]) VALUES (3, 'Delivered')
SET IDENTITY_INSERT [dbo].[DeliveryStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([ReceiptId], [TotalPrice], [DateCreated], [AccountantID]) VALUES (1, 415180000, CAST(N'2023-05-07T02:57:17.5686809' AS DateTime2), 1)
INSERT [dbo].[Receipt] ([ReceiptId], [TotalPrice], [DateCreated], [AccountantID]) VALUES (2, 235150000, CAST(N'2023-05-07T02:58:34.5604491' AS DateTime2), 2)
INSERT [dbo].[Receipt] ([ReceiptId], [TotalPrice], [DateCreated], [AccountantID]) VALUES (3, 143560000, CAST(N'2023-05-08T00:40:42.7330663' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (1, 1, 9, 171000000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (1, 2, 7, 160930000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (1, 3, 7, 32130000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (1, 4, 8, 51120000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (2, 5, 8, 135120000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (2, 2, 7, 100030000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (3, 1, 4, 76000000)
INSERT [dbo].[ReceiptDetails] ([ReceiptId], [PhoneId], [Quantity], [Price]) VALUES (3, 5, 4, 67560000)
GO
SET IDENTITY_INSERT [dbo].[ResellerImportReceipt] ON

INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (1, 1088, CAST(N'2023-04-20T03:54:42.0051164' AS DateTime2), 0, 0, 1)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (2, 149, CAST(N'2023-04-21T03:55:42.6702274' AS DateTime2), 0, 0, 2)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (3, 799, CAST(N'2023-04-22T04:26:55.9199375' AS DateTime2), 0, 0, 4)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (4, 459, CAST(N'2023-04-25T10:54:42.0051164' AS DateTime2), 0, 0, 1)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (5, 850, CAST(N'2023-04-26T03:55:42.6702274' AS DateTime2), 0, 0, 2)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (6, 948, CAST(N'2023-04-27T12:26:55.9199375' AS DateTime2), 0, 0, 4)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (7, 3345, CAST(N'2023-04-28T06:54:42.0051164' AS DateTime2), 0, 0, 1)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (8, 1700, CAST(N'2023-04-29T07:55:42.6702274' AS DateTime2), 0, 0, 2)
INSERT [dbo].[ResellerImportReceipt] ([ResellerReceiptID], [TotalPrice], [DateCreated], [DeliveryStatusId], [PaymentStatus], [ResellerId]) VALUES (9, 4590, CAST(N'2023-04-30T08:26:55.9199375' AS DateTime2), 0, 0, 4)
SET IDENTITY_INSERT [dbo].[ResellerImportReceipt] OFF
GO
SET IDENTITY_INSERT [dbo].[ResellerImportReceipt] ON

INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (1, 3, 1, 1088)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (2, 2, 1, 149)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (3, 1, 1, 799)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (4, 4, 1, 459)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (5, 5, 1, 850)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (6, 2, 1, 149)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (6, 1, 1, 799)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (7, 1, 1, 799)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (7, 2, 1, 149)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (7, 3, 1, 1088)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (7, 4, 1, 459)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (7, 5, 1, 850)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (8, 5, 2, 1700)
INSERT [dbo].[ResellerImportReceiptDetails] ([ResellerReceiptID], [PhoneId], [Quantity], [Price]) VALUES (9, 4, 10, 4590)
SET IDENTITY_INSERT [dbo].[ResellerImportReceipt] OFF

select * from dbo.admin
select * from Accountant
select * from Warehouse
select * from ReceiptDetails
select * from ResellerImportReceipt
select * from ResellerImportReceiptDetails
select * from Phone
select * from Receipt
select * from Reseller
select * from WarehouseProducts
select * from Manufacturer
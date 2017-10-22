USE [master]
GO
/****** Object:  Database [CHSAuctionDb]    Script Date: 05/13/2017 18:15:48 ******/
CREATE DATABASE [CHSAuctionDb]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CHSAuctionDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CHSAuctionDb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CHSAuctionDb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CHSAuctionDb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CHSAuctionDb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CHSAuctionDb] SET ARITHABORT OFF
GO
ALTER DATABASE [CHSAuctionDb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CHSAuctionDb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CHSAuctionDb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CHSAuctionDb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CHSAuctionDb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CHSAuctionDb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CHSAuctionDb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CHSAuctionDb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CHSAuctionDb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CHSAuctionDb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CHSAuctionDb] SET  ENABLE_BROKER
GO
ALTER DATABASE [CHSAuctionDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CHSAuctionDb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CHSAuctionDb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CHSAuctionDb] SET ALLOW_SNAPSHOT_ISOLATION ON
GO
ALTER DATABASE [CHSAuctionDb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CHSAuctionDb] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [CHSAuctionDb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CHSAuctionDb] SET  READ_WRITE
GO
ALTER DATABASE [CHSAuctionDb] SET RECOVERY FULL
GO
ALTER DATABASE [CHSAuctionDb] SET  MULTI_USER
GO
ALTER DATABASE [CHSAuctionDb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CHSAuctionDb] SET DB_CHAINING OFF
GO
USE [CHSAuctionDb]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/13/2017 18:16:05 ******/
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/13/2017 18:16:07 ******/
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 05/13/2017 18:16:08 ******/
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 05/13/2017 18:16:09 ******/
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Value] [int] NOT NULL,
	[MinimumBid] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
/****** Object:  Table [dbo].[ItemBids]    Script Date: 05/13/2017 18:16:10 ******/
CREATE TABLE [dbo].[ItemBids](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bid] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ItemBids] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE NONCLUSTERED INDEX [IX_ItemId] ON [dbo].[ItemBids] 
(
	[ItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/13/2017 18:16:15 ******/
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/13/2017 18:16:16 ******/
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/13/2017 18:16:18 ******/
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  ForeignKey [FK_dbo.ItemBids_dbo.Items_ItemId]    Script Date: 05/13/2017 18:16:13 ******/
ALTER TABLE [dbo].[ItemBids]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ItemBids_dbo.Items_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemBids] CHECK CONSTRAINT [FK_dbo.ItemBids_dbo.Items_ItemId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 05/13/2017 18:16:15 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 05/13/2017 18:16:15 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 05/13/2017 18:16:16 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 05/13/2017 18:16:18 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO

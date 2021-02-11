USE [master]
GO
/****** Object:  Database [AirBnb]    Script Date: 1/2/20 7:51:08 PM ******/
CREATE DATABASE [AirBnb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirBnb', FILENAME = N'/var/opt/mssql/data/AirBnb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirBnb_log', FILENAME = N'/var/opt/mssql/data/AirBnb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirBnb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirBnb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirBnb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirBnb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirBnb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirBnb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirBnb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirBnb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirBnb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirBnb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirBnb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirBnb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirBnb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirBnb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirBnb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirBnb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AirBnb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirBnb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirBnb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirBnb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirBnb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirBnb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirBnb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirBnb] SET RECOVERY FULL 
GO
ALTER DATABASE [AirBnb] SET  MULTI_USER 
GO
ALTER DATABASE [AirBnb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirBnb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirBnb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirBnb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirBnb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirBnb', N'ON'
GO
ALTER DATABASE [AirBnb] SET QUERY_STORE = OFF
GO
USE [AirBnb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AirBnb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/2/20 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[personId] [uniqueidentifier] NOT NULL,
	[phoneNumber] [varchar](10) NOT NULL,
	[aboutMe] [varchar](8000) NULL,
	[profilePathUrl] [varchar](64) NULL,
	[profilePictureURL] [varchar](64) NULL,
	[userName] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[personId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirBnbRole]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirBnbRole](
	[id] [int] NOT NULL,
	[userType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirBnbUser]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirBnbUser](
	[id] [uniqueidentifier] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[roleId] [int] NOT NULL,
	[salt] [varchar](10) NOT NULL,
	[pword] [varchar](128) NOT NULL,
	[isActive] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] NOT NULL,
	[gender] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [uniqueidentifier] NOT NULL,
	[street] [varchar](128) NOT NULL,
	[city] [varchar](32) NOT NULL,
	[state] [varchar](32) NOT NULL,
	[zip] [varchar](10) NOT NULL,
	[isActive] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[senderId] [uniqueidentifier] NOT NULL,
	[receiverId] [uniqueidentifier] NOT NULL,
	[text] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[senderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[statusId] [int] NOT NULL,
	[receiverId] [uniqueidentifier] NOT NULL,
	[text] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationStatus]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationStatus](
	[id] [int] NOT NULL,
	[status] [varchar](24) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[userId] [uniqueidentifier] NOT NULL,
	[genderId] [int] NOT NULL,
	[firstName] [varchar](32) NULL,
	[lastName] [varchar](32) NULL,
	[rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateSchedule]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateSchedule](
	[rateScheduleId] [uniqueidentifier] NOT NULL,
	[rentalId] [uniqueidentifier] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[additionalFee] [float] NOT NULL,
 CONSTRAINT [PK_RateScheduleId_CAJb123bsh] PRIMARY KEY CLUSTERED 
(
	[rateScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratedId] [uniqueidentifier] NOT NULL,
	[raterId] [uniqueidentifier] NOT NULL,
	[score] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[id] [uniqueidentifier] NOT NULL,
	[hostId] [uniqueidentifier] NOT NULL,
	[bedrooms] [float] NOT NULL,
	[bathrooms] [float] NOT NULL,
	[description] [varchar](8000) NULL,
	[rating] [float] NULL,
	[addressId] [uniqueidentifier] NOT NULL,
	[isActive] [int] NOT NULL,
	[title] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalAgreement]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalAgreement](
	[id] [uniqueidentifier] NOT NULL,
	[renterId] [uniqueidentifier] NOT NULL,
	[hostId] [uniqueidentifier] NOT NULL,
	[checkIn] [datetime] NOT NULL,
	[checkOut] [datetime] NOT NULL,
	[allowedGuests] [int] NOT NULL,
	[rentalFee] [float] NOT NULL,
	[cleaningFee] [float] NOT NULL,
	[nights] [int] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalPrice]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalPrice](
	[rentalId] [uniqueidentifier] NOT NULL,
	[rentalFee] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rentalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalRating]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalRating](
	[rentalId] [uniqueidentifier] NOT NULL,
	[raterId] [uniqueidentifier] NOT NULL,
	[score] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RenterList]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RenterList](
	[renterId] [uniqueidentifier] NOT NULL,
	[rentalAgreementId] [uniqueidentifier] NOT NULL,
	[email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rentalAgreementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequest]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequest](
	[id] [uniqueidentifier] NOT NULL,
	[rentalId] [uniqueidentifier] NOT NULL,
	[renterId] [uniqueidentifier] NOT NULL,
	[checkIn] [datetime] NOT NULL,
	[checkOut] [datetime] NOT NULL,
	[message] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[renterId] [uniqueidentifier] NOT NULL,
	[hostId] [uniqueidentifier] NOT NULL,
	[rentalId] [uniqueidentifier] NOT NULL,
	[saleDate] [datetime] NOT NULL,
	[rentalAgreementId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedRentals]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedRentals](
	[rentalId] [uniqueidentifier] NOT NULL,
	[renterId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[renterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchemaVersions]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchemaVersions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScriptName] [nvarchar](255) NOT NULL,
	[Applied] [datetime] NOT NULL,
 CONSTRAINT [PK_SchemaVersions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionStatus]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionStatus](
	[id] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [uniqueidentifier] NOT NULL,
	[saleId] [int] NOT NULL,
	[captureId] [varchar](50) NOT NULL,
	[status] [varchar](32) NOT NULL,
	[saleDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([personId], [phoneNumber], [aboutMe], [profilePathUrl], [profilePictureURL], [userName]) VALUES (N'55277258-5b45-443d-ae61-60935cb43190', N'6625465224', N'All I do is host, host, host no matter what', N'/hostdamost', NULL, N'hostdamost')
INSERT [dbo].[Account] ([personId], [phoneNumber], [aboutMe], [profilePathUrl], [profilePictureURL], [userName]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', N'9096475429', N'I work and Koder and I love to kode! I am making an AirBnb that I renamed to CloudBnb', N'/ishootrayguns', NULL, N'ishootrayguns')
INSERT [dbo].[AirBnbRole] ([id], [userType]) VALUES (1, N'admin')
INSERT [dbo].[AirBnbRole] ([id], [userType]) VALUES (2, N'host')
INSERT [dbo].[AirBnbRole] ([id], [userType]) VALUES (3, N'renter')
INSERT [dbo].[AirBnbRole] ([id], [userType]) VALUES (4, N'guest')
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'b168a170-e8e1-4900-a241-0b478f2b6ff6', N'raymond@koder.com', 1, N'9a2hjoq28z', N'6e14304b0ce3a360545371c9a7e1f37def49f3b21b911c8bc39096d16078ff35', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'b5e36f4d-461d-43fe-b22c-1134ad0c1191', N'testingforsignup@gmail.com', 3, N'2vDsi+sl', N'BB98922F2F2245E443C31C869BF699DDB9B965FD56CB0BA4B5BBC79F70027ABE', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'607fe90e-1422-4a3c-8966-1e5cac1b867b', N'testrenter@gmail.com', 3, N'X0027zT9', N'F4BE69E7ADCB2A12EA39835979653F7B15593AC0E081D5B579875AB983765D87', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'0da05983-2db5-4c62-b6a0-2deaeb87c3b7', N'tesingpostmancall11@gmail.com', 3, N'faWa1poU', N'3C317738FF7E3765AEF4790F613D2F85E6748154A26875C997A6967D69719382', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'd4f23507-44af-4b2e-989e-3f8f74abf4c6', N'newemail123@gmail.com', 0, N'8/lk4oZx', N'006D32FFCE21F460E28C2312A25D32EEE7FB41B0935F91E3FD3A056C0B1B5240', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'55277258-5b45-443d-ae61-60935cb43190', N'koderraymond@gmail.com', 2, N'9a2hjoq28z', N'6e14304b0ce3a360545371c9a7e1f37def49f3b21b911c8bc39096d16078ff35', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'aa57d71b-1ddf-4dc9-ae28-614bd3a4064c', N'renter@cloudbnb.com', 3, N'8f5GdXpi', N'D85BF7E80FD7047AE29C1E37105E5851CE5D7B5DC9D6C816452B5ADC75A2D772', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'117a97b5-3327-46c6-b1b4-8c1bb175787e', N'alvarezraymond.a@gmail.com', 4, N'9a2hjoq28z', N'6e14304b0ce3a360545371c9a7e1f37def49f3b21b911c8bc39096d16078ff35', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'868a863e-e1d0-413f-b4dd-b78b838ab3d3', N'renting@gmail.com', 3, N'xZANRQFw', N'95DC959AF462084217226336CD665F1D69AAB5DEDAC2C20324625AD6EA251404', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'b035d64c-2ab3-4723-947e-c8f695de8b0e', N'sdfad@gmail.com', 3, N'89SdxhTl', N'0490792CEF5F247F68F47ADF5BD9BAABE9890B45B0CC6F59728D0F45575DC20E', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'0d01722b-9e7c-43e6-bd1b-cfb8b7cb9436', N'tesingpostmancall@gmail.com', 3, N'0QKcKXvP', N'E47EE686E713D50BAD35345F97987C0861E8C5F164DA3DB63B88C3AF5BF98A7C', 0)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'04c94bf6-3dff-4dea-b813-d5b357d44ceb', N'yashdkas@gmail.com', 3, N'nYxTJur8', N'EFFD363C14B029981E34D8FA9612126BF118167EA0EA95BE017BD76C308BC1E3', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', N'raalvare@uci.edu', 3, N'9a2hjoq28z', N'6e14304b0ce3a360545371c9a7e1f37def49f3b21b911c8bc39096d16078ff35', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'afc0cad9-1090-4300-a110-d8bf0af6ac08', N'testingsignup@gmail.com', 3, N'ElN9B0cT', N'C388F5F71ED5F9CE2EBE1A5EF1707E75DD3F18F7A4BD3D60B0F7718AE2CBF978', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'67218a49-2cb1-4742-b3a4-e1ee9f234185', N'tesingpostmancall21@gmail.com', 3, N'2PLKteS+', N'DF65D012E5EF7B78997874AF5DE65A351B6FB5D8AC7D771F8DDD368B2CD63228', 1)
INSERT [dbo].[AirBnbUser] ([id], [email], [roleId], [salt], [pword], [isActive]) VALUES (N'f7273656-7369-4aaa-a3c4-ee456332fadb', N'testingservices@gmail.com', 3, N'pRqtMx3l', N'A300B429EB05D1AD4F31770270EAA211AB7C520BDF2F98B0BA03E1D4146BBC9D', 1)
INSERT [dbo].[Gender] ([id], [gender]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (2, N'Female')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (3, N'Binary')
INSERT [dbo].[Gender] ([id], [gender]) VALUES (4, N'RatherNotSay')
INSERT [dbo].[Location] ([id], [street], [city], [state], [zip], [isActive]) VALUES (N'c46ec60a-d568-42e1-813a-3e5842dcdc29', N'27361 Rustic ln', N'Highland', N'California', N'     92346', 1)
INSERT [dbo].[Location] ([id], [street], [city], [state], [zip], [isActive]) VALUES (N'cc74a09c-a3e5-4bd2-aecb-fad4a145852b', N'81 Fallingstar', N'Irvine', N'CALIFORNIA', N'92346', 1)
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (1, N'Direct Message')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (2, N'Rental Request')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (4, N'Rental Request Update')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (5, N'Rental Confirmation')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (6, N'Rental Cancellation')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (7, N'Rental Updated')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (8, N'Payment Accepted')
INSERT [dbo].[NotificationStatus] ([id], [status]) VALUES (9, N'Payment Denied')
INSERT [dbo].[Person] ([userId], [genderId], [firstName], [lastName], [rating]) VALUES (N'b168a170-e8e1-4900-a241-0b478f2b6ff6', 1, N'Host', N'TheMost', 0)
INSERT [dbo].[Person] ([userId], [genderId], [firstName], [lastName], [rating]) VALUES (N'55277258-5b45-443d-ae61-60935cb43190', 1, N'Rent', N'TheMost', 0)
INSERT [dbo].[Person] ([userId], [genderId], [firstName], [lastName], [rating]) VALUES (N'0d01722b-9e7c-43e6-bd1b-cfb8b7cb9436', 1, N'name', N'changed', 0)
INSERT [dbo].[Person] ([userId], [genderId], [firstName], [lastName], [rating]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', 1, N'Raymond', N'Alvarez', 4)
INSERT [dbo].[RateSchedule] ([rateScheduleId], [rentalId], [startDate], [endDate], [additionalFee]) VALUES (N'2a56582b-6c6f-46f8-9643-0f662eb9735a', N'e3a6a0be-7344-4c2f-9874-61246226f27a', CAST(N'2019-12-21T01:18:48.567' AS DateTime), CAST(N'2020-01-21T01:18:48.567' AS DateTime), 25)
INSERT [dbo].[RateSchedule] ([rateScheduleId], [rentalId], [startDate], [endDate], [additionalFee]) VALUES (N'42ba9a3d-e43c-4823-9e09-a6d1f7a2c9eb', N'e3a6a0be-7344-4c2f-9874-61246226f27a', CAST(N'2020-03-23T22:47:13.177' AS DateTime), CAST(N'2020-05-23T22:47:13.177' AS DateTime), 15)
INSERT [dbo].[RateSchedule] ([rateScheduleId], [rentalId], [startDate], [endDate], [additionalFee]) VALUES (N'8d4f1223-ad38-4a71-bf7c-dcd531d9d310', N'c7cbe0b7-9386-4418-8d72-704f0d1f7f28', CAST(N'2020-01-01T01:18:48.567' AS DateTime), CAST(N'2020-01-30T01:18:48.567' AS DateTime), 50)
INSERT [dbo].[Rating] ([ratedId], [raterId], [score]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', N'55277258-5b45-443d-ae61-60935cb43190', 5)
INSERT [dbo].[Rating] ([ratedId], [raterId], [score]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', N'b168a170-e8e1-4900-a241-0b478f2b6ff6', 3)
INSERT [dbo].[Rental] ([id], [hostId], [bedrooms], [bathrooms], [description], [rating], [addressId], [isActive], [title]) VALUES (N'e3a6a0be-7344-4c2f-9874-61246226f27a', N'55277258-5b45-443d-ae61-60935cb43190', 3, 3, N'Nice 3-Bedroom, 3-Bath', 5, N'cc74a09c-a3e5-4bd2-aecb-fad4a145852b', 1, N'Beautiful 3-Bed 3-Bath House')
INSERT [dbo].[Rental] ([id], [hostId], [bedrooms], [bathrooms], [description], [rating], [addressId], [isActive], [title]) VALUES (N'c7cbe0b7-9386-4418-8d72-704f0d1f7f28', N'b168a170-e8e1-4900-a241-0b478f2b6ff6', 5, 2.5, N'If you dont enjoy this house then I dont know what to tell you!', 0, N'c46ec60a-d568-42e1-813a-3e5842dcdc29', 1, N'Big Bear Cabin 5 Bedroom 2.5 Bath')
INSERT [dbo].[RentalAgreement] ([id], [renterId], [hostId], [checkIn], [checkOut], [allowedGuests], [rentalFee], [cleaningFee], [nights], [total]) VALUES (N'48a9a01d-cf1e-4049-a6a2-aca70621f884', N'00574f69-bd1f-491d-895a-d860fb0f946b', N'55277258-5b45-443d-ae61-60935cb43190', CAST(N'2019-11-11T13:23:44.000' AS DateTime), CAST(N'2019-11-14T12:00:00.000' AS DateTime), 8, 125, 100, 1, 425)
INSERT [dbo].[RentalPrice] ([rentalId], [rentalFee]) VALUES (N'e3a6a0be-7344-4c2f-9874-61246226f27a', 125)
INSERT [dbo].[RentalPrice] ([rentalId], [rentalFee]) VALUES (N'c7cbe0b7-9386-4418-8d72-704f0d1f7f28', 200)
INSERT [dbo].[RenterList] ([renterId], [rentalAgreementId], [email]) VALUES (N'00574f69-bd1f-491d-895a-d860fb0f946b', N'48a9a01d-cf1e-4049-a6a2-aca70621f884', N'raalvare@uci.edu')
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [renterId], [hostId], [rentalId], [saleDate], [rentalAgreementId]) VALUES (4, N'00574f69-bd1f-491d-895a-d860fb0f946b', N'55277258-5b45-443d-ae61-60935cb43190', N'e3a6a0be-7344-4c2f-9874-61246226f27a', CAST(N'2019-10-11T13:23:44.000' AS DateTime), N'48a9a01d-cf1e-4049-a6a2-aca70621f884')
INSERT [dbo].[Sale] ([id], [renterId], [hostId], [rentalId], [saleDate], [rentalAgreementId]) VALUES (5, N'00574f69-bd1f-491d-895a-d860fb0f946b', N'55277258-5b45-443d-ae61-60935cb43190', N'e3a6a0be-7344-4c2f-9874-61246226f27a', CAST(N'2019-10-11T13:23:44.000' AS DateTime), N'48a9a01d-cf1e-4049-a6a2-aca70621f884')
SET IDENTITY_INSERT [dbo].[Sale] OFF
INSERT [dbo].[SavedRentals] ([rentalId], [renterId]) VALUES (N'e3a6a0be-7344-4c2f-9874-61246226f27a', N'00574f69-bd1f-491d-895a-d860fb0f946b')
SET IDENTITY_INSERT [dbo].[SchemaVersions] ON 

INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (1, N'AirBnb.Database.Script.Script0001 – AddAirbnbUserScript.sql', CAST(N'2019-12-26T11:54:16.297' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (2, N'AirBnb.Database.Script.Script0002 – DeleteAirbnbUser.sql', CAST(N'2019-12-26T11:54:16.377' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (3, N'AirBnb.Database.Script.Script0003 – GetAllAirBnbUser.sql', CAST(N'2019-12-26T11:54:16.397' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (4, N'AirBnb.Database.Script.Script0004 – GetUserById.sql', CAST(N'2019-12-26T11:54:16.417' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (5, N'AirBnb.Database.Script.Script0005 – UpdateAccountDetails.sql', CAST(N'2019-12-26T11:54:16.437' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (6, N'AirBnb.Database.Script.Script0005 – UpdateAirBnbUser.sql', CAST(N'2019-12-26T11:54:16.457' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (7, N'AirBnb.Database.Script.Script0006 – AddPersonScript.sql', CAST(N'2019-12-26T11:54:16.480' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (8, N'AirBnb.Database.Script.Script0007 – DeletePerson.sql', CAST(N'2019-12-26T11:54:16.507' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (9, N'AirBnb.Database.Script.Script0008 – GetAllPeople.sql', CAST(N'2019-12-26T11:54:16.527' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (10, N'AirBnb.Database.Script.Script0009 – GetPersonById.sql', CAST(N'2019-12-26T11:54:16.553' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (11, N'AirBnb.Database.Script.Script0010 – UpdatePerson.sql', CAST(N'2019-12-26T11:55:30.947' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (12, N'AirBnb.Database.Script.Script0011 – UpdateRating.sql', CAST(N'2019-12-26T11:55:30.997' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (13, N'AirBnb.Database.Script.Script0012 – AddAccountDetails.sql', CAST(N'2019-12-26T11:55:31.017' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (14, N'AirBnb.Database.Script.Script0013 – DeleteAccountDetailsById.sql', CAST(N'2019-12-26T11:55:31.037' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (15, N'AirBnb.Database.Script.Script0014 – GetAccountDetailsById.sql', CAST(N'2019-12-26T11:55:31.057' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (16, N'AirBnb.Database.Script.Script0015 – GetAllAccountDetails.sql', CAST(N'2019-12-26T11:55:31.077' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (17, N'AirBnb.Database.Script.Script0016 – AddLocation.sql', CAST(N'2019-12-26T11:55:31.100' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (18, N'AirBnb.Database.Script.Script0017 – DeleteLocation.sql', CAST(N'2019-12-26T11:55:31.120' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (19, N'AirBnb.Database.Script.Script0018 – GetAllLocations.sql', CAST(N'2019-12-26T11:55:31.143' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (20, N'AirBnb.Database.Script.Script0019 – GetAllLocations (copy).sql', CAST(N'2019-12-26T11:55:31.163' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (21, N'AirBnb.Database.Script.Script0020 – UpdateLocation.sql', CAST(N'2019-12-26T11:55:31.187' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (22, N'AirBnb.Database.Script.Script0021 – AddRental.sql', CAST(N'2019-12-26T11:56:21.970' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (23, N'AirBnb.Database.Script.Script0022 – DeleteRental.sql', CAST(N'2019-12-26T11:58:32.257' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (24, N'AirBnb.Database.Script.Script0023 – GetAllRentalDetails.sql', CAST(N'2019-12-26T11:58:32.297' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (25, N'AirBnb.Database.Script.Script0024 – GetRentalById.sql', CAST(N'2019-12-26T11:58:32.317' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (26, N'AirBnb.Database.Script.Script0025 – UpdateRental.sql', CAST(N'2019-12-26T11:58:32.337' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (27, N'AirBnb.Database.Script.Script0026 – AddRentalPrice.sql', CAST(N'2019-12-26T12:03:19.697' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (28, N'AirBnb.Database.Script.Script0027 – UpdateRentalPrice.sql', CAST(N'2019-12-26T12:03:19.743' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (29, N'AirBnb.Database.Script.Script0028 – GetRentalPrice.sql', CAST(N'2019-12-26T12:03:19.763' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (30, N'AirBnb.Database.Script.Script0029 – GetAllRentalPrices.sql', CAST(N'2019-12-26T12:03:19.780' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (31, N'AirBnb.Database.Script.Script0030 – AddRateSchedule.sql', CAST(N'2019-12-26T12:03:19.803' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (32, N'AirBnb.Database.Script.Script0031 – UpdateRateSchedule.sql', CAST(N'2019-12-26T12:03:42.607' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (33, N'AirBnb.Database.Script.Script0032 – GetRateScheduleById.sql', CAST(N'2019-12-26T12:03:42.647' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (34, N'AirBnb.Database.Script.Script0033 – GetAllRateSchedulesByRental.sql', CAST(N'2019-12-26T12:03:42.663' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (35, N'AirBnb.Database.Script.Script0004.1 – GetUserByEmail.sql', CAST(N'2019-12-30T23:29:32.807' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (36, N'AirBnb.Database.Script.Script0001.1 – AddAirbnbUserScript.sql', CAST(N'2019-12-30T23:41:50.203' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (37, N'AirBnb.Database.Script.Script0001.2 – DeleteAirbnbUser.sql', CAST(N'2019-12-30T23:41:50.250' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (38, N'AirBnb.Database.Script.Script0001.3 – UpdateAirBnbUser.sql', CAST(N'2019-12-30T23:41:50.267' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (39, N'AirBnb.Database.Script.Script0001.4 – GetAllAirBnbUser.sql', CAST(N'2019-12-30T23:41:50.280' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (40, N'AirBnb.Database.Script.Script0001.5 – GetUserByEmail.sql', CAST(N'2019-12-30T23:42:40.557' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (41, N'AirBnb.Database.Script.Script0001.6 – GetUserById.sql', CAST(N'2019-12-30T23:42:40.607' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (42, N'AirBnb.Database.Script.Script0002.1 – AddPersonScript.sql', CAST(N'2019-12-30T23:42:40.623' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (43, N'AirBnb.Database.Script.Script0002.2 – DeletePerson.sql', CAST(N'2019-12-30T23:42:40.643' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (44, N'AirBnb.Database.Script.Script0002.3 – UpdatePerson.sql', CAST(N'2019-12-30T23:42:40.663' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (45, N'AirBnb.Database.Script.Script0002.4 – GetAllPeople.sql', CAST(N'2019-12-30T23:42:40.680' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (46, N'AirBnb.Database.Script.Script0002.5 – GetPersonById.sql', CAST(N'2019-12-30T23:42:40.697' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (47, N'AirBnb.Database.Script.Script0002.6 – UpdateRating.sql', CAST(N'2019-12-30T23:42:40.713' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (48, N'AirBnb.Database.Script.Script0003.1 – AddAccountDetails.sql', CAST(N'2019-12-30T23:42:40.727' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (49, N'AirBnb.Database.Script.Script0003.2 – DeleteAccountDetailsById.sql', CAST(N'2019-12-30T23:42:40.747' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (50, N'AirBnb.Database.Script.Script0003.3 – UpdateAccountDetails.sql', CAST(N'2019-12-30T23:42:40.767' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (51, N'AirBnb.Database.Script.Script0003.4 – GetAllAccountDetails.sql', CAST(N'2019-12-30T23:42:40.783' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (52, N'AirBnb.Database.Script.Script0003.5 – GetAccountDetailsById.sql', CAST(N'2019-12-30T23:42:40.803' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (53, N'AirBnb.Database.Script.Script0004.1 – AddLocation.sql', CAST(N'2019-12-30T23:42:40.820' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (54, N'AirBnb.Database.Script.Script0004.2 – DeleteLocation.sql', CAST(N'2019-12-30T23:42:40.843' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (55, N'AirBnb.Database.Script.Script0004.3 – UpdateLocation.sql', CAST(N'2019-12-30T23:42:40.863' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (56, N'AirBnb.Database.Script.Script0004.4 – GetAllLocations.sql', CAST(N'2019-12-30T23:42:40.883' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (57, N'AirBnb.Database.Script.Script0004.5 – GetLocation.sql', CAST(N'2019-12-30T23:42:40.903' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (58, N'AirBnb.Database.Script.Script0005.1 – AddRental.sql', CAST(N'2019-12-30T23:42:40.930' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (59, N'AirBnb.Database.Script.Script0005.2 – DeleteRental.sql', CAST(N'2019-12-30T23:42:40.947' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (60, N'AirBnb.Database.Script.Script0005.3 – UpdateRental.sql', CAST(N'2019-12-30T23:42:40.973' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (61, N'AirBnb.Database.Script.Script0005.4 – GetAllRentalDetails.sql', CAST(N'2019-12-30T23:42:40.993' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (62, N'AirBnb.Database.Script.Script0005.5 – GetRentalById.sql', CAST(N'2019-12-30T23:42:41.013' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (63, N'AirBnb.Database.Script.Script0005.6 – AddRentalPrice.sql', CAST(N'2019-12-30T23:42:41.037' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (64, N'AirBnb.Database.Script.Script0005.60 – UpdateRentalPrice.sql', CAST(N'2019-12-30T23:42:41.053' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (65, N'AirBnb.Database.Script.Script0005.61 – GetRentalPrice.sql', CAST(N'2019-12-30T23:42:41.070' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (66, N'AirBnb.Database.Script.Script0005.62 – GetAllRentalPrices.sql', CAST(N'2019-12-30T23:42:41.090' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (67, N'AirBnb.Database.Script.Script0005.7 – AddRateSchedule.sql', CAST(N'2019-12-30T23:42:41.110' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (68, N'AirBnb.Database.Script.Script0005.70 – UpdateRateSchedule.sql', CAST(N'2019-12-30T23:42:41.130' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (69, N'AirBnb.Database.Script.Script0005.71 – GetRateScheduleById.sql', CAST(N'2019-12-30T23:42:41.147' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (70, N'AirBnb.Database.Script.Script0005.72 – GetAllRateSchedulesByRental.sql', CAST(N'2019-12-30T23:42:41.167' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (71, N'AirBnb.Database.Script.Script0006 – AuthenticateUser', CAST(N'2020-01-02T16:02:38.710' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (72, N'AirBnb.Database.Script.Script0006.1 – AuthAndGetUserRole', CAST(N'2020-01-02T16:02:38.760' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (73, N'AirBnb.Database.Script.Script0007.1 – CreateReservationRequest', CAST(N'2020-01-02T16:03:28.497' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (74, N'AirBnb.Database.Script.Script0007.2 – DeleteReservationRequest', CAST(N'2020-01-02T16:03:28.537' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (75, N'AirBnb.Database.Script.Script0007.3 – UpdateReservationRequest', CAST(N'2020-01-02T16:03:28.550' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (76, N'AirBnb.Database.Script.Script0007.4 – GetAllReservationRequestRenter', CAST(N'2020-01-02T16:03:28.567' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (77, N'AirBnb.Database.Script.Script0007.41 – GetAllReservationRequestRental', CAST(N'2020-01-02T16:03:28.580' AS DateTime))
INSERT [dbo].[SchemaVersions] ([Id], [ScriptName], [Applied]) VALUES (78, N'AirBnb.Database.Script.Script0007.5 – GetReservationRequestById', CAST(N'2020-01-02T16:03:28.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[SchemaVersions] OFF
INSERT [dbo].[SessionStatus] ([id], [status]) VALUES (1, N'ACTIVE')
INSERT [dbo].[SessionStatus] ([id], [status]) VALUES (2, N'CLOSED')
INSERT [dbo].[SessionStatus] ([id], [status]) VALUES (3, N'REVOKED')
INSERT [dbo].[SessionStatus] ([id], [status]) VALUES (4, N'EXPIRED')
INSERT [dbo].[Transactions] ([id], [saleId], [captureId], [status], [saleDate]) VALUES (N'5644b48a-5f09-452d-ac04-14b8976dc87e', 4, N'aasjASD82Y8hsa82732g012swbhgf', N'PENDING', CAST(N'2019-12-18' AS Date))
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__4849DA01FF3539D0]    Script Date: 1/2/20 7:51:09 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95CFA180AD1]    Script Date: 1/2/20 7:51:09 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AirBnbUs__AB6E616436B66F31]    Script Date: 1/2/20 7:51:09 PM ******/
ALTER TABLE [dbo].[AirBnbUser] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__RenterLi__AB6E6164BF364392]    Script Date: 1/2/20 7:51:09 PM ******/
ALTER TABLE [dbo].[RenterList] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AirBnbUser] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Location] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT ((0.0)) FOR [rating]
GO
ALTER TABLE [dbo].[RateSchedule] ADD  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[RateSchedule] ADD  DEFAULT (getdate()) FOR [endDate]
GO
ALTER TABLE [dbo].[RateSchedule] ADD  DEFAULT ((20.00)) FOR [additionalFee]
GO
ALTER TABLE [dbo].[Rental] ADD  DEFAULT ((0.0)) FOR [rating]
GO
ALTER TABLE [dbo].[Rental] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[RentalAgreement] ADD  DEFAULT (getdate()) FOR [checkIn]
GO
ALTER TABLE [dbo].[RentalAgreement] ADD  DEFAULT (getdate()) FOR [checkOut]
GO
ALTER TABLE [dbo].[RentalAgreement] ADD  DEFAULT ((0.0)) FOR [rentalFee]
GO
ALTER TABLE [dbo].[RentalAgreement] ADD  DEFAULT ((0.0)) FOR [cleaningFee]
GO
ALTER TABLE [dbo].[RentalAgreement] ADD  DEFAULT ((1)) FOR [nights]
GO
ALTER TABLE [dbo].[RentalPrice] ADD  DEFAULT ((0.0)) FOR [rentalFee]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [saleDate]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [saleDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([personId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([receiverId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([senderId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([receiverId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[NotificationStatus] ([id])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD FOREIGN KEY([genderId])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_userId_SDAK22102] FOREIGN KEY([userId])
REFERENCES [dbo].[AirBnbUser] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_userId_SDAK22102]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([ratedId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([raterId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([addressId])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD FOREIGN KEY([hostId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[RentalAgreement]  WITH CHECK ADD FOREIGN KEY([hostId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[RentalAgreement]  WITH CHECK ADD FOREIGN KEY([renterId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[RentalPrice]  WITH CHECK ADD FOREIGN KEY([rentalId])
REFERENCES [dbo].[Rental] ([id])
GO
ALTER TABLE [dbo].[RenterList]  WITH CHECK ADD FOREIGN KEY([rentalAgreementId])
REFERENCES [dbo].[RentalAgreement] ([id])
GO
ALTER TABLE [dbo].[RenterList]  WITH CHECK ADD FOREIGN KEY([renterId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([hostId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([rentalAgreementId])
REFERENCES [dbo].[RentalAgreement] ([id])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([rentalId])
REFERENCES [dbo].[Rental] ([id])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([renterId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[SavedRentals]  WITH CHECK ADD FOREIGN KEY([renterId])
REFERENCES [dbo].[Person] ([userId])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([saleId])
REFERENCES [dbo].[Sale] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AddAccountDetails]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAccountDetails]
    @personId UNIQUEIDENTIFIER,
    @phoneNumber VARCHAR(10),
    @aboutMe VARCHAR(8000),
    @profilePathUrl VARCHAR(64),
    @profilePictureURL VARCHAR(64),
    @userName VARCHAR(64)
AS
    INSERT INTO Account(personId, phoneNumber, aboutMe, profilePathUrl, profilePictureURL, userName)
    VALUES (@personId, @phoneNumber, @aboutMe, CONCAT('/', @userName), @profilePictureURL, @userName);
GO
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLocation]
    @id UNIQUEIDENTIFIER,
    @street VARCHAR(128),
    @city VARCHAR(32),
    @state VARCHAR(32),
    @zip VARCHAR(10),
    @isActive INT
AS
    INSERT INTO Location(id, street, city, state, zip)
    VALUES (@id, @street, @city, @state, STR(@zip));
GO
/****** Object:  StoredProcedure [dbo].[AddPerson]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPerson]
    @userId UNIQUEIDENTIFIER,
    @genderId INT,
    @firstName VARCHAR(32),
    @lastName VARCHAR(32),
    @rating FLOAT
AS
    INSERT INTO Person(userId, genderId, firstName, lastName)
    VALUES (@userId, @genderId, @firstName, @lastName);
GO
/****** Object:  StoredProcedure [dbo].[AddRateSchedule]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRateSchedule]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT,
    @rateScheduleId UNIQUEIDENTIFIER,
    @startDate DATETIME,
    @endDate DATETIME,
    @additionalFee FLOAT
AS
    INSERT INTO RateSchedule(rateScheduleId, rentalId, startDate, endDate, additionalFee)
    VALUES (@rateScheduleId, @id, @startDate, @endDate, @additionalFee);
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[AddRental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRental]
    @id UNIQUEIDENTIFIER,
    @title VARCHAR(128),
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT
AS
    INSERT INTO Rental(id, hostId, bedrooms, bathrooms, description, rating, addressId, title)
    VALUES (@id, @hostId, @bedrooms, @bathrooms, @description, @rating, @addressId, @title);
    SELECT * FROM Rental r WHERE r.id = @id;
GO
/****** Object:  StoredProcedure [dbo].[AddRentalPrice]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRentalPrice]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT
AS
    INSERT INTO RentalPrice(rentalId, rentalFee)
    VALUES (@id, @rentalFee);
    SELECT * FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE r.id = @id and rp.rentalId = @id;
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
    @id UNIQUEIDENTIFIER,
    @email VARCHAR(50),
    @roleId INT,
    @salt VARCHAR(10),
    @pword VARCHAR(128)
AS
    INSERT INTO AirBnbUser(id, email, roleId, salt, pword)
    VALUES (@id, @email, @roleId, @salt, @pword);
GO
/****** Object:  StoredProcedure [dbo].[AuthAndGetUserRole]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthAndGetUserRole]
    @email VARCHAR(50),
    @hashpassword VARCHAR(128)
AS
    SELECT u.id, u.email, r.userType, u.isActive FROM AirBnbUser u LEFT JOIN AirBnbRole r ON r.id = u.roleId WHERE email = @email and pword = @hashpassword;
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthenticateUser]
    @email VARCHAR(50),
    @hashpassword VARCHAR(128)
AS
    SELECT COUNT(*) FROM AirBnbUser WHERE email = @email and pword = @hashpassword
GO
/****** Object:  StoredProcedure [dbo].[CreateReservationRequest]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReservationRequest]
    @id UNIQUEIDENTIFIER,
    @rentalId UNIQUEIDENTIFIER,
    @renterId UNIQUEIDENTIFIER,
    @checkIn DATETIME,
    @checkOut DATETIME,
    @message VARCHAR(8000)
AS
    INSERT INTO ReservationRequest(id, rentalId, renterId, checkIn, checkOut, message)
    VALUES (@id, @rentalId, @renterId, @checkIn, @checkOut, @message)
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccountDetailsById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAccountDetailsById]
    @personId UNIQUEIDENTIFIER
AS
    DELETE FROM Account WHERE personId = @personId;
GO
/****** Object:  StoredProcedure [dbo].[DeleteLocation]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLocation]
    @locationId UNIQUEIDENTIFIER
AS
    UPDATE Location set isActive = 0 WHERE id = @locationId;
    SELECT * FROM Location WHERE id = @locationId;
GO
/****** Object:  StoredProcedure [dbo].[DeletePerson]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePerson]
    @id UNIQUEIDENTIFIER
AS
    UPDATE AirBnbUser SET isActive = 0 WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteRental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRental]
    @rentalId UNIQUEIDENTIFIER
AS
    UPDATE Rental SET isActive = 0 WHERE id = @rentalId;
    SELECT * FROM Rental WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[DeleteReservationRequest]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteReservationRequest]
    @id UNIQUEIDENTIFIER
AS
    DELETE FROM ReservationRequest WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
    @id UNIQUEIDENTIFIER
AS
    UPDATE AirBnbUser SET isActive = 0 WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[GetAccountDetailsById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountDetailsById]
    @personId UNIQUEIDENTIFIER
AS
    SELECT * FROM Account WHERE personId = @personId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllAccountDetails]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAccountDetails]
AS

    SELECT * FROM Account;
GO
/****** Object:  StoredProcedure [dbo].[GetAllLocations]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllLocations]
AS
    SELECT * FROM Location
GO
/****** Object:  StoredProcedure [dbo].[GetAllPeople]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPeople]
AS
    SELECT * FROM Person;
GO
/****** Object:  StoredProcedure [dbo].[GetAllRateSchedulesByRental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRateSchedulesByRental]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id as rentalId, nrp.rateScheduleId, r.hostId, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT OUTER JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rentalId = @rentalId) as nrp ON r.id = nrp.rentalId WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllRentalDetails]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRentalDetails]
AS
    SELECT id, hostid, title, bedrooms, bathrooms, description, rating, rentalFee, addressId, isActive FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllRentalPrices]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRentalPrices]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, rp.rentalFee  FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllReservationRequestRental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllReservationRequestRental]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT * FROM ReservationRequest WHERE rentalId = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllReservationRequestRenter]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllReservationRequestRenter]
    @renterId UNIQUEIDENTIFIER
AS
    SELECT * FROM ReservationRequest WHERE renterId = @renterId;
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUsers]
AS
    SELECT * FROM AirBnbUser;
GO
/****** Object:  StoredProcedure [dbo].[GetLocation]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocation]
@locationId UNIQUEIDENTIFIER
AS
    SELECT * FROM Location WHERE id = @locationId;
GO
/****** Object:  StoredProcedure [dbo].[GetPersonById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPersonById]
    @id UNIQUEIDENTIFIER
AS
    SELECT * FROM Person WHERE userId = @id;
GO
/****** Object:  StoredProcedure [dbo].[GetRateSchedule]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRateSchedule]
    @rentalId UNIQUEIDENTIFIER,
    @rateScheduleId UNIQUEIDENTIFIER
AS
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetRentalDetailsById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRentalDetailsById]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT id, hostid, title, bedrooms, bathrooms, description, rating, rentalFee, addressId, isActive FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetRentalPrice]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRentalPrice]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, rp.rentalFee  FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[GetReservationRequestById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReservationRequestById]
    @id UNIQUEIDENTIFIER
AS
    SELECT * FROM ReservationRequest WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[GetUserByEmail]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByEmail]
    @email VARCHAR(50)
AS
    SELECT * FROM AirBnbUser WHERE email = @email;
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserById]
    @id UNIQUEIDENTIFIER
AS
    SELECT * FROM AirBnbUser WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRole]
    @email VARCHAR(50)
AS
    SELECT u.id, u.email, r.userType, u.isActive FROM AirBnbUser u LEFT JOIN AirBnbRole r ON r.id = u.roleId WHERE email = @email
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountDetails]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAccountDetails]
    @personId UNIQUEIDENTIFIER,
    @phoneNumber VARCHAR(10),
    @aboutMe VARCHAR(8000),
    @profilePathUrl VARCHAR(64),
    @profilePictureURL VARCHAR(64),
    @userName VARCHAR(64)
AS
    UPDATE Account
    SET phoneNumber = @phoneNumber, aboutMe = @aboutMe, profilePathUrl = CONCAT('/', @userName), profilePictureUrl = @profilePictureURL, userName = @userName
    WHERE personId = @personId;
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocation]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLocation]
    @locationId UNIQUEIDENTIFIER,
    @street VARCHAR(128),
    @city VARCHAR(32),
    @state VARCHAR(32),
    @zip VARCHAR(10),
    @isActive INT
AS
    UPDATE Location
    SET street = @street, city = @city, state = @state, zip = @zip
    WHERE id = @locationId;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePerson]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePerson]
    @userId UNIQUEIDENTIFIER,
    @genderId INT,
    @firstName VARCHAR(32),
    @lastName VARCHAR(32),
    @rating FLOAT
AS
    UPDATE Person
    SET genderId = @genderId, firstName = @firstName, lastName = @lastName
    WHERE userId = @userId;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRateSchedule]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRateSchedule]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT,
    @rateScheduleId UNIQUEIDENTIFIER,
    @startDate DATETIME,
    @endDate DATETIME,
    @additionalFee FLOAT
AS
    UPDATE RateSchedule
    SET startDate = @startDate, endDate = @endDate, additionalFee = @additionalFee
    WHERE rateScheduleId = @rateScheduleId;
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @id;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRating]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRating]
    @id UNIQUEIDENTIFIER
AS
    UPDATE Person SET rating = (SELECT AVG(score) FROM Rating WHERE ratedId = @id) WHERE userId = @id;
    SELECT * FROM Person WHERE userId = @id;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRental]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRental]
    @rentalId UNIQUEIDENTIFIER,
    @title VARCHAR(128),
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @locationId UNIQUEIDENTIFIER
AS
    UPDATE Rental
    SET title = @title, bedrooms = @bedrooms, bathrooms = @bathrooms, description = @description, rating = @rating
    WHERE id = @rentalId;
    SELECT * FROM Rental WHERE id = @rentalId;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRentalPrice]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRentalPrice]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT
AS
    UPDATE RentalPrice
    SET rentalFee = @rentalFee
    WHERE rentalId = @id;
    SELECT * FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE r.id = @id and rp.rentalId = @id;
GO
/****** Object:  StoredProcedure [dbo].[UpdateReservationRequest]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReservationRequest]
    @id UNIQUEIDENTIFIER,
    @rentalId UNIQUEIDENTIFIER,
    @renterId UNIQUEIDENTIFIER,
    @checkIn DATETIME,
    @checkOut DATETIME,
    @message VARCHAR(8000)
AS
    UPDATE ReservationRequest
    SET checkIn = @checkIn, checkOut = @checkOut, message = @message
    WHERE id = @id and rentalId = @rentalId and renterId = @renterId;
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 1/2/20 7:51:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
    @id UNIQUEIDENTIFIER,
    @email VARCHAR(50),
    @roleId INT,
    @salt VARCHAR(10),
    @pword VARCHAR(128)
AS
    UPDATE AirBnbuser
    SET email = @email, roleId = @roleId, salt = @salt, pword = @pword
    WHERE id = @id;
GO
USE [master]
GO
ALTER DATABASE [AirBnb] SET  READ_WRITE 
GO

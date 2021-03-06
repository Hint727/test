USE [master]
GO
/****** Object:  Database [supermarket]    Script Date: 2021-06-22 21:51:32 ******/
CREATE DATABASE [supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermarket', FILENAME = N'E:\Sql（数据库文件）\DB\supermarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'supermarket_log', FILENAME = N'E:\Sql（数据库文件）\DB\supermarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermarket] SET RECOVERY FULL 
GO
ALTER DATABASE [supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'supermarket', N'ON'
GO
USE [supermarket]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminPwd] [nvarchar](50) NOT NULL,
	[position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commodity]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commodity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](50) NOT NULL,
	[GoodsMoney] [nvarchar](50) NOT NULL,
	[GoodsNum] [int] NOT NULL,
	[GoodsL] [nvarchar](50) NULL,
	[PMuch] [money] NOT NULL,
	[Goodsbh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Commodity_1] PRIMARY KEY CLUSTERED 
(
	[GoodsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserSex] [nvarchar](50) NOT NULL,
	[UserTelephone] [int] NOT NULL,
	[UserCard] [int] NOT NULL,
	[CardDate] [datetime] NOT NULL,
 CONSTRAINT [PK_user_1] PRIMARY KEY CLUSTERED 
(
	[UserCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order O]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order O](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Money] [money] NOT NULL,
	[date] [datetime] NOT NULL,
	[UserCard] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order T]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order T](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[GoodsName] [nvarchar](50) NOT NULL,
	[Num] [int] NOT NULL,
 CONSTRAINT [PK_Order T] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BianHao] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[Purchase] [nvarchar](50) NOT NULL,
	[Num] [nvarchar](50) NOT NULL,
	[PMuch] [money] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([id], [AdminName], [AdminPwd], [position]) VALUES (3002, N'admin', N'123', N'服务员')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[Commodity] ON 

INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4011, N'白菜', N'3', 24, N'食品', 1.0000, N'003')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4010, N'菠菜', N'6', 33, N'食品', 4.0000, N'002')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4014, N'床单', N'60', 0, N'生活用品', 20.0000, N'103')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4012, N'豆角', N'8', 34, N'食品', 6.0000, N'004')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4008, N'番茄', N'5', 49, N'食品', 2.0000, N'001')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4013, N'毛巾', N'10', 20, N'生活用品', 5.0000, N'102')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (5014, N'玩具车', N'15', 20, N'儿童玩具', 5.0000, N'201')
INSERT [dbo].[Commodity] ([id], [GoodsName], [GoodsMoney], [GoodsNum], [GoodsL], [PMuch], [Goodsbh]) VALUES (4009, N'洗发水', N'50', 19, N'生活用品', 30.0000, N'101')
SET IDENTITY_INSERT [dbo].[Commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([id], [UserName], [UserSex], [UserTelephone], [UserCard], [CardDate]) VALUES (3019, N'李四', N'男', 123456789, 46089599, CAST(N'2021-06-22T17:55:14.000' AS DateTime))
INSERT [dbo].[Member] ([id], [UserName], [UserSex], [UserTelephone], [UserCard], [CardDate]) VALUES (3022, N'小红', N'女', 12365402, 411831705, CAST(N'2021-06-22T18:06:12.000' AS DateTime))
INSERT [dbo].[Member] ([id], [UserName], [UserSex], [UserTelephone], [UserCard], [CardDate]) VALUES (3020, N'王五', N'男', 123321456, 527178024, CAST(N'2021-06-22T17:55:30.000' AS DateTime))
INSERT [dbo].[Member] ([id], [UserName], [UserSex], [UserTelephone], [UserCard], [CardDate]) VALUES (3021, N'小明', N'男', 111222333, 550316862, CAST(N'2021-06-22T18:04:51.000' AS DateTime))
INSERT [dbo].[Member] ([id], [UserName], [UserSex], [UserTelephone], [UserCard], [CardDate]) VALUES (3017, N'张三', N'男', 112233445, 696380569, CAST(N'2021-06-22T17:53:06.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Order O] ON 

INSERT [dbo].[Order O] ([id], [UserName], [Money], [date], [UserCard]) VALUES (7040, N'张三', 59.0000, CAST(N'2021-06-22T17:56:42.000' AS DateTime), 696380569)
INSERT [dbo].[Order O] ([id], [UserName], [Money], [date], [UserCard]) VALUES (7041, N'李四', 6.0000, CAST(N'2021-06-22T18:14:34.000' AS DateTime), 46089599)
INSERT [dbo].[Order O] ([id], [UserName], [Money], [date], [UserCard]) VALUES (7042, N'', 13.0000, CAST(N'2021-06-22T18:16:18.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Order O] OFF
GO
SET IDENTITY_INSERT [dbo].[Order T] ON 

INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7056, 7040, N'白菜', 1)
INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7057, 7040, N'洗发水', 1)
INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7058, 7040, N'菠菜', 1)
INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7059, 7041, N'菠菜', 1)
INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7060, 7042, N'豆角', 1)
INSERT [dbo].[Order T] ([id], [OrderID], [GoodsName], [Num]) VALUES (7061, 7042, N'番茄', 1)
SET IDENTITY_INSERT [dbo].[Order T] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5009, N'番茄', N'001', CAST(N'2021-06-22T17:46:44.000' AS DateTime), N'河北省', N'50', 2.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5010, N'洗发水', N'101', CAST(N'2021-06-22T17:47:36.000' AS DateTime), N'河南省', N'20', 30.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5011, N'菠菜', N'002', CAST(N'2021-06-22T17:49:51.000' AS DateTime), N'河北省', N'35', 4.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5012, N'白菜', N'003', CAST(N'2021-06-22T17:51:27.000' AS DateTime), N'甘肃', N'25', 1.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5013, N'豆角', N'004', CAST(N'2021-06-22T17:52:17.000' AS DateTime), N'四川', N'35', 6.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5014, N'毛巾', N'102', CAST(N'2021-06-22T18:02:27.000' AS DateTime), N'北京', N'20', 5.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (5015, N'床单', N'103', CAST(N'2021-06-22T18:12:37.000' AS DateTime), N'四川省', N'0', 20.0000)
INSERT [dbo].[Purchase] ([id], [Name], [BianHao], [date], [Purchase], [Num], [PMuch]) VALUES (6015, N'玩具车', N'201', CAST(N'2021-06-22T21:18:53.000' AS DateTime), N'义务', N'20', 5.0000)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
/****** Object:  Index [IX_Commodity]    Script Date: 2021-06-22 21:51:32 ******/
ALTER TABLE [dbo].[Commodity] ADD  CONSTRAINT [IX_Commodity] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User]    Script Date: 2021-06-22 21:51:32 ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order O]  WITH NOCHECK ADD  CONSTRAINT [FK_Order O_Member] FOREIGN KEY([UserCard])
REFERENCES [dbo].[Member] ([UserCard])
GO
ALTER TABLE [dbo].[Order O] NOCHECK CONSTRAINT [FK_Order O_Member]
GO
ALTER TABLE [dbo].[Order T]  WITH NOCHECK ADD  CONSTRAINT [FK_Order T_Order O] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order O] ([id])
GO
ALTER TABLE [dbo].[Order T] NOCHECK CONSTRAINT [FK_Order T_Order O]
GO
ALTER TABLE [dbo].[Order T]  WITH NOCHECK ADD  CONSTRAINT [FK_Order T_Order T] FOREIGN KEY([GoodsName])
REFERENCES [dbo].[Commodity] ([GoodsName])
GO
ALTER TABLE [dbo].[Order T] NOCHECK CONSTRAINT [FK_Order T_Order T]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [CK_Administrator] CHECK  (([position]='管理员' OR [position]='服务员'))
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [CK_Administrator]
GO
ALTER TABLE [dbo].[Commodity]  WITH CHECK ADD  CONSTRAINT [CK_Commodity] CHECK  (([GoodsNum]>=(0)))
GO
ALTER TABLE [dbo].[Commodity] CHECK CONSTRAINT [CK_Commodity]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [CK_user] CHECK  (([UserSex]='男' OR [UserSex]='女'))
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [CK_user]
GO
USE [master]
GO
ALTER DATABASE [supermarket] SET  READ_WRITE 
GO

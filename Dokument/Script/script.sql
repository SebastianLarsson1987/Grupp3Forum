/****** Object:  Table [dbo].[Category]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeletedUsers]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedUsers](
	[UserUid] [nvarchar](50) NOT NULL,
	[DeletionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeletedUsers] PRIMARY KEY CLUSTERED 
(
	[UserUid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[ThreadId] [int] NOT NULL,
	[UserUId] [varchar](50) NOT NULL,
	[IsReported] [bit] NULL,
	[IsDeleated] [bit] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message_Reply]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message_Reply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[MessageId] [int] NOT NULL,
	[UserUid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Message_Reply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewThread]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewThread](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [varchar](max) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[CreateadAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[UserUid] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Blocked] [bit] NOT NULL,
 CONSTRAINT [PK_NewThread] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedMessages]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedMessages](
	[Uid] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[DelatedAt] [datetime] NOT NULL,
	[ThreadId] [int] NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ReportedMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2022-02-15 14:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Uid] [varchar](50) NOT NULL,
	[UserName] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Banned] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[firstName] [varchar](max) NULL,
	[lastName] [varchar](max) NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Resor')
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Träning')
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Bilar')
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (4, N'Ekonomi')
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (5, N'IT/Datorer')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (1, N'Jag tycker New York är bättre', CAST(N'2022-01-27T14:21:34.813' AS DateTime), CAST(N'2022-01-28T15:55:09.847' AS DateTime), 2, N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (2, N'Vad roligt', CAST(N'2022-01-27T15:15:16.937' AS DateTime), CAST(N'2022-01-27T15:15:16.937' AS DateTime), 2, N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (3, N'Det är klart, när åker vi?', CAST(N'2022-01-28T19:05:23.523' AS DateTime), CAST(N'2022-01-28T19:05:23.523' AS DateTime), 2, N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (4, N'Nej det är för dyrt att åka till USA', CAST(N'2022-01-28T19:09:16.413' AS DateTime), CAST(N'2022-01-28T19:09:16.413' AS DateTime), 2, N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (5, N'Vart i USA hade du tänkt dig?', CAST(N'2022-01-28T19:12:33.793' AS DateTime), CAST(N'2022-01-28T19:12:33.793' AS DateTime), 2, N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (7, N'Jag hänger på om vi åker till New York', CAST(N'2022-01-30T15:13:58.740' AS DateTime), CAST(N'2022-01-30T15:13:58.740' AS DateTime), 2, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (8, N'Test ', CAST(N'2022-01-30T15:16:19.500' AS DateTime), CAST(N'2022-01-30T15:16:19.500' AS DateTime), 2, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (11, N'det vill inte jag', CAST(N'2022-01-31T13:21:59.250' AS DateTime), CAST(N'2022-01-31T13:21:59.250' AS DateTime), 44, N'wwyYmTfXEZShEl5J3IDI7kLx0yH2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (12, N'Test', CAST(N'2022-01-31T13:23:25.637' AS DateTime), CAST(N'2022-01-31T13:23:25.637' AS DateTime), 44, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (13, N'testar', CAST(N'2022-01-31T13:24:40.840' AS DateTime), CAST(N'2022-01-31T13:24:40.840' AS DateTime), 44, N'wwyYmTfXEZShEl5J3IDI7kLx0yH2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (14, N'Test 2', CAST(N'2022-01-31T13:26:42.810' AS DateTime), CAST(N'2022-01-31T13:26:42.810' AS DateTime), 44, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (15, N'Test 3', CAST(N'2022-01-31T13:32:34.500' AS DateTime), CAST(N'2022-01-31T13:32:34.500' AS DateTime), 44, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (17, N'Tycker att Thailand är bra', CAST(N'2022-01-31T14:53:45.943' AS DateTime), CAST(N'2022-01-31T14:53:45.943' AS DateTime), 48, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (18, N'Test', CAST(N'2022-01-31T15:00:43.707' AS DateTime), CAST(N'2022-01-31T15:00:43.707' AS DateTime), 48, N'0001', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (19, N'Tycker inte om USA, för mycket trubbel', CAST(N'2022-01-31T15:10:19.853' AS DateTime), CAST(N'2022-01-31T15:10:19.853' AS DateTime), 2, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (25, N'Test', CAST(N'2022-01-31T15:47:18.213' AS DateTime), CAST(N'2022-01-31T15:47:18.213' AS DateTime), 64, N'0001', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (29, N'super roligt', CAST(N'2022-01-31T15:51:24.517' AS DateTime), CAST(N'2022-01-31T15:51:24.517' AS DateTime), 64, N'rmasaF4JbRTZgnLyOpqvfi9wA2A2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (30, N'Det är smidigt ', CAST(N'2022-01-31T15:52:00.337' AS DateTime), CAST(N'2022-01-31T15:52:00.337' AS DateTime), 64, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (31, N'Träna ben är bäst', CAST(N'2022-01-31T15:52:24.830' AS DateTime), CAST(N'2022-01-31T15:52:24.830' AS DateTime), 64, N'rmasaF4JbRTZgnLyOpqvfi9wA2A2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (32, N'testatr', CAST(N'2022-01-31T23:21:26.117' AS DateTime), CAST(N'2022-01-31T23:21:26.133' AS DateTime), 48, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (33, N'funkar det', CAST(N'2022-01-31T23:22:50.570' AS DateTime), CAST(N'2022-01-31T23:22:50.570' AS DateTime), 48, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (34, N'funkar det', CAST(N'2022-01-31T23:23:02.363' AS DateTime), CAST(N'2022-01-31T23:23:02.363' AS DateTime), 48, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (35, N'testa', CAST(N'2022-01-31T23:28:51.597' AS DateTime), CAST(N'2022-01-31T23:28:51.597' AS DateTime), 48, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (36, N'nu är det dags att åka hem', CAST(N'2022-01-31T23:30:21.843' AS DateTime), CAST(N'2022-01-31T23:30:21.843' AS DateTime), 44, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (37, N'nu är det dags att åka hem', CAST(N'2022-01-31T23:30:58.727' AS DateTime), CAST(N'2022-01-31T23:30:58.727' AS DateTime), 44, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (38, N'mm', CAST(N'2022-01-31T23:32:36.737' AS DateTime), CAST(N'2022-01-31T23:32:36.737' AS DateTime), 48, N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (40, N'detta är ett test', CAST(N'2022-02-01T09:19:33.920' AS DateTime), CAST(N'2022-02-01T09:19:33.923' AS DateTime), 64, N't4Rf8XR9OTa01JX4pbcpEL7lESj1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (41, N'?', CAST(N'2022-02-01T10:28:13.637' AS DateTime), CAST(N'2022-02-07T11:35:49.320' AS DateTime), 48, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (44, N'Testar', CAST(N'2022-02-02T17:00:44.713' AS DateTime), CAST(N'2022-02-04T15:42:42.203' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (45, N'Test 99', CAST(N'2022-02-02T17:02:33.877' AS DateTime), CAST(N'2022-02-02T17:02:33.877' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (46, N'test', CAST(N'2022-02-02T17:03:17.893' AS DateTime), CAST(N'2022-02-02T17:03:17.893' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (47, N'test 22', CAST(N'2022-02-02T17:03:42.963' AS DateTime), CAST(N'2022-02-02T17:03:42.963' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (49, N'testar ', CAST(N'2022-02-02T17:04:51.023' AS DateTime), CAST(N'2022-02-02T17:04:51.023' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (50, N'test', CAST(N'2022-02-02T17:05:24.343' AS DateTime), CAST(N'2022-02-02T17:05:24.343' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (51, N'testar', CAST(N'2022-02-02T17:12:39.683' AS DateTime), CAST(N'2022-02-02T17:12:39.683' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (52, N'testar ', CAST(N'2022-02-02T17:13:45.510' AS DateTime), CAST(N'2022-02-02T17:13:45.510' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (53, N'testar', CAST(N'2022-02-02T17:20:56.647' AS DateTime), CAST(N'2022-02-02T17:20:56.647' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (54, N'många test', CAST(N'2022-02-02T17:22:19.490' AS DateTime), CAST(N'2022-02-02T17:22:19.490' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (55, N'testar att få fram uid', CAST(N'2022-02-02T17:25:09.063' AS DateTime), CAST(N'2022-02-02T17:25:09.063' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (56, N'test', CAST(N'2022-02-02T17:27:26.543' AS DateTime), CAST(N'2022-02-02T17:27:26.543' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (57, N'testar igen', CAST(N'2022-02-02T17:36:41.490' AS DateTime), CAST(N'2022-02-02T17:36:41.490' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (58, N'testar', CAST(N'2022-02-02T17:37:11.970' AS DateTime), CAST(N'2022-02-02T17:37:11.970' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (59, N'testar', CAST(N'2022-02-03T11:38:44.860' AS DateTime), CAST(N'2022-02-03T11:38:44.863' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (61, N'Sällskapsresan kanske', CAST(N'2022-02-03T14:00:57.687' AS DateTime), CAST(N'2022-02-03T14:01:44.203' AS DateTime), 48, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (62, N'Helt klart', CAST(N'2022-02-03T18:20:56.690' AS DateTime), CAST(N'2022-02-03T18:20:56.700' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (63, N'test', CAST(N'2022-02-03T18:37:15.933' AS DateTime), CAST(N'2022-02-03T18:37:15.933' AS DateTime), 48, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (64, N'test', CAST(N'2022-02-04T09:45:05.497' AS DateTime), CAST(N'2022-02-04T09:45:05.497' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', NULL, NULL)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (66, N'det är det verkligen', CAST(N'2022-02-04T11:36:02.570' AS DateTime), CAST(N'2022-02-04T11:36:02.570' AS DateTime), 75, N'YxPCnllzS4hDF7bXDvE5iTerdaB3', NULL, NULL)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (67, N'Någon som säljer en rack?', CAST(N'2022-02-04T13:54:23.983' AS DateTime), CAST(N'2022-02-04T13:54:23.983' AS DateTime), 76, N'vWUacfikswTM15M833DOxVv2ZxU2', NULL, NULL)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (82, N'test', CAST(N'2022-02-07T09:07:08.847' AS DateTime), CAST(N'2022-02-07T09:07:08.847' AS DateTime), 100, N'YxPCnllzS4hDF7bXDvE5iTerdaB3', NULL, NULL)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (83, N'Test 2', CAST(N'2022-02-07T10:12:12.840' AS DateTime), CAST(N'2022-02-07T10:12:12.840' AS DateTime), 101, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (84, N'test', CAST(N'2022-02-07T10:35:30.233' AS DateTime), CAST(N'2022-02-07T10:35:30.233' AS DateTime), 100, N'YxPCnllzS4hDF7bXDvE5iTerdaB3', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (85, N'testar igen', CAST(N'2022-02-07T10:40:44.187' AS DateTime), CAST(N'2022-02-07T10:40:44.187' AS DateTime), 101, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 1, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (86, N'Nej pc är bäst', CAST(N'2022-02-07T10:54:29.090' AS DateTime), CAST(N'2022-02-07T10:54:29.090' AS DateTime), 102, N'HCQVCehDuQMMnMTIZy0ZZKkbrIC2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (87, N'stock go brrr..', CAST(N'2022-02-07T11:36:50.610' AS DateTime), CAST(N'2022-02-07T11:50:01.687' AS DateTime), 96, N'0001', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (88, N'test', CAST(N'2022-02-07T13:36:01.033' AS DateTime), CAST(N'2022-02-07T13:36:01.037' AS DateTime), 91, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (89, N'test', CAST(N'2022-02-08T13:57:48.967' AS DateTime), CAST(N'2022-02-08T13:57:48.970' AS DateTime), 48, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (90, N'Det är bara tillfälligt, allt ordnar sig :)', CAST(N'2022-02-08T14:01:15.987' AS DateTime), CAST(N'2022-02-08T14:01:15.993' AS DateTime), 96, N'vWUacfikswTM15M833DOxVv2ZxU2', NULL, NULL)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (97, N'Gruppadmin har stängt tråden', CAST(N'2022-02-10T09:40:06.887' AS DateTime), CAST(N'2022-02-10T09:40:06.887' AS DateTime), 102, N'HCQVCehDuQMMnMTIZy0ZZKkbrIC2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (98, N'Test ekonomi Main ny test att redigera', CAST(N'2022-02-10T11:55:49.283' AS DateTime), CAST(N'2022-02-11T10:51:29.330' AS DateTime), 105, N'vWUacfikswTM15M833DOxVv2ZxU2', 1, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (100, N'Måste man springa mycket ', CAST(N'2022-02-10T13:54:44.073' AS DateTime), CAST(N'2022-02-10T13:54:44.073' AS DateTime), 137, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (101, N'Wow!', CAST(N'2022-02-10T14:40:57.670' AS DateTime), CAST(N'2022-02-10T14:40:57.670' AS DateTime), 43, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (104, N'test', CAST(N'2022-02-10T15:37:15.963' AS DateTime), CAST(N'2022-02-10T15:37:15.963' AS DateTime), 114, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (105, N'testar', CAST(N'2022-02-10T15:37:20.960' AS DateTime), CAST(N'2022-02-10T15:37:20.960' AS DateTime), 114, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (106, N'Gruppadmin har stängt tråden', CAST(N'2022-02-10T15:38:54.560' AS DateTime), CAST(N'2022-02-10T15:38:54.560' AS DateTime), 139, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (107, N'Gruppadmin har stängt tråden', CAST(N'2022-02-10T15:39:02.283' AS DateTime), CAST(N'2022-02-10T15:39:02.283' AS DateTime), 137, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (109, N'Gruppadmin har stängt tråden', CAST(N'2022-02-10T15:54:49.067' AS DateTime), CAST(N'2022-02-10T15:54:49.070' AS DateTime), 107, N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (111, N'Testar om meddelandet visas i tråden', CAST(N'2022-02-11T11:14:37.393' AS DateTime), CAST(N'2022-02-11T11:14:37.393' AS DateTime), 141, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (112, N'Rolig stad, sämsta befolkningen.', CAST(N'2022-02-11T11:51:46.953' AS DateTime), CAST(N'2022-02-11T11:51:46.953' AS DateTime), 140, N'RjDDeV9D6QgCscXw4qUERk8hCa23', 1, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (114, N'Ksenia gillar att resa', CAST(N'2022-02-11T13:07:06.153' AS DateTime), CAST(N'2022-02-11T13:07:06.153' AS DateTime), 143, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (115, N'Vet inte', CAST(N'2022-02-11T14:29:32.250' AS DateTime), CAST(N'2022-02-11T14:29:32.250' AS DateTime), 144, N'i0S7aiI4muWP5nnaegczIJn38ij2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (116, N'Bitcoin', CAST(N'2022-02-11T14:30:19.830' AS DateTime), CAST(N'2022-02-11T14:30:19.830' AS DateTime), 144, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (119, N'Ny meddelande', CAST(N'2022-02-13T22:14:40.213' AS DateTime), CAST(N'2022-02-13T22:14:40.213' AS DateTime), 141, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (120, N'Gruppadmin har stängt tråden', CAST(N'2022-02-13T22:14:54.567' AS DateTime), CAST(N'2022-02-13T22:14:54.567' AS DateTime), 141, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (121, N'Och jag gillar att resa med :)!', CAST(N'2022-02-13T22:19:17.277' AS DateTime), CAST(N'2022-02-13T22:20:21.747' AS DateTime), 143, N'5rPgUE2qjTfNIbIvGQ8lZcTlnuZ2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (124, N'test2', CAST(N'2022-02-14T09:17:36.987' AS DateTime), CAST(N'2022-02-14T11:47:15.290' AS DateTime), 143, N'0001', 1, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (130, N'funkar det', CAST(N'2022-02-14T11:20:18.353' AS DateTime), CAST(N'2022-02-14T11:20:18.353' AS DateTime), 143, N'0001', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (131, N'Någon som vill hänga med? ', CAST(N'2022-02-14T11:23:29.493' AS DateTime), CAST(N'2022-02-14T11:23:29.493' AS DateTime), 148, N'7sSEBlvy3RNhzwZ1S2SiCxLYrvn1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (132, N'Ja klart, var åker vi', CAST(N'2022-02-14T11:25:33.473' AS DateTime), CAST(N'2022-02-14T11:25:33.473' AS DateTime), 148, N'7sSEBlvy3RNhzwZ1S2SiCxLYrvn1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (134, N'dfhdfhdfh', CAST(N'2022-02-14T11:27:36.073' AS DateTime), CAST(N'2022-02-14T11:27:36.073' AS DateTime), 148, N'0001', 0, 1)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (137, N'Gruppadmin har stängt tråden', CAST(N'2022-02-14T12:02:22.603' AS DateTime), CAST(N'2022-02-14T12:02:22.603' AS DateTime), 148, N'7sSEBlvy3RNhzwZ1S2SiCxLYrvn1', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (142, N'Låter väl roligt?', CAST(N'2022-02-14T14:05:46.673' AS DateTime), CAST(N'2022-02-14T14:05:46.673' AS DateTime), 150, N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (150, N'Gruppadmin har stängt tråden', CAST(N'2022-02-14T15:12:37.670' AS DateTime), CAST(N'2022-02-14T15:12:37.670' AS DateTime), 91, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (151, N'Gruppadmin har stängt tråden', CAST(N'2022-02-14T15:14:16.287' AS DateTime), CAST(N'2022-02-14T15:14:16.287' AS DateTime), 101, N'cec678DlM8bz3Srgg6S2oUbb3nF2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (161, N'Jag tycker ford mustangs elbil verkar vara en trevlig bil', CAST(N'2022-02-15T09:22:45.970' AS DateTime), CAST(N'2022-02-15T09:22:45.970' AS DateTime), 160, N'kehYYM833uPNOMv6OiX929wmUT12', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (162, N'någon som vill hänga med?', CAST(N'2022-02-15T09:36:00.643' AS DateTime), CAST(N'2022-02-15T09:36:00.643' AS DateTime), 161, N'CWnsC5Cow6hyBZ9vSoaNhWmNF4b2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (163, N'jag gillar inte vatten', CAST(N'2022-02-15T09:36:16.063' AS DateTime), CAST(N'2022-02-15T09:36:16.063' AS DateTime), 161, N'ez1SBUsiZgYYUNSUhLkWmOS1lGT2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (164, N'japp!', CAST(N'2022-02-15T09:36:28.150' AS DateTime), CAST(N'2022-02-15T09:36:28.150' AS DateTime), 161, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (165, N'Gruppadmin har stängt tråden', CAST(N'2022-02-15T09:37:30.187' AS DateTime), CAST(N'2022-02-15T09:37:30.187' AS DateTime), 161, N'CWnsC5Cow6hyBZ9vSoaNhWmNF4b2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (166, N'Vad tycker ni om det?', CAST(N'2022-02-15T11:45:54.513' AS DateTime), CAST(N'2022-02-15T11:45:54.513' AS DateTime), 162, N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (167, N'gärna', CAST(N'2022-02-15T11:46:05.740' AS DateTime), CAST(N'2022-02-15T11:46:05.743' AS DateTime), 162, N'kehYYM833uPNOMv6OiX929wmUT12', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (168, N'Jag är på!', CAST(N'2022-02-15T11:46:08.890' AS DateTime), CAST(N'2022-02-15T11:46:08.890' AS DateTime), 162, N'vWUacfikswTM15M833DOxVv2ZxU2', 0, 0)
GO
INSERT [dbo].[Message] ([Id], [Text], [CreatedAt], [UpdatedAt], [ThreadId], [UserUId], [IsReported], [IsDeleated]) VALUES (169, N'Gruppadmin har stängt tråden', CAST(N'2022-02-15T11:47:15.297' AS DateTime), CAST(N'2022-02-15T11:47:15.297' AS DateTime), 162, N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[NewThread] ON 
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (2, N'Någon som vill resa till USA', N'Jag tänkte åka till Los Angeles', CAST(N'2022-01-27T14:12:05.860' AS DateTime), CAST(N'2022-01-27T14:12:05.860' AS DateTime), N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (3, N'Någon som vill resa till USA', N'Jag tänkte åka till Los Angeles', CAST(N'2022-01-27T14:13:20.937' AS DateTime), CAST(N'2022-01-27T14:13:20.937' AS DateTime), N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (5, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:07:54.820' AS DateTime), CAST(N'2022-01-27T23:07:54.820' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (6, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:08:06.610' AS DateTime), CAST(N'2022-01-27T23:08:06.610' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (7, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:08:07.330' AS DateTime), CAST(N'2022-01-27T23:08:07.330' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (8, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:08:07.530' AS DateTime), CAST(N'2022-01-27T23:08:07.530' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (9, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:08:07.860' AS DateTime), CAST(N'2022-01-27T23:08:07.860' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (10, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:08:08.020' AS DateTime), CAST(N'2022-01-27T23:08:08.020' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (11, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:05.130' AS DateTime), CAST(N'2022-01-27T23:09:05.130' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (12, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:08.197' AS DateTime), CAST(N'2022-01-27T23:09:08.197' AS DateTime), N'0001', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (13, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:08.730' AS DateTime), CAST(N'2022-01-27T23:09:08.730' AS DateTime), N'0001', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (14, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:08.917' AS DateTime), CAST(N'2022-01-27T23:09:08.917' AS DateTime), N'0001', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (15, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:24.030' AS DateTime), CAST(N'2022-01-27T23:09:24.030' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (16, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:24.730' AS DateTime), CAST(N'2022-01-27T23:09:24.730' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (17, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:24.937' AS DateTime), CAST(N'2022-01-27T23:09:24.937' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (18, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:25.123' AS DateTime), CAST(N'2022-01-27T23:09:25.123' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (19, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:25.320' AS DateTime), CAST(N'2022-01-27T23:09:25.320' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (20, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:25.507' AS DateTime), CAST(N'2022-01-27T23:09:25.507' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (21, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:25.710' AS DateTime), CAST(N'2022-01-27T23:09:25.710' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (22, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:26.113' AS DateTime), CAST(N'2022-01-27T23:09:26.113' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (23, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:26.310' AS DateTime), CAST(N'2022-01-27T23:09:26.310' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (24, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:26.490' AS DateTime), CAST(N'2022-01-27T23:09:26.490' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (25, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:26.680' AS DateTime), CAST(N'2022-01-27T23:09:26.680' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (26, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:09:26.883' AS DateTime), CAST(N'2022-01-27T23:09:26.883' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (27, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:10:47.857' AS DateTime), CAST(N'2022-01-27T23:10:47.857' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (28, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:10:49.597' AS DateTime), CAST(N'2022-01-27T23:10:49.597' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (29, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:10:49.997' AS DateTime), CAST(N'2022-01-27T23:10:49.997' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (30, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:10:50.197' AS DateTime), CAST(N'2022-01-27T23:10:50.197' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (31, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:56.583' AS DateTime), CAST(N'2022-01-27T23:11:56.583' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (32, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:58.497' AS DateTime), CAST(N'2022-01-27T23:11:58.497' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (33, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:58.680' AS DateTime), CAST(N'2022-01-27T23:11:58.680' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (34, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:59.050' AS DateTime), CAST(N'2022-01-27T23:11:59.050' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (35, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:59.237' AS DateTime), CAST(N'2022-01-27T23:11:59.237' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (36, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:11:59.640' AS DateTime), CAST(N'2022-01-27T23:11:59.640' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (37, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:12:19.837' AS DateTime), CAST(N'2022-01-27T23:12:19.837' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (38, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:12:21.263' AS DateTime), CAST(N'2022-01-27T23:12:21.263' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (39, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:12:21.450' AS DateTime), CAST(N'2022-01-27T23:12:21.450' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (40, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:13:17.663' AS DateTime), CAST(N'2022-01-27T23:13:17.663' AS DateTime), N'0001', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (41, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:15:19.927' AS DateTime), CAST(N'2022-01-27T23:15:19.927' AS DateTime), N'0001', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (42, N'Hej', N'Det här är Mitt första meddelande här, vad kul!', CAST(N'2022-01-27T23:15:21.700' AS DateTime), CAST(N'2022-01-27T23:15:21.700' AS DateTime), N'0001', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (43, N'Hej', N'Första meddelandet!', CAST(N'2022-01-27T23:46:08.157' AS DateTime), CAST(N'2022-01-27T23:46:08.157' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (44, N'Jag vill åka hem', N'Vänligen, Markoolio', CAST(N'2022-01-27T23:48:23.280' AS DateTime), CAST(N'2022-01-27T23:48:23.280' AS DateTime), N'0001', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (46, N'Oj!', N'testilitest', CAST(N'2022-01-28T00:08:10.757' AS DateTime), CAST(N'2022-01-28T00:08:10.757' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (47, N'Från dev!', N'Wopwop!', CAST(N'2022-01-28T00:16:21.803' AS DateTime), CAST(N'2022-01-28T00:16:21.807' AS DateTime), N'0001', 5, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (48, N'Den stora tråden om Thailand', N'Vad tycker ni om Thailand?', CAST(N'2022-01-31T14:36:37.097' AS DateTime), CAST(N'2022-01-31T14:36:37.140' AS DateTime), N'0001', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (64, N'Gymträning', N'Vad tycker ni om att träna på Gym?', CAST(N'2022-01-31T15:44:20.173' AS DateTime), CAST(N'2022-01-31T15:44:20.173' AS DateTime), N'0001', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (74, N'Finns m3', N'I el?', CAST(N'2022-01-31T15:53:49.500' AS DateTime), CAST(N'2022-01-31T15:53:49.500' AS DateTime), N'rmasaF4JbRTZgnLyOpqvfi9wA2A2', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (75, N'Badminton', N'badminton är kul', CAST(N'2022-02-01T10:07:11.203' AS DateTime), CAST(N'2022-02-01T10:07:11.203' AS DateTime), N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (76, N'Badminton', N'badminton är kul', CAST(N'2022-02-01T10:07:18.910' AS DateTime), CAST(N'2022-02-01T10:07:18.910' AS DateTime), N'w1WKuWbt0IRtETEPt1SKKtXztwz1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (78, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:15.913' AS DateTime), CAST(N'2022-02-01T17:34:15.913' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (79, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:17.667' AS DateTime), CAST(N'2022-02-01T17:34:17.667' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (80, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:18.277' AS DateTime), CAST(N'2022-02-01T17:34:18.277' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (81, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:18.437' AS DateTime), CAST(N'2022-02-01T17:34:18.437' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (82, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:18.617' AS DateTime), CAST(N'2022-02-01T17:34:18.617' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (83, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:18.787' AS DateTime), CAST(N'2022-02-01T17:34:18.787' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (84, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:21.440' AS DateTime), CAST(N'2022-02-01T17:34:21.440' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (85, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:21.603' AS DateTime), CAST(N'2022-02-01T17:34:21.603' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (86, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:21.763' AS DateTime), CAST(N'2022-02-01T17:34:21.763' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (87, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:21.930' AS DateTime), CAST(N'2022-02-01T17:34:21.930' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (88, N'Spara på ISK eller KF?', N'Vad är egentligen fördelen med resp?', CAST(N'2022-02-01T17:34:22.110' AS DateTime), CAST(N'2022-02-01T17:34:22.110' AS DateTime), N'k5ZZrFetLZdatidgEE1htsszEdB3', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (91, N'Test', N'test', CAST(N'2022-02-03T13:13:24.283' AS DateTime), CAST(N'2022-02-03T13:13:24.283' AS DateTime), N'cec678DlM8bz3Srgg6S2oUbb3nF2', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (96, N'Aktiemarknaden faller? ', N'Nejdå', CAST(N'2022-02-03T13:22:38.747' AS DateTime), CAST(N'2022-02-03T13:22:38.747' AS DateTime), N'0001', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (100, N'Skåne', N'jag gillar helsingborg', CAST(N'2022-02-05T10:28:52.887' AS DateTime), CAST(N'2022-02-05T10:28:52.887' AS DateTime), N'YxPCnllzS4hDF7bXDvE5iTerdaB3', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (101, N'Test2', N'Testar2', CAST(N'2022-02-07T10:11:57.127' AS DateTime), CAST(N'2022-02-07T10:11:57.130' AS DateTime), N'cec678DlM8bz3Srgg6S2oUbb3nF2', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (102, N'Mac', N'Mac är bäst', CAST(N'2022-02-07T10:54:11.840' AS DateTime), CAST(N'2022-02-07T10:54:11.840' AS DateTime), N'HCQVCehDuQMMnMTIZy0ZZKkbrIC2', 5, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (104, N'string', N'string', CAST(N'2022-02-10T11:51:40.353' AS DateTime), CAST(N'2022-02-10T11:51:40.353' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (105, N'NyTestEkonomiTråd', N'Test ekonomi Main', CAST(N'2022-02-10T11:54:55.510' AS DateTime), CAST(N'2022-02-10T11:54:55.510' AS DateTime), N'vWUacfikswTM15M833DOxVv2ZxU2', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (106, N'Cykla är nyttigare!', N'eller är jag helt ute och cyklar?', CAST(N'2022-02-10T13:10:10.163' AS DateTime), CAST(N'2022-02-10T13:10:10.163' AS DateTime), N'vWUacfikswTM15M833DOxVv2ZxU2', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (107, N'Sydafrika är fint', N'Ja det är det', CAST(N'2022-02-10T13:15:24.347' AS DateTime), CAST(N'2022-02-10T13:15:24.347' AS DateTime), N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (108, N'saas', N'asasas', CAST(N'2022-02-10T13:20:07.030' AS DateTime), CAST(N'2022-02-10T13:20:07.030' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (109, N'saas', N'asasas', CAST(N'2022-02-10T13:20:08.400' AS DateTime), CAST(N'2022-02-10T13:20:08.400' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (110, N'saas', N'asasas', CAST(N'2022-02-10T13:20:09.343' AS DateTime), CAST(N'2022-02-10T13:20:09.343' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (111, N'saas', N'asasas', CAST(N'2022-02-10T13:20:09.343' AS DateTime), CAST(N'2022-02-10T13:20:09.343' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (112, N'saas', N'asasas', CAST(N'2022-02-10T13:20:09.520' AS DateTime), CAST(N'2022-02-10T13:20:09.520' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (113, N'saas', N'asasas', CAST(N'2022-02-10T13:20:09.707' AS DateTime), CAST(N'2022-02-10T13:20:09.707' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (114, N'saas', N'asasas', CAST(N'2022-02-10T13:20:09.900' AS DateTime), CAST(N'2022-02-10T13:20:09.900' AS DateTime), N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (115, N'test', N'test', CAST(N'2022-02-10T13:21:19.763' AS DateTime), CAST(N'2022-02-10T13:21:19.763' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (116, N'test', N'test', CAST(N'2022-02-10T13:21:22.400' AS DateTime), CAST(N'2022-02-10T13:21:22.400' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (117, N'test', N'test', CAST(N'2022-02-10T13:21:22.850' AS DateTime), CAST(N'2022-02-10T13:21:22.850' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (118, N'test', N'test', CAST(N'2022-02-10T13:21:23.027' AS DateTime), CAST(N'2022-02-10T13:21:23.027' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (119, N'test', N'test', CAST(N'2022-02-10T13:21:23.210' AS DateTime), CAST(N'2022-02-10T13:21:23.210' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (120, N'test', N'test', CAST(N'2022-02-10T13:21:23.373' AS DateTime), CAST(N'2022-02-10T13:21:23.373' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 2, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (121, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:03.027' AS DateTime), CAST(N'2022-02-10T13:22:03.027' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (122, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:08.227' AS DateTime), CAST(N'2022-02-10T13:22:08.227' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (123, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:29.060' AS DateTime), CAST(N'2022-02-10T13:22:29.060' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (124, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:29.737' AS DateTime), CAST(N'2022-02-10T13:22:29.737' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (125, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:29.943' AS DateTime), CAST(N'2022-02-10T13:22:29.943' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (126, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:30.120' AS DateTime), CAST(N'2022-02-10T13:22:30.120' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (127, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:30.307' AS DateTime), CAST(N'2022-02-10T13:22:30.307' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (128, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:36.087' AS DateTime), CAST(N'2022-02-10T13:22:36.087' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (129, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:36.317' AS DateTime), CAST(N'2022-02-10T13:22:36.317' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (130, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:36.517' AS DateTime), CAST(N'2022-02-10T13:22:36.517' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (131, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:38.267' AS DateTime), CAST(N'2022-02-10T13:22:38.267' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (132, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:38.837' AS DateTime), CAST(N'2022-02-10T13:22:38.837' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (133, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:39.043' AS DateTime), CAST(N'2022-02-10T13:22:39.043' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (134, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:43.727' AS DateTime), CAST(N'2022-02-10T13:22:43.727' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (135, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:43.893' AS DateTime), CAST(N'2022-02-10T13:22:43.893' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (136, N'verker ej fungera', N'nej nej', CAST(N'2022-02-10T13:22:48.943' AS DateTime), CAST(N'2022-02-10T13:22:48.943' AS DateTime), N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (137, N'Marathonträning', N'Måste man springa mycket ', CAST(N'2022-02-10T13:54:43.693' AS DateTime), CAST(N'2022-02-10T13:54:43.693' AS DateTime), N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 2, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (139, N'Fotboll', N'test', CAST(N'2022-02-10T15:36:23.537' AS DateTime), CAST(N'2022-02-10T15:36:23.540' AS DateTime), N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (140, N'Stockholm', N'nej, jag vill inte åka dit', CAST(N'2022-02-10T15:42:51.413' AS DateTime), CAST(N'2022-02-10T15:42:51.413' AS DateTime), N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (141, N'TestKsenia Intervallträning', N'Testar om meddelandet visas i tråden', CAST(N'2022-02-11T11:14:36.903' AS DateTime), CAST(N'2022-02-11T11:14:36.907' AS DateTime), N'vWUacfikswTM15M833DOxVv2ZxU2', 2, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (143, N'TestKseniaResor', N'Ksenia gillar att resa', CAST(N'2022-02-11T13:07:05.657' AS DateTime), CAST(N'2022-02-11T13:07:05.657' AS DateTime), N'vWUacfikswTM15M833DOxVv2ZxU2', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (144, N'Hur tjänar man pengar lättast ', N'Vet inte', CAST(N'2022-02-11T14:29:31.997' AS DateTime), CAST(N'2022-02-11T14:29:31.997' AS DateTime), N'i0S7aiI4muWP5nnaegczIJn38ij2', 4, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (148, N'Backpacking', N'Någon som vill hänga med? ', CAST(N'2022-02-14T11:23:29.330' AS DateTime), CAST(N'2022-02-14T11:23:29.330' AS DateTime), N'7sSEBlvy3RNhzwZ1S2SiCxLYrvn1', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (150, N'Tågluffa', N'Låter väl roligt?', CAST(N'2022-02-14T14:05:46.567' AS DateTime), CAST(N'2022-02-14T14:05:46.567' AS DateTime), N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', 1, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (160, N'Vilken är din favoritbil', N'Jag tycker ford mustangs elbil verkar vara en trevlig bil', CAST(N'2022-02-15T09:22:45.850' AS DateTime), CAST(N'2022-02-15T09:22:45.850' AS DateTime), N'kehYYM833uPNOMv6OiX929wmUT12', 3, 0)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (161, N'Åka båt', N'någon som vill hänga med?', CAST(N'2022-02-15T09:36:00.530' AS DateTime), CAST(N'2022-02-15T09:36:00.530' AS DateTime), N'CWnsC5Cow6hyBZ9vSoaNhWmNF4b2', 1, 1)
GO
INSERT [dbo].[NewThread] ([Id], [Topic], [Text], [CreateadAt], [UpdatedAt], [UserUid], [CategoryId], [Blocked]) VALUES (162, N'Åka jorden runt', N'Vad tycker ni om det?', CAST(N'2022-02-15T11:45:54.350' AS DateTime), CAST(N'2022-02-15T11:45:54.350' AS DateTime), N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[NewThread] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportedMessages] ON 
GO
INSERT [dbo].[ReportedMessages] ([Uid], [Email], [DelatedAt], [ThreadId], [Text], [Id]) VALUES (N'kehYYM833uPNOMv6OiX929wmUT12', N'sebastian@larsson.com', CAST(N'2022-02-13T19:48:35.183' AS DateTime), 145, N'Jag vill helst resa till Dubai', 1)
GO
INSERT [dbo].[ReportedMessages] ([Uid], [Email], [DelatedAt], [ThreadId], [Text], [Id]) VALUES (N'kehYYM833uPNOMv6OiX929wmUT12', N'sebastian@larsson.com', CAST(N'2022-02-13T22:40:14.487' AS DateTime), 145, N'test', 2)
GO
INSERT [dbo].[ReportedMessages] ([Uid], [Email], [DelatedAt], [ThreadId], [Text], [Id]) VALUES (N'kehYYM833uPNOMv6OiX929wmUT12', N'sebastian@larsson.com', CAST(N'2022-02-14T09:13:30.803' AS DateTime), 145, N'funkar det inte', 3)
GO
INSERT [dbo].[ReportedMessages] ([Uid], [Email], [DelatedAt], [ThreadId], [Text], [Id]) VALUES (N'kehYYM833uPNOMv6OiX929wmUT12', N'sebastian@larsson.com', CAST(N'2022-02-14T11:06:35.850' AS DateTime), 147, N'ja', 4)
GO
INSERT [dbo].[ReportedMessages] ([Uid], [Email], [DelatedAt], [ThreadId], [Text], [Id]) VALUES (N'cE7N3jUW8IVKGX1LZzmO8HnH0Pa2', N'admin@admin.com', CAST(N'2022-02-14T11:50:40.903' AS DateTime), 148, N'jag hatar snigel', 5)
GO
SET IDENTITY_INSERT [dbo].[ReportedMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'RegularUser')
GO
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'0001', N'Borttagen', N'admin@grupp3forum.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'0Pd6vJn95RVX3fV3E8LlhJBhVbw1', N'fredrik', N'fredrik@test.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'2R8EjMTOpWOa3A5Fzhxiv9tHQXk1', N'Nyttkonto', N'nyttkonto@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'5rPgUE2qjTfNIbIvGQ8lZcTlnuZ2', N'ksenia', N'ksenia@ks.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'7sSEBlvy3RNhzwZ1S2SiCxLYrvn1', N'ar9', N'a9@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'8zcglNmgJ8b2S9dedA2GmCsWzrI3', N'Sebastian', N'sebbe@sebb.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'cec678DlM8bz3Srgg6S2oUbb3nF2', N'armin', N'a22@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'CWnsC5Cow6hyBZ9vSoaNhWmNF4b2', N'a4', N'a4@gmail.com', 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'dupqy17RwxcWIDDbPWS1smBTVYh1', N'a0', N'a0@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'e8ERhjSyy1VUuDgyS8zZuFxZnpF2', N'Fredrik', N'mrt86@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'eRowAxI7ENR5Pq1S9qSO3wXG2X23', N'dsadsa', N'cvxvc@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'ez1SBUsiZgYYUNSUhLkWmOS1lGT2', N'a', N'ab@gmail.com', 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'EZxJ5PFsLWaKGcZZA0Cab60Qof93', N'attTAbort', N'tabort@bort.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'Fsao1SwUlZXqT7t6n7NZFtSLgPG2', N'admin', N'admin2@admin.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'gVkD0eqgJcSY9dKHIbrXvH2rjBQ2', N'armin2', N'a33@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'HCQVCehDuQMMnMTIZy0ZZKkbrIC2', N'larsson', N'larsson@larsson.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'i0S7aiI4muWP5nnaegczIJn38ij2', N'sebbe', N'seb@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'k5ZZrFetLZdatidgEE1htsszEdB3', N'Fredrik123', N'fredrik123@hotmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'kehYYM833uPNOMv6OiX929wmUT12', N'Sebastian', N'sebastian@larsson.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'LgKgnLVsRCZblwxxJsN1PZQ4CfG2', N'a0', N'a0@gmail.com', 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'mD4IUCR5SiaweeXzrV1MFskbd5S2', N's', N's@s.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'mTP5ac6wA6fhbHFVEYfTymR4rW22', N'a2222', N'a2222@gmail.com', 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'nCHplPiyzzRx9sYTl3vME8BmhPj1', N'seblarsson', N'seblarsson@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'RjDDeV9D6QgCscXw4qUERk8hCa23', N'Calle', N'calle@mail.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'rmasaF4JbRTZgnLyOpqvfi9wA2A2', N'arnegym', N'gysdmds@hotmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'SVyMV3LQEgYyGViRBWHNfc9xUPo1', N'Fredrik', N'fredrik1@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N't4Rf8XR9OTa01JX4pbcpEL7lESj1', N'testtest123', N'test123@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'tvUkZiiyttfAU25ElMeJWkhKUnT2', N'armin2', N'a092@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'u6EYlcEWC2W3DF3F7jIYnS5bFyh2', N'Apan', N'apan@hotmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'UKhUnTJkfvShG79K8LDVmABICtA2', N'sdaadsdsa', N'sdasdassa@live.se', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'uzZ1IeDkzYaZvth0WVwYNpEtAi82', N'armin55', N'a55@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'vWUacfikswTM15M833DOxVv2ZxU2', N'ks', N'ks1@ks.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'vXQMAGhDj8XpZgzk0qxuHXr1GSY2', N'admin', N'admin@admin.com', 0, 2, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'w1WKuWbt0IRtETEPt1SKKtXztwz1', N'sebbe', N'se@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'wwyYmTfXEZShEl5J3IDI7kLx0yH2', N's', N's@gmail.com', 0, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Uid], [UserName], [Email], [Banned], [RoleId], [firstName], [lastName]) VALUES (N'YxPCnllzS4hDF7bXDvE5iTerdaB3', N'se', N'sebbe@gmail.com', 0, 1, NULL, NULL)
GO
ALTER TABLE [dbo].[NewThread] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Blocked]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_NewThread] FOREIGN KEY([ThreadId])
REFERENCES [dbo].[NewThread] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_NewThread]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Users] FOREIGN KEY([UserUId])
REFERENCES [dbo].[Users] ([Uid])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Users]
GO
ALTER TABLE [dbo].[Message_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Message_Reply_Message] FOREIGN KEY([MessageId])
REFERENCES [dbo].[Message] ([Id])
GO
ALTER TABLE [dbo].[Message_Reply] CHECK CONSTRAINT [FK_Message_Reply_Message]
GO
ALTER TABLE [dbo].[Message_Reply]  WITH CHECK ADD  CONSTRAINT [FK_Message_Reply_Users] FOREIGN KEY([UserUid])
REFERENCES [dbo].[Users] ([Uid])
GO
ALTER TABLE [dbo].[Message_Reply] CHECK CONSTRAINT [FK_Message_Reply_Users]
GO
ALTER TABLE [dbo].[NewThread]  WITH CHECK ADD  CONSTRAINT [FK_NewThread_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[NewThread] CHECK CONSTRAINT [FK_NewThread_Category]
GO
ALTER TABLE [dbo].[NewThread]  WITH CHECK ADD  CONSTRAINT [FK_NewThread_Users] FOREIGN KEY([UserUid])
REFERENCES [dbo].[Users] ([Uid])
GO
ALTER TABLE [dbo].[NewThread] CHECK CONSTRAINT [FK_NewThread_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO

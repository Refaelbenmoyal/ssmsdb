USE [MoviesDB]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 11/01/2021 21:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11/01/2021 21:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 11/01/2021 21:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ReleaseDate] [date] NULL,
	[Genres_ID] [bigint] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies_Actors]    Script Date: 11/01/2021 21:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies_Actors](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MovieID] [bigint] NULL,
	[ActorID] [bigint] NULL,
 CONSTRAINT [PK_Movies_Actors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([ID], [Name], [BirthDate]) VALUES (1, N'alon', CAST(N'1960-01-01' AS Date))
INSERT [dbo].[Actors] ([ID], [Name], [BirthDate]) VALUES (2, N'rami', CAST(N'1990-02-02' AS Date))
INSERT [dbo].[Actors] ([ID], [Name], [BirthDate]) VALUES (3, N'adi', CAST(N'1980-03-03' AS Date))
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([ID], [Name]) VALUES (1, N'comedy')
INSERT [dbo].[Genres] ([ID], [Name]) VALUES (2, N'drama')
INSERT [dbo].[Genres] ([ID], [Name]) VALUES (3, N'action')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([ID], [Name], [ReleaseDate], [Genres_ID]) VALUES (1, N'lionking', CAST(N'1990-01-01' AS Date), 2)
INSERT [dbo].[Movies] ([ID], [Name], [ReleaseDate], [Genres_ID]) VALUES (2, N'spiderman', CAST(N'1995-02-02' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies_Actors] ON 

INSERT [dbo].[Movies_Actors] ([ID], [MovieID], [ActorID]) VALUES (1, 1, 3)
INSERT [dbo].[Movies_Actors] ([ID], [MovieID], [ActorID]) VALUES (2, 2, 2)
INSERT [dbo].[Movies_Actors] ([ID], [MovieID], [ActorID]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [dbo].[Movies_Actors] OFF
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Movies] FOREIGN KEY([ID])
REFERENCES [dbo].[Movies] ([ID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Movies]
GO

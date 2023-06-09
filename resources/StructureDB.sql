USE [master]
GO
CREATE DATABASE [CoursesOnline];
GO
ALTER DATABASE [CoursesOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoursesOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoursesOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoursesOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoursesOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoursesOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoursesOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoursesOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoursesOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoursesOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoursesOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoursesOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoursesOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoursesOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoursesOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CoursesOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoursesOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoursesOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoursesOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoursesOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoursesOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoursesOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoursesOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [CoursesOnline] SET  MULTI_USER 
GO
ALTER DATABASE [CoursesOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoursesOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoursesOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoursesOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoursesOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoursesOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoursesOnline', N'ON'
GO
ALTER DATABASE [CoursesOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [CoursesOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CoursesOnline];
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/6/2023 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student] [nvarchar](500) NULL,
	[Score] [int] NULL,
	[Comment] [nvarchar](500) NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 6/6/2023 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/6/2023 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[DatePublish] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 6/6/2023 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 6/6/2023 5:38:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrentPrice] [money] NULL,
	[Promocion] [money] NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([Titulo], [Description], [DatePublish]) VALUES (N'React Js', N'React Js description', NULL)
INSERT [dbo].[Courses] ([Titulo], [Description], [DatePublish]) VALUES (N'C#', N'Book', NULL)
INSERT [dbo].[Courses] ([Titulo], [Description], [DatePublish]) VALUES (N'C# with EF', N'Book', NULL)
INSERT [dbo].[Courses] ([Titulo], [Description], [DatePublish]) VALUES (N'Ruby on Rails', N'Book', NULL)
GO

INSERT [dbo].[Instructor] ([Name], [FirstName], [Grade], [Photo]) VALUES (N'Vaxi', N'Drez', N'Master', NULL)
INSERT [dbo].[Instructor] ([Name], [FirstName], [Grade], [Photo]) VALUES (N'Nestor', N'Arcila', N'Ingeniero', NULL)
INSERT [dbo].[Instructor] ([Name], [FirstName], [Grade], [Photo]) VALUES (N'Angela', N'Ortiz', N'Tecnico', NULL)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (1, 1)
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (1, 3)
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (2, 1)
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (3, 2)
GO
INSERT [dbo].[Price] ([CurrentPrice], [Promocion], [CourseId]) VALUES (150.0000, 100.0000, 1)
INSERT [dbo].[Price] ([CurrentPrice], [Promocion], [CourseId]) VALUES (200.0000, 150.0000, 2)
INSERT [dbo].[Price] ([CurrentPrice], [Promocion], [CourseId]) VALUES (300.0000, 200.0000, 3)
GO
INSERT [dbo].[Comments] ([Student], [Score], [Comment], [CourseId]) VALUES (N'Franz Nilo', 5, N'The best course', 1)
INSERT [dbo].[Comments] ([Student], [Score], [Comment], [CourseId]) VALUES (N' Luz Huan', 4, N'Falto ejemplos', 1)
INSERT [dbo].[Comments] ([Student], [Score], [Comment], [CourseId]) VALUES (N'Clara Fork', 5, N'Reforso las bases', 1)
INSERT [dbo].[Comments] ([Student], [Score], [Comment], [CourseId]) VALUES (N'Samuel J', 5, N'Excelente', 1)
INSERT [dbo].[Comments] ([Student], [Score], [Comment], [CourseId]) VALUES (N'Noemi Chui', 5, N'Muy bueno', 2)
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Course_ID] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Course_ID]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Course_Id] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Course_Id]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Instructor_Id] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Instructor_Id]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_PRICE_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_PRICE_Courses]
GO
USE [master]
GO
ALTER DATABASE [CoursesOnline] SET  READ_WRITE 
GO

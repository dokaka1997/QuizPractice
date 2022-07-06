USE [master]
GO
/****** Object:  Database [QuizPracticeSystem]    Script Date: 7/3/2022 1:59:26 AM ******/
CREATE DATABASE [QuizPracticeSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizPracticeSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuizPracticeSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizPracticeSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuizPracticeSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuizPracticeSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizPracticeSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizPracticeSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizPracticeSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizPracticeSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuizPracticeSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizPracticeSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [QuizPracticeSystem] SET  MULTI_USER 
GO
ALTER DATABASE [QuizPracticeSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizPracticeSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizPracticeSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizPracticeSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizPracticeSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizPracticeSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizPracticeSystem', N'ON'
GO
ALTER DATABASE [QuizPracticeSystem] SET QUERY_STORE = OFF
GO
USE [QuizPracticeSystem]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[optionId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NULL,
	[content] [ntext] NULL,
	[isCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[optionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NULL,
	[content] [ntext] NULL,
	[media] [ntext] NULL,
	[explanation] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[quizName] [nvarchar](256) NULL,
	[ownerId] [int] NULL,
	[thumbnail] [ntext] NULL,
	[quizDuration] [int] NULL,
	[numberQuestion] [int] NULL,
	[subjectId] [int] NULL,
	[quizLevelId] [int] NULL,
	[description] [ntext] NULL,
	[dateCreated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizLevel]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizLevel](
	[quizLevelId] [int] IDENTITY(1,1) NOT NULL,
	[quizLevelName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[quizLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizResult]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizResult](
	[quizResultId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[quizId] [int] NULL,
	[score] [int] NULL,
	[time] [int] NULL,
	[submitAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentWork]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentWork](
	[studentWorkId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[quizResultId] [int] NULL,
	[questionId] [int] NULL,
	[optionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](256) NULL,
	[thumbnail] [ntext] NULL,
	[description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](256) NULL,
	[email] [nvarchar](256) NULL,
	[password] [nvarchar](256) NULL,
	[avatar] [ntext] NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[roleId] [int] NULL,
	[status] [bit] NULL,
	[code] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/3/2022 1:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (2, 3, N'Steve Jobs', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (3, 3, N'James Gosling', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (4, 3, N' Dennis Ritchie', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (5, 3, N'Rasmus Lerdorf', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (6, 4, N'int number;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (8, 4, N'float rate;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (9, 4, N'int variable_count;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (10, 4, N'int $main;', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (12, 5, N'LowerCase letters', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (13, 5, N'UpperCase letters', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (14, 5, N'CamelCase letters', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (15, 5, N'None of the mentioned', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (16, 6, N'They can contain alphanumeric characters as well as special characters', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (17, 6, N' It is not an error to declare a variable to be one of the keywords(like goto, static)', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (18, 6, N'Variable names cannot start with a digit', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (19, 6, N'Variable can be of any length', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (20, 7, N'int my_num = 100,000;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (21, 7, N'int my_num = 100000;', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (22, 7, N'int my num = 1000;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (23, 7, N'int $my_num = 10000;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (24, 8, N'volatile', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (25, 8, N'true', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (26, 8, N'friend', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (27, 8, N'export', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (28, 9, N'The basic data type of C', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (29, 9, N'Qualifier', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (30, 9, N'Short is the qualifier and int is the basic data type', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (31, 9, N'All of the mentioned', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (32, 10, N'String str;', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (33, 10, N'char *str;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (34, 10, N'float str = 3e2;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (35, 10, N'Both String str; & float str = 3e2;', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (36, 11, N'immutable', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (37, 11, N'mutable', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (38, 11, N'const', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (39, 11, N'volatile', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (40, 12, N'True or False', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (41, 12, N'0 or 1', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (42, 12, N'0 if an expression is false and any positive number if an expression is true', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (43, 12, N'None of the mentioned', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (44, 13, N'SmallTalk', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (45, 13, N'C++', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (46, 13, N'Kotlin', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (47, 13, N'Java', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (51, 17, N'Adele Goldberg', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (52, 17, N'Dennis Ritchie', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (53, 17, N'Alan Kay', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (54, 17, N'Andrea Ferro', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (55, 18, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (56, 18, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (57, 18, N'Exception', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (58, 18, N'Abstraction', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (59, 20, N'Abstraction', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (60, 20, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (61, 20, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (62, 20, N'Inheritance', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (63, 21, N'C++ programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (64, 21, N'Java programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (65, 21, N'Ada programming language', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (66, 21, N'C# programming language', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (67, 22, N'Modularity', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (68, 22, N'Efficient Code', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (69, 22, N'Code reusability', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (70, 22, N'Duplicate or Redundant Data', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (71, 23, N'Inheritance', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (72, 23, N'Data hiding', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (73, 23, N'Encapsulation', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (74, 23, N'Polymorphism', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (75, 24, N'Smalltalk', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (76, 24, N'Kotlin', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (78, 24, N'Java', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (79, 24, N'C++', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (80, 25, N'Only 1', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (81, 25, N'Only 999', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (82, 25, N'Only 100', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (83, 25, N'Any number', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (84, 26, N'Overloading <<', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (85, 26, N'Overloading &&', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (86, 26, N'Overloading | |', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (87, 26, N'Overloading +=', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (88, 27, N'Ablation', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (89, 27, N'Galling', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (90, 27, N'Creep', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (91, 27, N'Plucking', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (92, 28, N'Ptolemy', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (93, 28, N'Copernicus', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (94, 28, N'Aristotle', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (95, 28, N'Strabo', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (96, 29, N'One Degree', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (97, 29, N'One Mile', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (98, 29, N'One Nautical Mile', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (99, 29, N'One mach', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (100, 30, N'Norway', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (101, 30, N'Sweden', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (102, 30, N'India', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (103, 30, N'Cuba', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (104, 31, N'China North Korea', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (105, 31, N'Iran Pakistan', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (106, 31, N'Iran Iraq', 0)
GO
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (107, 31, N'Pakistan Afghanistan', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (108, 32, N'Kaiser Wilhelm', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (109, 32, N'Archbishop Ussher', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (110, 32, N'Queen Victoria', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (111, 32, N'Archduke Franz Ferdinand', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (112, 33, N'Germany', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (113, 33, N'Norway', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (114, 33, N'Italy', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (115, 33, N'England', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (116, 34, N'Arizona', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (117, 34, N'Lusitania', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (118, 34, N'Titanic', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (119, 34, N'Andrea Doria', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (120, 35, N'Submarine', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (121, 35, N'Tank', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (122, 35, N'Jet fighter', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (123, 35, N'Chariot', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (124, 36, N'1925', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (125, 36, N'1918', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (126, 36, N'1920', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (127, 36, N'1915', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (128, 37, N'It is component oriented.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (129, 37, N'It can be compiled on a variety of computer platforms.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (130, 37, N'It is a part of .Net Framework.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (131, 37, N'All of the above.', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (132, 38, N'The value types directly contain data.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (133, 38, N'int, char, and float, which stores numbers, alphabets, and floating point numbers, respectively are value types.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (134, 38, N'When you declare an int type, the system allocates memory to store the value.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (135, 38, N'All of the above.', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (136, 39, N'ToDecimal', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (137, 39, N'ToDouble', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (138, 39, N'ToInt16', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (139, 39, N'ToInt32', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (140, 40, N'?:', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (141, 40, N'is', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (142, 40, N'as', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (143, 40, N'*', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (144, 41, N'Value parameters', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (145, 41, N'Reference parameters', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (146, 41, N'Output parameters', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (147, 41, N'None of the above.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (148, 42, N'Rank', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (149, 42, N'LongLength', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (150, 42, N' Length', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (151, 42, N'None of the above.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (152, 43, N'We can define class members variables as static using the static keyword.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (153, 43, N'When we declare a member of a class as static, it means no matter how many objects of the class are created, there is only one copy of the static member.', 0)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (154, 43, N'Both of the above.', 1)
INSERT [dbo].[Option] ([optionId], [questionId], [content], [isCorrect]) VALUES (155, 43, N'None of the above.', 0)
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (3, 1, N'Who is the father of C language?', NULL, N'Dennis Ritchie is the father of C Programming Language. C programming language was developed in 1972 at American Telephone & Telegraph Bell Laboratories of USA.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (4, 1, N'Which of the following is not a valid C variable name?', NULL, N'Since only underscore and no other special character is allowed in a variable name, it results in an error.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (5, 1, N'All keywords in C are in ____________', NULL, N'None.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (6, 1, N'Which of the following is true for variable names in C?', NULL, N'According to the syntax for C variable name, it cannot start with a digit.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (7, 1, N'Which is valid C expression?', NULL, N'Space, comma and $ cannot be used in a variable name.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (8, 1, N'Which of the following cannot be a variable name in C?', NULL, N'volatile is C keyword.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (9, 1, N'What is short int in C programming?', NULL, N'None.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (10, 1, N'Which of the following declaration is not supported by C language?', NULL, N'It is legal in Java, but not in C language.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (11, 1, N'Which keyword is used to prevent any changes in the variable within a C program?', NULL, N'const is a keyword constant in C program.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (12, 1, N'What is the result of logical or relational expression in C?', NULL, N'None.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (13, 2, N'Which of the following language was developed as the first purely object programming language?', NULL, N'This programming language was invented as the first pure OOPS (object-oriented) language. This language was designed by Alan Kay in the early 1970s.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (17, 2, N'Who developed object-oriented programming?', NULL, N'In the year 1970, Alan Kay gave Object-Oriented programming. He coined the concept of OOPS at a grad school in the year 1966 or 1967. Alan kay, Adele Goldberg, Dan Ingalls and others developed the first Smalltalk programming language.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (18, 2, N'Which of the following is not an OOPS concept?', NULL, N'None.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (20, 2, N'Which feature of OOPS described the reusability of code?', NULL, N'Inheritance is the feature of OOPS, which allows the users of OOPS to reuse the code which is already written. This OOPS feature inherits the features of another class in the programs.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (21, 2, N'Which of the following language supports polymorphism but not the classes?', NULL, N'It is a programming language that disapproves of the concept of polymorphism but supports the concept of classes. It is an object-based language. So, it does not follow the Object-oriented programming concepts.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (22, 2, N'Which among the following feature is not in the general definition of OOPS?', NULL, N'Duplicacy or Redundancy of data is a feature which totally dependent on the programmers. So, it cannot be created by the OOPS.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (23, 2, N'Which feature of OOPS derives the class from another class?', NULL, N'Inheritance is an important OOPS feature which derives the class from the base class or superclass. This OOPS feature inherits the features of another class in the programs.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (24, 2, N'Define the programming language, which does not support all four types of inheritance?', NULL, N'Java is a programming language that disapproves of the concept of ''multiple inheritance''. So, it does not agree with all types of inheritance.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (25, 2, N'A single program of OOPS contains _______ classes?', NULL, N'We can define any number of classes with different names in a single program of OOPS.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (26, 2, N'Which operator from the following can be used to illustrate the feature of polymorphism?', NULL, N'<< is an insertion operator which is used for overloading (polymorphism).')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (27, 3, N'Which of the following is the correct word describing loss of snow from a glacier by means of sublimation, melting, evaporation or avalanches?', NULL, N'Ablation refers to loss of snow from glaciers by means of vaporization, melting, wind or other processes.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (28, 3, N'Who among the following proposed Helio-centric model of solar system?', NULL, N'Copernicus proposed Helio-centric model. According to this model, sun stands at the center of the universe, and Moon, the Earth, and remaining planets revolve around the sun.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (29, 3, N'One minute of arc of latitude along any meridian is also known as__?', NULL, N'One Nautical Mile is the unit of length corresponding approximately to one minute of arc of latitude along any meridian. By international agreement it is exactly 1,852 metres (approximately 6,076 feet).')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (30, 3, N'Which country is called “Sugar Bowl of world”?', NULL, N'Cuba is traditionally known as the “Sugar bowl of the world” as it used to be the worlds largest sugar producer. But now brazil has taken the top spot in sugar production.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (31, 3, N'n context with the international borders, Zero Point refers to an area on the border of which of the following neighbors?', NULL, N'The Iran Pakistan International Border is known as Zero Point. It is 959 km in length.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (32, 4, N'Involving all the world’s superpowers, this tragic war resulted in over 35 million casualties. From weaponry and spies to treaties and neutrality, test your knowledge of World War I in this quiz.', NULL, N'On June 28, 1914, Archduke Franz (Francis) Ferdinand of Austria-Hungary was assassinated. His murder led to World War I.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (33, 4, N'Which of these nations was neutral in World War I?', NULL, N'Norway was neutral, meaning that it did not take sides, during World War I (1914–18). The country did not want to enter World War II (1939–45) either, but Nazi Germany invaded it in 1940.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (34, 4, N'Which of these ships was sunk by a German submarine?', NULL, N'The British passenger ship Lusitania was sunk by a German submarine off the coast of Ireland in 1915, causing great loss of life.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (35, 4, N'Which weapon was first used at the Battle of the Somme in World War I?', NULL, N'The tank was introduced, at first by the British armed forces, at the Battle of the Somme during World War I.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (36, 4, N'World War I ended in:', NULL, N'World War I officially ended at 11 AM on November 11 (11/11), 1918.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (37, 5, N'Which of the following is correct about C#?', NULL, N'All of the above options are correct.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (38, 5, N'Which of the following is correct about value type variables in C#?', NULL, N'All of the above options are correct.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (39, 5, N'Which of the following converts a type to a 16-bit integer in C#?', NULL, N'ToInt16() method converts a type to a 16-bit integer.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (40, 5, N'Which of the following operator represents a conditional operation in C#?', NULL, N'?: operator represents a conditional operation.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (41, 5, N'Which of the following method copies the actual value of an argument into the formal parameter of the function?', NULL, N'Value parameters method copies the actual value of an argument into the formal parameter of the function.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (42, 5, N'Which of the following property of Array class in C# gets a 64-bit integer, the total number of elements in all the dimensions of the Array?', NULL, N'LongLength gets a 64-bit integer that represents the total number of elements in all the dimensions of the Array.')
INSERT [dbo].[Question] ([questionId], [quizId], [content], [media], [explanation]) VALUES (43, 5, N'Which of the following is the correct about static member variables of a class?', NULL, N'Both of the above options are correct.')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizId], [quizName], [ownerId], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [quizLevelId], [description], [dateCreated]) VALUES (1, N'C Programming Basics', 3, NULL, 5, 10, 5, 1, N'C Programming MCQ (Multiple Choice Questions)', CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [ownerId], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [quizLevelId], [description], [dateCreated]) VALUES (2, N'Java oops Concepts', 3, NULL, 5, 10, 6, 1, N'OOPS MCQ', CAST(N'2022-06-01' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [ownerId], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [quizLevelId], [description], [dateCreated]) VALUES (3, N'World Geography', 4, NULL, 3, 5, 2, 2, N'World Geography Multiple Choice Questions (MCQs) Quiz for State and UPSC Civil Services Examinations. Objective Questions on Physical Geography and World Geography for competitive examinations.', CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [ownerId], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [quizLevelId], [description], [dateCreated]) VALUES (4, N'WORLD WAR I QUIZ', 4, NULL, 3, 5, 1, 2, N'WORLD WAR I QUIZ – World History Multiple Choice Quiz', CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Quiz] ([quizId], [quizName], [ownerId], [thumbnail], [quizDuration], [numberQuestion], [subjectId], [quizLevelId], [description], [dateCreated]) VALUES (5, N'C# Basics', 3, NULL, 5, 7, 7, 1, N'C# Online Quiz', CAST(N'2022-06-03' AS Date))
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizLevel] ON 

INSERT [dbo].[QuizLevel] ([quizLevelId], [quizLevelName]) VALUES (1, N'Easy')
INSERT [dbo].[QuizLevel] ([quizLevelId], [quizLevelName]) VALUES (2, N'Medium')
INSERT [dbo].[QuizLevel] ([quizLevelId], [quizLevelName]) VALUES (3, N'Hard')
SET IDENTITY_INSERT [dbo].[QuizLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizResult] ON 

INSERT [dbo].[QuizResult] ([quizResultId], [userId], [quizId], [score], [time], [submitAt]) VALUES (1, 6, 1, 50, 2, CAST(N'2022-06-21T13:38:05.740' AS DateTime))
INSERT [dbo].[QuizResult] ([quizResultId], [userId], [quizId], [score], [time], [submitAt]) VALUES (2, 6, 3, 0, 2, CAST(N'2022-06-21T21:21:26.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuizResult] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentWork] ON 

INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (1, 6, 1, 3, 4)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (2, 6, 1, 4, 10)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (3, 6, 1, 5, 12)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (4, 6, 1, 6, 18)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (5, 6, 1, 7, 21)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (6, 6, 1, 8, 25)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (7, 6, 1, 9, 28)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (8, 6, 1, 10, 33)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (9, 6, 1, 11, NULL)
INSERT [dbo].[StudentWork] ([studentWorkId], [userId], [quizResultId], [questionId], [optionId]) VALUES (10, 6, 1, 12, NULL)
SET IDENTITY_INSERT [dbo].[StudentWork] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (1, N'History', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (2, N'Geography', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (3, N'Japanese', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (4, N'English', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (5, N'C Programming', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (6, N'Java OOP', NULL, NULL)
INSERT [dbo].[Subject] ([subjectId], [subjectName], [thumbnail], [description]) VALUES (7, N'C# .NET', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (1, N'DatNT', N'datnthe153704@fpt.edu.vn', N'123', NULL, 1, CAST(N'2001-01-01' AS Date), 1, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (2, N'HuyNQ', N'huynqhe153639', N'123', NULL, 1, CAST(N'2001-02-02' AS Date), 1, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (3, N'HungNL', N'hungnlhe153107', N'123', NULL, 1, CAST(N'2001-03-03' AS Date), 2, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (4, N'SonNTHS', N'sonnthse04813', N'123', NULL, 1, CAST(N'2001-04-04' AS Date), 2, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (5, N'NghiaPT', N'nghiapthe150491', N'123', NULL, 1, CAST(N'2001-05-05' AS Date), 2, 1, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (6, N'Data', N'datagame21stcentury@gmail.com', N'123', NULL, 0, CAST(N'1999-10-10' AS Date), 3, 0, NULL)
INSERT [dbo].[User] ([userId], [userName], [email], [password], [avatar], [gender], [dob], [roleId], [status], [code]) VALUES (7, N'Admin', N'nguyendat091011@gmail.com', N'123', NULL, 1, CAST(N'2022-06-01' AS Date), 3, 0, N'13253972')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (2, N'Expert')
INSERT [dbo].[UserRole] ([roleId], [roleName]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([ownerId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([quizLevelId])
REFERENCES [dbo].[QuizLevel] ([quizLevelId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[QuizResult]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([optionId])
REFERENCES [dbo].[Option] ([optionId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([quizResultId])
REFERENCES [dbo].[QuizResult] ([quizResultId])
GO
ALTER TABLE [dbo].[StudentWork]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRole] ([roleId])
GO
USE [master]
GO
ALTER DATABASE [QuizPracticeSystem] SET  READ_WRITE 
GO

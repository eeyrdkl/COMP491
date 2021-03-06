USE [master]
GO
/****** Object:  Database [KUugle]    Script Date: 29-May-15 22:53:13 ******/
CREATE DATABASE [KUugle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KUugle', FILENAME = N'D:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KUugle.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KUugle_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KUugle_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KUugle] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KUugle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KUugle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KUugle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KUugle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KUugle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KUugle] SET ARITHABORT OFF 
GO
ALTER DATABASE [KUugle] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KUugle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KUugle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KUugle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KUugle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KUugle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KUugle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KUugle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KUugle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KUugle] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KUugle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KUugle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KUugle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KUugle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KUugle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KUugle] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KUugle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KUugle] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KUugle] SET  MULTI_USER 
GO
ALTER DATABASE [KUugle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KUugle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KUugle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KUugle] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KUugle] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KUugle]
GO
/****** Object:  Table [dbo].[Importance]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Importance](
	[ID] [int] NOT NULL,
	[Value] [float] NULL,
 CONSTRAINT [PK_Importance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvalidURL]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvalidURL](
	[URL] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[ID] [int] NOT NULL,
	[Keyword] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[Source] [int] NOT NULL,
	[Destination] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[HTMLContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Page_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[GetImportanceOfPage]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetImportanceOfPage]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT i.Value FROM Importance i
	WHERE i.ID = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetNumberOfLinksPageHas]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNumberOfLinksPageHas]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT COUNT(*) FROM Link l
	WHERE l.Source = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetNumberOfPages]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNumberOfPages]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT COUNT(*) FROM Page;
END

GO
/****** Object:  StoredProcedure [dbo].[InitializeImportance]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InitializeImportance]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE Importance;

	DECLARE @f float = 0.0;
	DECLARE @i int = 1;
	DECLARE @count int = (SELECT COUNT(*) FROM Page);
	SET @f = (1.0 / @count);
	WHILE @i <= @count
	BEGIN
		INSERT INTO Importance
		VALUES(@i,@f);
		SET @i = @i + 1;
	END;
END

GO
/****** Object:  StoredProcedure [dbo].[NewInvalidURL]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewInvalidURL]
	-- Add the parameters for the stored procedure here
	@URL nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --Check if it exists
	DECLARE @count int;
	SET @count = (SELECT COUNT(*) FROM InvalidURL i WHERE i.URL = @URL);
	--IF it doesn't exist, insert
	IF @count = 0
		INSERT INTO InvalidURL
		VALUES (@URL);
END

GO
/****** Object:  StoredProcedure [dbo].[NewKeywordOnPage]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewKeywordOnPage]
	-- Add the parameters for the stored procedure here
	@URL nvarchar(max),
	@Keyword nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --Get page id
	DECLARE @id int;
	SET @id = (SELECT DISTINCT(ID) FROM Page p
	where p.URL = @URL);
	--Check if keyword exists
	DECLARE @count int;
	SET @count = (SELECT COUNT(*) FROM Keyword k
	where k.ID = @id and k.Keyword = @Keyword);
	--If keyword doesnt exist, add it
	IF @count = 0
		INSERT INTO Keyword
		VALUES (@id, @Keyword);
END

GO
/****** Object:  StoredProcedure [dbo].[NewLinkBetweenPages]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewLinkBetweenPages]
	-- Add the parameters for the stored procedure here
	@Source nvarchar(max),
	@Destination nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @src_id int;
	DECLARE @dest_id int;
	DECLARE @count int;
	--Get source URL ID
	SET @src_id = (SELECT DISTINCT(ID) FROM Page p
	where p.URL = @Source);
	--Get destination URL ID
	SET @dest_id = (SELECT DISTINCT(ID) FROM Page p
	where p.URL = @Destination);
	--Check if link exists
	SET @count = (SELECT COUNT(*) FROM Link l
	where l.Destination = @dest_id and l.Source = @src_id);
	--If it doesnt exist, add it
	IF @count = 0
		INSERT INTO Link
		VALUES (@src_id, @dest_id);
END

GO
/****** Object:  StoredProcedure [dbo].[NewPageDiscovered]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewPageDiscovered]
	-- Add the parameters for the stored procedure here
	@URL nvarchar(max),
	@Title nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Check if page already exists
	DECLARE @count int;
	SET @count = (SELECT COUNT(*) FROM Page p
	where p.URL = @URL);
	--If it doesnt exits, add it
	IF @count = 0
		INSERT INTO Page (URL, Title)
		VALUES (@URL, @Title);
END

GO
/****** Object:  StoredProcedure [dbo].[PageHasLinksFrom]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PageHasLinksFrom]
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Source FROM Link
	WHERE Destination = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[PurgeAllTables]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PurgeAllTables]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --Delete all data and reset IDs
	TRUNCATE TABLE Importance;
	TRUNCATE TABLE Keyword;
	TRUNCATE TABLE Link;
	TRUNCATE TABLE Page;
	TRUNCATE TABLE InvalidURL;
END

GO
/****** Object:  StoredProcedure [dbo].[SaveHTMLToDatabase]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveHTMLToDatabase]
	@URL nvarchar(max),
	@HTML nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE Page
	SET HTMLContent = @HTML
	WHERE URL = @URL;
END

GO
/****** Object:  StoredProcedure [dbo].[SearchForKeyword]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SearchForKeyword]
	-- Add the parameters for the stored procedure here
	@Keyword nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
	--SELECT DISTINCT(p.ID), p.Title, p.URL, im.Value FROM Keyword kw
	--JOIN Page p on p.ID = kw.ID
	--JOIN Importance im on kw.ID = im.ID
	--WHERE kw.Keyword like '%'+@Keyword+'%'
	--ORDER BY im.Value desc


	IF OBJECT_ID('tempdb..#temptable') IS NOT NULL DROP TABLE #temptable;

	CREATE TABLE #temptable
	(
		ID int,
		Title nvarchar(max),
		URL nvarchar(max),
		Value float

	);

	DECLARE @i int;
	DECLARE @begin int;
	DECLARE @end int;

	SET @i = 0;
	SET @begin = 0;
	SET @end = LEN(@Keyword);
	DECLARE @word nvarchar(max);

	WHILE @i < LEN(@Keyword)
	BEGIN
		IF SUBSTRING(@Keyword, @i, 1) = ' '
			BEGIN
				SET @end = @i;
				SET @word = SUBSTRING(@Keyword, @begin, @end-@begin);
				SET @word = REPLACE(@word, ' ', '');
				IF @word != ' '
				INSERT INTO #temptable
				SELECT DISTINCT(p.ID), p.Title, p.URL, im.Value FROM Keyword kw
				JOIN Page p on p.ID = kw.ID
				JOIN Importance im on kw.ID = im.ID
				WHERE kw.Keyword like '%'+@word+'%';

				SET @begin = @end + 1;
			END;

		SET @i = @i + 1;
	END;

	SET @word = SUBSTRING(@Keyword, @begin, LEN(@Keyword)-@begin+1);
	SET @word = REPLACE(@word, ' ', '');
	IF @word != ' '
		INSERT INTO #temptable 
		SELECT DISTINCT(p.ID), p.Title, p.URL, im.Value FROM Keyword kw
		JOIN Page p on p.ID = kw.ID
		JOIN Importance im on kw.ID = im.ID
		WHERE kw.Keyword like '%'+@word+'%';


	SELECT * FROM #temptable ORDER BY Value desc;
	
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateImportanceValue]    Script Date: 29-May-15 22:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateImportanceValue]
	@ID int,
	@val float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Importance
	SET Value = @val
	WHERE ID = @ID;
END

GO
USE [master]
GO
ALTER DATABASE [KUugle] SET  READ_WRITE 
GO

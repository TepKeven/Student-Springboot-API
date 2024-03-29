USE [master]
GO
/****** Object:  Database [student]    Script Date: 2/9/2024 12:13:14 AM ******/
CREATE DATABASE [student]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'student', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\student.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'student_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\student_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [student] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [student].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [student] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [student] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [student] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [student] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [student] SET ARITHABORT OFF 
GO
ALTER DATABASE [student] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [student] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [student] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [student] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [student] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [student] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [student] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [student] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [student] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [student] SET  DISABLE_BROKER 
GO
ALTER DATABASE [student] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [student] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [student] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [student] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [student] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [student] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [student] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [student] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [student] SET  MULTI_USER 
GO
ALTER DATABASE [student] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [student] SET DB_CHAINING OFF 
GO
ALTER DATABASE [student] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [student] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [student] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [student] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [student] SET QUERY_STORE = ON
GO
ALTER DATABASE [student] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [student]
GO
USE [student]
GO
/****** Object:  Sequence [dbo].[student_seq]    Script Date: 2/9/2024 12:13:14 AM ******/
CREATE SEQUENCE [dbo].[student_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[student]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[age] [varchar](10) NOT NULL,
	[dob] [varchar](100) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[profile] [varchar](200) NULL,
	[score] [float] NOT NULL,
	[status] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [DF_student_age]  DEFAULT ((0)) FOR [age]
GO
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [DF_student_dob]  DEFAULT (((1)/(12))/(1970)) FOR [dob]
GO
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [DF_student_phone]  DEFAULT ((12345678)) FOR [phone]
GO
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [DF_student_score]  DEFAULT ((0)) FOR [score]
GO
ALTER TABLE [dbo].[student] ADD  CONSTRAINT [DF_student_status]  DEFAULT ((1)) FOR [status]
GO
/****** Object:  StoredProcedure [dbo].[add_student]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[add_student] (
	@name VARCHAR(50), 
	@age VARCHAR(10),
	@dob VARCHAR(100),
	@phone VARCHAR(50),
	@email VARCHAR(100), 
	@profile VARCHAR(200),
	@score FLOAT,
	@status TINYINT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO student(name,age,dob,phone,email,profile,score,status) VALUES(@name, @age, @dob, @phone, @email, @profile, @score, @status);
END
GO
/****** Object:  StoredProcedure [dbo].[delete_student]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_student] (
	@student_id INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM student WHERE student_id = @student_id;
END
GO
/****** Object:  StoredProcedure [dbo].[edit_student]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[edit_student] (
	@student_id INT, 
	@name VARCHAR(50), 
	@age VARCHAR(10),
	@dob VARCHAR(100),
	@phone VARCHAR(50),
	@email VARCHAR(100), 
	@profile VARCHAR(200),
	@score FLOAT,
	@status TINYINT
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@profile IS NULL OR @profile = '') BEGIN 
		UPDATE student set name = @name, age = @age, dob = @dob, phone = @phone, email = @email, score = @score, status = @status WHERE student_id = @student_id;
	END ELSE BEGIN
		UPDATE student set name = @name, age = @age, dob = @dob, phone = @phone, email = @email, profile = @profile, score = @score, status = @status WHERE student_id = @student_id;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[get_student]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_student] (
	@student_id INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM student WHERE student_id = @student_id;
END
GO
/****** Object:  StoredProcedure [dbo].[get_students]    Script Date: 2/9/2024 12:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_students] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM student ORDER BY student_id ASC;
END
GO
USE [master]
GO
ALTER DATABASE [student] SET  READ_WRITE 
GO

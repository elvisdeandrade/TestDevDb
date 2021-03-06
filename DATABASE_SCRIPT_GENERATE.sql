USE [master]
GO
/****** Object:  Database [TestDevDB]    Script Date: 08/09/2020 16:44:42 ******/
CREATE DATABASE [TestDevDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDevDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TestDevDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDevDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TestDevDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestDevDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDevDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDevDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDevDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDevDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDevDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDevDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDevDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDevDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TestDevDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDevDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDevDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDevDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDevDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDevDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDevDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDevDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDevDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDevDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDevDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDevDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDevDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDevDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDevDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDevDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDevDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDevDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDevDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDevDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDevDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDevDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TestDevDB]
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 08/09/2020 16:44:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[UF] [char](2) NOT NULL,
	[Celular] [char](11) NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFinanciamento]    Script Date: 08/09/2020 16:44:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFinanciamento](
	[IdFinanciamento] [int] IDENTITY(1,1) NOT NULL,
	[TipoFinanciamento] [varchar](50) NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[DataVencimento] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_tblFinanciamento] PRIMARY KEY CLUSTERED 
(
	[IdFinanciamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblParcelas]    Script Date: 08/09/2020 16:44:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParcelas](
	[IdParcela] [int] IDENTITY(1,1) NOT NULL,
	[NumeroParcela] [int] NOT NULL,
	[ValorParcela] [decimal](18, 2) NOT NULL,
	[DataVencimento] [datetime] NOT NULL,
	[DataPagamento] [datetime] NULL,
	[IdFinanciamento] [int] NOT NULL,
 CONSTRAINT [PK_tblParcelas] PRIMARY KEY CLUSTERED 
(
	[IdParcela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblFinanciamento]  WITH CHECK ADD  CONSTRAINT [FK_tblFinanciamento_tblCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tblCliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tblFinanciamento] CHECK CONSTRAINT [FK_tblFinanciamento_tblCliente]
GO
ALTER TABLE [dbo].[tblParcelas]  WITH CHECK ADD  CONSTRAINT [FK_tblParcelas_tblFinanciamento] FOREIGN KEY([IdFinanciamento])
REFERENCES [dbo].[tblFinanciamento] ([IdFinanciamento])
GO
ALTER TABLE [dbo].[tblParcelas] CHECK CONSTRAINT [FK_tblParcelas_tblFinanciamento]
GO
USE [master]
GO
ALTER DATABASE [TestDevDB] SET  READ_WRITE 
GO

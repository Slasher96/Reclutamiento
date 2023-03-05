USE [master]
GO
/****** Object:  Database [ClientsHirCasaReclutamiento]    Script Date: 04/03/2023 06:07:53 p. m. ******/
CREATE DATABASE [ClientsHirCasaReclutamiento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClientsHirCasaReclutamiento', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESSVER13\MSSQL\DATA\ClientsHirCasaReclutamiento.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClientsHirCasaReclutamiento_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESSVER13\MSSQL\DATA\ClientsHirCasaReclutamiento_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClientsHirCasaReclutamiento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET  MULTI_USER 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET QUERY_STORE = OFF
GO
USE [ClientsHirCasaReclutamiento]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ClientsHirCasaReclutamiento]
GO
/****** Object:  Table [dbo].[Ajustes]    Script Date: 04/03/2023 06:07:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ajustes](
	[AjusteId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[MontoTotal] [decimal](18, 2) NULL,
	[Adeudo] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Ajuste] PRIMARY KEY CLUSTERED 
(
	[AjusteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 04/03/2023 06:07:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Telefono] [nchar](16) NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[MontoSolicitud] [decimal](18, 2) NOT NULL,
	[Estatus] [nvarchar](16) NULL,
	[Aprobacion] [bit] NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 04/03/2023 06:07:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[PagoId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[MontoPagado] [decimal](18, 2) NULL,
	[Aplicado] [bit] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[PagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ajustes] ON 

INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (1, 8, CAST(912738.00 AS Decimal(18, 2)), CAST(-134174.00 AS Decimal(18, 2)))
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (3, 9, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (4, 7, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (5, 3, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (6, 4, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (7, 6, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (8, 10, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (9, 1, NULL, NULL)
INSERT [dbo].[Ajustes] ([AjusteId], [ClienteId], [MontoTotal], [Adeudo]) VALUES (10, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ajustes] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (1, N'Alyssa   Macdonald  King
L', N'477-1943
      ', N'magnis.dis@yahoo.couk
', 24, CAST(74300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2021-12-04T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (2, N'Irene   Carey    Spears
', N'1-153-173-1315
', N'donec.feugiat@protonmail.com
', 18, CAST(1213748.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-09-16T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (3, N'Hope          Best Charity', N'1-810-927-0758
', N'sed.neque@yahoo.edu
', 45, CAST(378122.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2021-09-18T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (4, N'  Kirsten   Glover   Carrison
', N'488-7837
      ', N'ipsum.ac.mi@google.edu
', 39, CAST(22430.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (5, N'Cheyenne Norton       Mcdonald
', N'1-638-481-3863
', N'nulla.eu@yahoo.ca
', 28, CAST(664419.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (6, N' Kirk Nichols Douglas
', N'348-0176
      ', N'donec@yahoo.edu
', 25, CAST(980001.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-09-24T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (7, N'Blaze  Massey    Adams  
', N'1-483-678-4909
', N'sed@aol.edu
', 56, CAST(276900.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-07-09T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (8, N'Raphael    Wright Allen
', N'942-4114
      ', N'dolor.donec.fringilla@aol.couk
', 83, CAST(778564.00 AS Decimal(18, 2)), N'Adeudo', 1, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (9, N'   Pamela   Hanson  Love
', N'1-760-505-0882
', N'sed@yahoo.org
', 60, CAST(331876.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([ClientId], [Nombre], [Telefono], [Correo], [Edad], [MontoSolicitud], [Estatus], [Aprobacion], [FechaAlta], [FechaModificacion]) VALUES (10, N'Lois  Byers                Parson
', N'1-773-637-7287
', N'eu.eleifend.nec@yahoo.com
', 37, CAST(634567.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2022-09-10T00:00:00.000' AS DateTime), CAST(N'2023-03-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (1, 8, CAST(898960.61 AS Decimal(18, 2)), 1, CAST(N'2021-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (2, 10, CAST(498882.82 AS Decimal(18, 2)), 1, CAST(N'2021-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (3, 2, CAST(631239.40 AS Decimal(18, 2)), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (4, 1, CAST(43000.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (5, 5, CAST(88656.60 AS Decimal(18, 2)), 0, CAST(N'2021-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (6, 6, CAST(254661.68 AS Decimal(18, 2)), 1, CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (7, 2, CAST(50846.04 AS Decimal(18, 2)), 1, CAST(N'2022-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (8, 7, CAST(67764.01 AS Decimal(18, 2)), 1, CAST(N'2022-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (9, 6, CAST(669890.82 AS Decimal(18, 2)), 1, CAST(N'2022-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (10, 1, CAST(2700.00 AS Decimal(18, 2)), 1, CAST(N'2022-10-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (11, 9, CAST(331876.00 AS Decimal(18, 2)), 1, CAST(N'2022-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (12, 8, CAST(787879.68 AS Decimal(18, 2)), 0, CAST(N'2022-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (13, 8, CAST(13777.71 AS Decimal(18, 2)), 1, CAST(N'2022-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Pagos] ([PagoId], [ClienteId], [MontoPagado], [Aplicado], [FechaPago]) VALUES (14, 4, CAST(8372.77 AS Decimal(18, 2)), 1, CAST(N'2022-02-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
ALTER TABLE [dbo].[Ajustes]  WITH CHECK ADD  CONSTRAINT [FK_Ajuste_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClientId])
GO
ALTER TABLE [dbo].[Ajustes] CHECK CONSTRAINT [FK_Ajuste_Clientes]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClientId])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [FK_Pagos_Clientes]
GO
USE [master]
GO
ALTER DATABASE [ClientsHirCasaReclutamiento] SET  READ_WRITE 
GO

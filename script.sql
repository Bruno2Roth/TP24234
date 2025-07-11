USE [master]
GO
/****** Object:  Database [TP6_Introducciónabasededatos]    Script Date: 11/7/2025 14:11:21 ******/
CREATE DATABASE [TP6_Introducciónabasededatos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP6_Introducciónabasededatos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP6_Introducciónabasededatos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP6_Introducciónabasededatos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP6_Introducciónabasededatos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP6_Introducciónabasededatos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET RECOVERY FULL 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET  MULTI_USER 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP6_Introducciónabasededatos', N'ON'
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET QUERY_STORE = OFF
GO
USE [TP6_Introducciónabasededatos]
GO
/****** Object:  User [alumno]    Script Date: 11/7/2025 14:11:21 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 11/7/2025 14:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos](
	[idGrupo] [int] NOT NULL,
	[NombreGrupo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Integrantes]    Script Date: 11/7/2025 14:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Integrantes](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Frase] [varchar](50) NOT NULL,
	[Hobby] [varchar](50) NOT NULL,
	[ProfeFav] [varchar](50) NOT NULL,
	[PeliculaFav] [varchar](50) NOT NULL,
	[idGrupo] [int] NOT NULL,
 CONSTRAINT [PK_Integrantes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (1, N'FRANcia')
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (2, N'BrunoBerman')
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (3, N'Las Sinfonías')
GO
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (1, N'Fran Castillo', N'Frannnnn', N'Fran1234', N'AAAAAAAAAAAAAAA', N'Siesta', N'Iara', N'Secreto en la Montaña', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (2, N'Zar Nicolas II', N'ZNicolas2', N'Russia1917', N'No sé nada del arte de gobernar', N'Gobernar', N'Iara', N'Anastasia', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (3, N'Bob', N'Minions015', N'Banana', N'Bello!, Poopaye, Tank yu!', N'Comer', N'Iara', N'Mi Villano Favorito', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (4, N'El Conejo de Nesquik', N'QuikyOK', N'Conej0', N'Siempre listo para el sabor', N'Tirar Facha', N'Iara', N'Space Jam', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (5, N'Negro Tumbo', N'OscuroIntercesor', N'Fortin1920', N'Estoy para unas lineas de sal', N'Rituales', N'Iara', N'El Extraño Mundo de Jack', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (6, N'Bruno Roth', N'Brunubi', N'EliTeAmo', N'Todo al rojo', N'Programar', N'Ceriana', N'La gran apuesta', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (7, N'Messi', N'Li054', N'Messirve', N'Anda pa'' lla'' bobo', N'Flubo', N'Christian Gray', N'Metegol', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (8, N'Ronaldo', N'Cristian', N'CR7GOAT', N'Siuuuuuu', N'Flubo', N'Christian Gray', N'El Futbol o Yo', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (9, N'Mbappe', N'Mpape', N'Kylliaaan', N'Aguante las tortugas', N'Flubo', N'Christian Gray', N'Las Tortugas Ninja', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (10, N'Paredes', N'Pared', N'Leo20', N'Vamos a pintar paredes', N'Flubo', N'Christian Gray', N'Rápidos y Furiosos 5', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (11, N'Tobias Turquie', N'Tobito', N'MTobi09', N'No es una buena práctica', N'Hacer tableros trifasicos de alta tension', N'Damian', N'El violinista en el tejado', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (12, N'Gero Benavidez', N'MomoLaDinastia', N'GeroVena', N'Pequeños placeres que tienen mis domingos', N'Pilotear Areolineas Splinter', N'Iara', N'Salvando al soldado Ryan', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (13, N'Alonso', N'Alonsito', N'Mantequita88', N'Manteca Mantecosa', N'Fotografía', N'Iara', N'La historia de Jan', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (14, N'Teodoro Igal Perles', N'Teo_Perles', N'FerroPasionIarok', N'Oh no no no no no', N'Hacer Tik Toks', N'Iara', N'La historia de Jan', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [idGrupo]) VALUES (15, N'Shlomo Levi', N'SholomoLev', N'Goyshe', N'Como ser un buen goy', N'Poner Tefilin', N'Iara', N'La purga', 3)
GO
ALTER TABLE [dbo].[Integrantes]  WITH CHECK ADD  CONSTRAINT [FK_Integrantes_Grupos] FOREIGN KEY([idGrupo])
REFERENCES [dbo].[Grupos] ([idGrupo])
GO
ALTER TABLE [dbo].[Integrantes] CHECK CONSTRAINT [FK_Integrantes_Grupos]
GO
USE [master]
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET  READ_WRITE 
GO

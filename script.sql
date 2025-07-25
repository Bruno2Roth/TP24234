USE [master]
GO
/****** cambia la parte de arriba en ort ******/
CREATE DATABASE [TP6_Introducciónabasededatos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP6_Introducciónabasededatos', FILENAME = N'C:\SQLData\TP6_Introducciónabasededatos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP6_Introducciónabasededatos_log', FILENAME = N'C:\SQLData\TP6_Introducciónabasededatos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
ALTER DATABASE [TP6_Introducciónabasededatos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP6_Introducciónabasededatos', N'ON'
GO
ALTER DATABASE [TP6_Introducciónabasededatos] SET QUERY_STORE = OFF
GO
USE [TP6_Introducciónabasededatos]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 16/7/2025 18:37:55 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Integrantes]    Script Date: 16/7/2025 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Integrantes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Frase] [varchar](150) NOT NULL,
	[Hobby] [varchar](50) NOT NULL,
	[ProfeFav] [varchar](50) NOT NULL,
	[PeliculaFav] [varchar](50) NOT NULL,
	[Foto] [varchar](500) NOT NULL,
	[idGrupo] [int] NOT NULL,
 CONSTRAINT [PK_Integrantes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (1, N'FRANcia')
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (2, N'BrunoBerman')
INSERT [dbo].[Grupos] ([idGrupo], [NombreGrupo]) VALUES (3, N'Las Sinfonías')
GO
SET IDENTITY_INSERT [dbo].[Integrantes] ON 

INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (1, N'Fran Castillo', N'Frannnnn', N'Fran1234', N'AAAAAAAAAAAAAAA', N'Siesta', N'Iara', N'Secreto en la Montaña', N'/images/Fran.jpg', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (2, N'Zar Nicolas II', N'ZNicolas2', N'Russia1917', N'No sé nada del arte de gobernar', N'Gobernar', N'Iara', N'Anastasia', N'https://www.biografiasyvidas.com/biografia/n/fotos/nicolas_ii.jpg', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (3, N'Bob', N'Minions015', N'Banana', N'Bello!, Poopaye, Tank yu!', N'Comer', N'Iara', N'Mi Villano Favorito', N'https://i.pinimg.com/736x/11/41/61/1141614c8690ca0c3a3183827e4d47f3.jpg', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (4, N'El Conejo de Nesquik', N'QuikyOK', N'Conej0', N'Siempre listo para el sabor', N'Tirar Facha', N'Iara', N'Space Jam', N'https://franciscotorreblanca.es/wp-content/uploads/2019/05/quicky-de-nesquik.jpg', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (5, N'Negro Tumbo', N'OscuroIntercesor', N'Fortin1920', N'Estoy para unas lineas de sal', N'Rituales', N'Iara', N'El Extraño Mundo de Jack', N'https://delamazonas.com/wp-content/uploads/2020/08/Chaman_amazonie_5_06-CUT-LOW.jpg', 1)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (6, N'Bruno Roth', N'Brunubi', N'EliTeAmo', N'Todo al rojo', N'Programar', N'Ceriana', N'La gran apuesta', N'/images/Bruno.jpg', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (7, N'Messi', N'Li054', N'Messirve', N'Anda pa'' lla'' bobo', N'Fulbo', N'Christian Gray', N'Metegol', N'https://fifpro.org/media/fhmfhvkx/messi-world-cup.jpg', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (8, N'Ronaldo', N'Cristian', N'CR7GOAT', N'Siuuuuuu', N'Fulbo', N'Christian Gray', N'El Futbol o Yo', N'https://media.admagazine.com/photos/638e25bb9a9048f82856c0c7/16:9/w_1920,c_limit/GettyImages-1443064180.jpg', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (9, N'Mbappe', N'Mpape', N'Kylliaaan', N'Aguante las tortugas', N'Fulbo', N'Christian Gray', N'Las Tortugas Ninja', N'https://www.directvsports.com/__export/1719326866798/sites/dsports/img/2024/06/25/mbappe.jpg_865629101.jpg', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (10, N'Paredes', N'Pared', N'Leo20', N'Vamos a pintar paredes', N'Fulbo', N'Christian Gray', N'Rápidos y Furiosos 5', N'https://cdn.soccerwiki.org/images/player/47375.png', 2)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (11, N'Tobias Turquie', N'Tobito', N'MTobi09', N'No es una buena práctica', N'Hacer Tableros Trifasicos de Alta Tensión', N'Damian', N'La historia de Jan', N'https://i.imgur.com/0HhJ4kA.jpeg', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (12, N'Gero Benavidez', N'MomoLaDinastia', N'GeroVena', N'Ahora con Paladio; de la orquesta sinfónica japonesa', N'Pilotear Areolineas Splinter', N'Iara', N'Salvando al soldado Ryan', N'https://robertoramasso.com/wp-content/uploads/momo.png', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (13, N'Alonso', N'Alonsito', N'Mantequita88', N'Manteca Mantecosa', N'Fotografía', N'Iara', N'La historia de Jan', N'https://www.televicentro.com/wp-content/uploads/2025/06/principal_foto-de-alonso-augusto-quien-es-y-por-que-es-tendencia-en-redes-2025-06-06_seo_fs.jpg', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (14, N'Teodoro Igal Perles', N'Teo_Perles', N'FerroPasionIarok', N'Oh no no no no no', N'Hacer Tik Toks', N'Iara', N'La historia de Jan', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPjBMihht3GH74wXV3vFyKnMco57bRUBtPDQ&s', 3)
INSERT [dbo].[Integrantes] ([ID], [Nombre], [Usuario], [Contraseña], [Frase], [Hobby], [ProfeFav], [PeliculaFav], [Foto], [idGrupo]) VALUES (15, N'Shlomo Levi', N'SholomoLev', N'Goyshe', N'Como ser un buen goy', N'Poner Tefilin', N'Iara', N'La purga', N'https://cdn-images-3.listennotes.com/podcasts/rabino-shlomo-levy-ApwMhx8WYIR-nU-H5vMm6kJ.1400x1400.jpg', 3)
SET IDENTITY_INSERT [dbo].[Integrantes] OFF
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

/*
	SENTENCIAS
*/

/* Crear base de datos */
--CREATE DATABASE cursumSQL;

/* Crear tabla */
--CREATE TABLE Autor(
--	idAutor int NOT NULL,
--	nombre VARCHAR(50) NOT NULL,
--	idPais int NOT NULL,
--	publicacionesCargadas int,
--	ranking real,
--	fechaNacimiento date,
--	generoPrincipal varchar(50),
--	CONSTRAINT PK_idAutor PRIMARY KEY (idAutor)
--)

--CREATE TABLE Pais(
--	idPais int identity(1001,1) NOT NULL,
--	nombre varchar(50) NOT NULL,
--	continente varchar(50)
--)

--CREATE TABLE Descarga(
--	idDescarga int IDENTITY(1001,1) NOT NULL,
--	fechaDescarga datetime NOT NULL,
--	observacion varchar(max)
--)

--CREATE TABLE DescargaUsuarioLibro(
--	idDescarga INT not null,
--	idUsuario INT not null,
--	idLibro INT not null
--	PRIMARY KEY(idDescarga, idUsuario, idLibro)
--)

/* Crear tipo de dato usuario */
--CREATE TYPE admin FROM INT NOT NULL
--CREATE TYPE comentario FROM VARCHAR(1000)
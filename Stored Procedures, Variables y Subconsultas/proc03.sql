USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_CrearAutorFantasma]    Script Date: 14/03/2025 16:29:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[_CrearAutorFantasma]
AS
	DECLARE @nombre varchar(50) = 'Angel Marin'
	DECLARE @idPais INT = 1001
	DECLARE @publicacionesCargadas INT = 0
	DECLARE @calificacion REAL = 5.75
	DECLARE @fechaNacimiento DATE = GETDATE()
	DECLARE @idGenero INT = 1001

	INSERT INTO Autor(
		nombre, 
		idPais, 
		publicacionesCargadas,
		calificacion,
		fechaNacimiento,
		idGenero
	) 
	VALUES (
		@nombre,
		@idPais,
		@publicacionesCargadas,
		@calificacion,
		@fechaNacimiento,
		@idGenero
	)

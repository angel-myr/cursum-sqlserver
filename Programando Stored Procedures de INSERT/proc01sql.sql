USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_CrearAutor]    Script Date: 15/03/2025 16:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[_CrearAutor](
	@nombre VARCHAR(50),
	@pais VARCHAR(50),
	@fechaNacimiento VARCHAR(8),
	@genero VARCHAR(50)
)
AS
	-- Preguntar si existe ya ese autor
	IF(EXISTS(
		SELECT * FROM Autor WHERE nombre = @nombre
	))
	BEGIN
		PRINT 'ERROR 101: Este autor ya existe.'
		RETURN
	END
	-- Obteniendo el idPais
	DECLARE @id_pais INT = 0
	IF(EXISTS(SELECT TOP 1 idPais FROM Pais WHERE Pais.nombre = @pais))
		BEGIN
			SET @id_pais = (
				SELECT TOP 1 idPais FROM Pais WHERE Pais.nombre = @pais
			)
		END
	ELSE
		BEGIN
			PRINT 'Error 102: País no identificado'
			RETURN
		END
	-- Obteniendo el idGenero
	DECLARE @id_genero INT = 0
	IF(EXISTS(SELECT TOP 1 idGenero FROM Genero WHERE Genero.nombre = @genero))
		BEGIN
			SET @id_genero = (
				SELECT TOP 1 idGenero FROM Genero WHERE Genero.nombre = @genero
			)
		END
	ELSE
		BEGIN
			PRINT 'Error 103: Género no identificado'
			RETURN
		END
	-- Insertando un nuevo registro
	INSERT INTO Autor(
		nombre, 
		idPais, 
		publicacionesCargadas, 
		calificacion, 
		fechaNacimiento,
		idGenero
	)
	VALUES (@nombre, @id_pais, 0, 0.00, @fechaNacimiento, @id_genero)
	PRINT 'El autor fue agregado con éxito'

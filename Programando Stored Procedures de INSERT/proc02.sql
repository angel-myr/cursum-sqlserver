USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_CrearLibro]    Script Date: 15/03/2025 16:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[_CrearLibro](
	@titulo VARCHAR(MAX),
	@genero VARCHAR(50),
	@ano_publicacion INT
)
AS
	-- Preguntar si existe ya ese Libro
	IF(EXISTS(
		SELECT * FROM Libro WHERE titulo = @titulo
	))
		BEGIN
			PRINT 'Error 104: Este libro ya existe'
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
			PRINT 'Error 105: Género no identificado'
			RETURN
		END
	-- Insertando un nuevo registro
	INSERT INTO Libro(
		titulo,
		estado,
		idGenero,
		anoPublicacion
	)
	VALUES (@titulo, 0, @id_genero, @ano_publicacion)
	PRINT 'El libro fue agregado con éxito'

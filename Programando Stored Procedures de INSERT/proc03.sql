USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_CrearRelacionArLoEo]    Script Date: 15/03/2025 16:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[_CrearRelacionArLoEo](
	@nombre_autor VARCHAR(50),
	@titulo_libro VARCHAR(50)
)
AS
	-- Preguntar si existe el autor
	IF(NOT EXISTS(
		SELECT * FROM Autor WHERE nombre = @nombre_autor
	))
		BEGIN
			PRINT 'Error 106: No existe este autor'
			RETURN
		END
	-- Preguntar si existe el libro
	IF(NOT EXISTS(
		SELECT * FROM Libro WHERE titulo = @titulo_libro
	))
		BEGIN
			PRINT 'Error 107: No existe este libro'
			RETURN
		END
	-- Obtener id_libro e id_autor
	DECLARE @id_libro INT = (
		SELECT TOP 1 idLibro FROM Libro WHERE Libro.titulo = @titulo_libro
	)
	DECLARE @id_autor INT = (
		SELECT TOP 1 idAutor FROM Autor WHERE Autor.nombre = @nombre_autor
	)
	-- Crear nuevo EstadoLibro si no existe
	IF(NOT EXISTS(
		SELECT TOP 1 * FROM EstadoLibro WHERE EstadoLibro.idLibro = @id_libro
	))
		BEGIN
			INSERT INTO EstadoLibro(
				idLibro,
				portada,
				epub
			)
			VALUES (@id_libro, 0, 0)
		END
	-- Verificar que no exista esta relación previamente
	IF (EXISTS(
		SELECT * FROM AutorLibroEstadoLibro 
			WHERE idAutor = @id_autor AND idLibro = @id_libro AND idEstadoLibro = @id_libro
	))
		BEGIN
			PRINT 'Error 108: Esta relación ya existe'
			RETURN
		END
	-- Insertar nuevo registro
	INSERT INTO AutorLibroEstadoLibro(
		idAutor,
		idEstadoLibro,
		idLibro
	)
	VALUES (@id_autor, @id_libro, @id_libro)
	PRINT 'La relación fue agregada con éxito'

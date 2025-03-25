--USE cursumSQL

ALTER FUNCTION _ObtenerIDAutorPorNombre(
	@nombre_autor VARCHAR(50)
)
	RETURNS INT
AS
	BEGIN
		DECLARE @id_autor INT
		IF (NOT EXISTS(
			SELECT * FROM Autor WHERE nombre = @nombre_autor
		))
			BEGIN
				RETURN 0
			END
		ELSE
			BEGIN
				SET @id_autor = (
					SELECT TOP 1 idAutor FROM Autor
						WHERE nombre = @nombre_autor
				)
				RETURN @id_autor
			END
		RETURN 0
	END
GO

ALTER FUNCTION _ObtenerIDPaisPorNombre(
	@nombre_pais VARCHAR(50)
)
	RETURNS INT
AS
	BEGIN
		DECLARE @id_pais INT
		IF (NOT EXISTS(
			SELECT * FROM Pais WHERE nombre = @nombre_pais
		))
			BEGIN
				RETURN 0
			END
		ELSE
			BEGIN
				SET @id_pais = (
					SELECT TOP 1 idPais FROM Pais
						WHERE nombre = @nombre_pais
				)
				RETURN @id_pais
			END
		RETURN 0
	END
GO

ALTER FUNCTION _ObtenerIDGeneroPorNombre(
	@nombre_genero VARCHAR(50)
)
	RETURNS INT
AS
	BEGIN
		DECLARE @id_genero INT
		IF (NOT EXISTS(
			SELECT * FROM Genero WHERE nombre = @nombre_genero
		))
			BEGIN
				RETURN 0
			END
		ELSE
			BEGIN
				SET @id_genero = (
					SELECT TOP 1 idGenero FROM Genero
						WHERE nombre = @nombre_genero
				)
				RETURN @id_genero
			END
		RETURN 0
	END
GO

--SELECT * FROM Autor
--SELECT dbo._ObtenerIDAutorPorNombre('Julio Verne')

--SELECT * FROM Genero
--SELECT dbo._ObtenerIDGeneroPorNombre('Terror')

--SELECT * FROM Pais
--SELECT dbo._ObtenerIDPaisPorNombre('Colombia')

ALTER FUNCTION _ObtenerListaDe(
	@categoria VARCHAR(50)
)
	RETURNS @listado TABLE(
		Identificador INT, Elemento VARCHAR(50)
	)
AS
	BEGIN
		SET @categoria = UPPER(@categoria)
		IF (@categoria = 'AUTOR')
			BEGIN
				INSERT INTO @listado 
				SELECT idAutor, nombre FROM Autor
			END
		IF (@categoria = 'GÉNERO' OR @categoria = 'GENERO')
			BEGIN
				INSERT INTO @listado
				SELECT idGenero, nombre FROM Genero
			END
		IF (@categoria = 'PAÍS' OR @categoria = 'PAIS')
			BEGIN
				INSERT INTO @listado
				SELECT idPais, nombre FROM Pais
			END
		IF (@categoria = 'LIBRO')
			BEGIN
				INSERT INTO @listado
				SELECT idLibro, titulo FROM Libro
			END
		RETURN
	END
GO

SELECT * FROM dbo._ObtenerListaDe('Autor')
SELECT * FROM dbo._ObtenerListaDe('Género')
SELECT * FROM dbo._ObtenerListaDe('País')
SELECT * FROM dbo._ObtenerListaDe('Libro')
--USE cursumSQL
--SELECT * FROM Autor

ALTER PROCEDURE _MostrarAutorLibrosEstados(
	@id_autor INT
)
AS
	IF @id_autor = 0
		BEGIN
			PRINT 'Instrucción 0: Mostrar todos los autores'
			SELECT 
				al.idAutor, 
				al.idLibro, 
				ar.nombre AS 'Autor',
				lo.titulo AS 'Libro',
				lo.anoPublicacion AS 'Año de Publicación',
				eo.epub AS 'Estado Archivo',
				eo.portada AS 'Estado Portada'
			FROM AutorLibroEstadoLibro al
				LEFT JOIN Autor ar 
			ON ar.idAutor = al.idAutor
				LEFT JOIN Libro lo
			ON lo.idLibro = al.idLibro
				INNER JOIN EstadoLibro eo
			ON eo.idLibro = al.idLibro
		END
	IF(NOT EXISTS(
		SELECT * FROM Autor WHERE idAutor = @id_autor
	))
		BEGIN
			PRINT 'El autor no existe / no está registrado'
		END
	ELSE
		BEGIN
			PRINT 'El autor existe, mostrando sus datos'
			SELECT 
				al.idAutor, 
				al.idLibro, 
				ar.nombre AS 'Autor',
				lo.titulo AS 'Libro',
				lo.anoPublicacion AS 'Año de Publicación',
				eo.epub AS 'Estado Archivo',
				eo.portada AS 'Estado Portada'
			FROM AutorLibroEstadoLibro al
				LEFT JOIN Autor ar 
			ON ar.idAutor = al.idAutor
				LEFT JOIN Libro lo
			ON lo.idLibro = al.idLibro
				INNER JOIN EstadoLibro eo
			ON eo.idLibro = al.idLibro
			WHERE al.idAutor = @id_autor
		END
GO

--EXECUTE _CrearRelacionArLoEo '', ''
--EXECUTE _MostrarAutorLibrosEstados 1002
--SELECT * FROM AutorLibroEstadoLibro
GO

ALTER PROCEDURE _MostrarGeneroLibrosEstados(
	@id_genero INT
)
AS
	IF @id_genero = 0
		BEGIN
			PRINT 'Instrucción 0: Mostrar todos los géneros'
			SELECT 
				lo.idLibro,
				gro.idGenero,
				gro.nombre,
				lo.titulo,
				elo.epub,
				elo.portada
			FROM Genero gro
				INNER JOIN Libro lo
			ON lo.idGenero = gro.idGenero
				LEFT JOIN EstadoLibro elo
			ON elo.idLibro = lo.idLibro
		END
	IF(NOT EXISTS(
		SELECT * FROM Genero WHERE idGenero = @id_genero
	))
		BEGIN
			PRINT 'El género no existe / no está registrado'
		END
	ELSE
		BEGIN
			PRINT 'El género existe, mostrando sus datos'
			SELECT
				gro.idGenero,
				lo.idLibro,
				gro.nombre,
				lo.titulo,
				elo.epub,
				elo.portada
			FROM Genero gro
				INNER JOIN Libro lo
			ON lo.idGenero = gro.idGenero
				LEFT JOIN EstadoLibro elo
			ON elo.idLibro = lo.idLibro
			WHERE gro.idGenero = @id_genero
		END
GO

--EXECUTE _MostrarGeneroLibrosEstados 1004
GO

ALTER PROCEDURE _MostrarPaisLibrosEstados(
	@id_pais INT
)
AS
	IF @id_pais = 0
		BEGIN
			PRINT 'Intrucción 0: Mostrando todos los datos'
			SELECT
				pais_autor.idPais,
				pais_autor.idAutor,
				autor_libro.idLibro,
				pais_autor.País,
				autor_libro.Libro,
				autor_libro.Archivo,
				autor_libro.Portada
			FROM (
				SELECT 
					ps.idPais,
					ar.idAutor,
					ps.codigo AS 'País (Código)',
					ps.nombre AS 'País',
					ar.nombre AS 'Autor'
				FROM Pais ps
					INNER JOIN Autor ar
				ON ar.idPais = ps.idPais
			) AS pais_autor
			JOIN (
				SELECT 
					lo.idLibro,
					ar.nombre AS 'Autor', 
					lo.titulo AS 'Libro',
					elo.epub AS 'Archivo',
					elo.portada AS 'Portada'
				FROM AutorLibroEstadoLibro alel
					LEFT JOIN Autor ar
				ON ar.idAutor = alel.idAutor
					LEFT JOIN Libro lo
				ON lo.idLibro = alel.idLibro
					LEFT JOIN EstadoLibro elo
				ON elo.idLibro = alel.idEstadoLibro
			) AS autor_libro
			ON pais_autor.Autor = autor_libro.Autor
		END
	IF (NOT EXISTS(
		SELECT * FROM Pais WHERE idPais = @id_pais
	))
		BEGIN
			PRINT 'El país no existe / no está registrado'
		END
	ELSE
		BEGIN
			PRINT 'El país si existe, mostrando sus datos'
			SELECT
				pais_autor.idPais,
				pais_autor.idAutor,
				autor_libro.idLibro,
				pais_autor.País,
				autor_libro.Libro,
				autor_libro.Archivo,
				autor_libro.Portada
			FROM (
				SELECT 
					ps.idPais,
					ar.idAutor,
					ps.codigo AS 'País (Código)',
					ps.nombre AS 'País',
					ar.nombre AS 'Autor'
				FROM Pais ps
					INNER JOIN Autor ar
				ON ar.idPais = ps.idPais
			) AS pais_autor
			JOIN (
				SELECT 
					lo.idLibro,
					ar.nombre AS 'Autor', 
					lo.titulo AS 'Libro',
					elo.epub AS 'Archivo',
					elo.portada AS 'Portada'
				FROM AutorLibroEstadoLibro alel
					LEFT JOIN Autor ar
				ON ar.idAutor = alel.idAutor
					LEFT JOIN Libro lo
				ON lo.idLibro = alel.idLibro
					LEFT JOIN EstadoLibro elo
				ON elo.idLibro = alel.idEstadoLibro
			) AS autor_libro
			ON pais_autor.Autor = autor_libro.Autor
			WHERE pais_autor.idPais = @id_pais
		END
GO

EXECUTE  _MostrarPaisLibrosEstados 1012
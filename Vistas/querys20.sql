USE cursumSQL

SELECT * FROM AutoresLibrosEstados
GO

ALTER VIEW AutoresLibrosEstados
AS
	SELECT 
		alelo.idAutor,
		alelo.idLibro,
		ar.nombre AS 'Autor',
		ar.publicacionesCargadas AS 'Publicaciones',
		ar.calificacion AS 'Calificación',
		ar.fechaNacimiento AS 'Nacimiento',
		ar.sexo AS 'Sexo',
		lo.titulo AS 'Libro',
		lo.anoPublicacion AS 'Publicación',
		elo.portada AS 'Portada',
		elo.epub AS 'Archivo'
	FROM AutorLibroEstadoLibro alelo
		LEFT JOIN Autor ar
	ON ar.idAutor = alelo.idAutor
		LEFT JOIN Libro lo
	ON lo.idLibro = alelo.idLibro
		LEFT JOIN EstadoLibro elo
	ON elo.idLibro = alelo.idEstadoLibro
	
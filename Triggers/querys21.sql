--USE cursumSQL

ALTER TRIGGER CargarEstados ON Libro
	AFTER INSERT
AS
	BEGIN
		IF ((SELECT estado FROM INSERTED) = 0)
			BEGIN
				INSERT INTO EstadoLibro(idLibro, portada, epub)
					SELECT INSERTED.idLibro, 0, 0 FROM INSERTED
			END
		IF ((SELECT estado FROM INSERTED) = 1)
			BEGIN
				INSERT INTO EstadoLibro(idLibro, portada, epub)
					SELECT INSERTED.idLibro, 1, 1 FROM INSERTED
			END
	END
GO

ALTER TRIGGER ActualizarPublicaciones ON Libro
	AFTER UPDATE
AS
	BEGIN
		-- Cambio de estado de publicación del libro a Verdadero
		IF((SELECT estado FROM INSERTED) = 1)
			BEGIN
				-- Verificar si existe relación Libro-Autor
				IF(EXISTS(
					SELECT idLibro FROM AutorLibroEstadoLibro 
					WHERE idLibro = (SELECT idLibro FROM INSERTED)
				))
					BEGIN
						-- Extraer id del autor del libro
						DECLARE @id_autor INT = (
							SELECT idAutor FROM AutorLibroEstadoLibro 
							WHERE idLibro = (SELECT idLibro FROM INSERTED)
						)
						-- Actualizar número de publicaciones cargadas del autor
						UPDATE Autor SET publicacionesCargadas = publicacionesCargadas + 1
						WHERE idAutor = @id_autor
					END
			END
	END
GO

ALTER TRIGGER ActualizarMenosPublicaciones ON AutorLibroEstadoLibro
	AFTER DELETE
AS
	BEGIN
		-- Obtener id del autor eliminado
		DECLARE @id_autor INT = (
			SELECT idAutor FROM DELETED
		)
		-- Actualizar cantidad de publicaciones del autor
		UPDATE Autor SET publicacionesCargadas = publicacionesCargadas - 1
		WHERE idAutor = @id_autor
	END
GO

/* Prueba de primer trigger */

--INSERT INTO Libro(titulo, estado, idGenero, anoPublicacion) VALUES 
--	('La fortaleza digital', 0, 1002, 1998)
--INSERT INTO Libro(titulo, estado, idGenero, anoPublicacion) VALUES 
--	('Inferno', 0, 1002, 2013)

--SELECT * FROM Libro
--SELECT * FROM EstadoLibro


/* Prueba de segundo trigger */

--UPDATE Libro SET estado = 1 WHERE idLibro = 1015
--UPDATE Libro SET estado = 1 WHERE idLibro = 1016
--UPDATE Libro SET estado = 1 WHERE idLibro = 2049

--SELECT * FROM AutorLibroEstadoLibro
--SELECT * FROM Libro
--SELECT * FROM Autor

/* Prueba del tercer trigger */
--DELETE FROM AutorLibroEstadoLibro
--	WHERE idAutor = 1002 AND idLibro = 1015

--SELECT * FROM AutorLibroEstadoLibro
--SELECT * FROM Autor
/*
	Sentencias
*/

/* Mostrar */

--SELECT * FROM Pais
--SELECT Pais.idPais, Pais.codigo FROM Pais
SELECT * FROM Autor
SELECT * FROM Genero
SELECT * FROM Pais
SELECT * FROM Libro

/* Insertar */

--INSERT INTO Pais (nombre, continente, codigo) VALUES ('Brazil', 'América', 'BRA'),
--('Chile', 'América', 'CHI'), ('Italia', 'Europa', 'ITA')
--INSERT INTO Pais (nombre, continente, codigo) VALUES ('Francia', 'Europa', 'FRA')
--INSERT INTO Autor (nombre, idPais, publicacionesCargadas, calificacion, fechaNacimiento, idGenero) VALUES
--('Victor Hugo', 1010, 0, 0.0, '1802-02-26', 1001)
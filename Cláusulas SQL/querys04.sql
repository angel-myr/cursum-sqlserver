/*
    Sentencias
*/

USE cursumSQL

--SELECT TOP 5 titulo, idGenero FROM Libro
--SELECT TOP 3 idPais, codigo FROM Pais

--SELECT * FROM Autor ORDER BY fechaNacimiento DESC

--SELECT TOP 3 nombre, fechaNacimiento FROM Autor ORDER BY fechaNacimiento ASC

--SELECT DISTINCT idGenero FROM Libro
--SELECT DISTINCT idPais FROM Autor

--SELECT idGenero FROM Genero GROUP BY idGenero

SELECT * FROM Autor WHERE idPais = 1010 AND calificacion = 0.0
SELECT * FROM Autor WHERE fechaNacimiento < '1900-01-01'

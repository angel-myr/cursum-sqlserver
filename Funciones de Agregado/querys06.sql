/*
	Sentencias
*/

USE cursumSQL

/* Funci�n MAX y MIN */
--SELECT idLibro, titulo, anoPublicacion FROM Libro 
--WHERE anoPublicacion = (SELECT min(anoPublicacion) FROM Libro) 

--SELECT nombre, fechaNacimiento FROM Autor
--WHERE fechaNacimiento = (SELECT max(fechaNacimiento) FROM Autor)

/* Funci�n SUM */
--SELECT SUM(anoPublicacion) / COUNT(idLibro) FROM Libro
--SELECT SUM(publicacionesCargadas) FROM Autor

/* Funci�n AVG */
--SELECT AVG(anoPublicacion) FROM Libro
--SELECT AVG(calificacion * 0.75) + 1 AS 'Calificaci�n Pesimista' FROM Autor

/* Funci�n COUNT */
--SELECT COUNT(*) FROM Genero
--SELECT COUNT(*) AS 'Cantidad Autores Franceses' FROM Autor 
--WHERE idPais = (SELECT idPais FROM Pais WHERE codigo = 'FRA')

/* Funci�n HAVING */
--SELECT AVG(calificacion) AS 'Cal. Prom. de Autores de Terror' 
--FROM Autor GROUP BY idPais HAVING idPais = 1010

--SELECT nombre, codigo FROM Pais WHERE idPais = (
--	SELECT idPais FROM Autor
--	GROUP BY idPais HAVING COUNT(idPais) >= 3
--)

--SELECT AVG(anoPublicacion) AS 'A�o Promedio de Novelas por Genero' 
--FROM Libro GROUP BY idGenero HAVING COUNT(idGenero) >= 1



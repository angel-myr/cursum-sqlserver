/*
	Sentencias
*/

USE cursumSQL

/* JOINS */

--SELECT 
--	ar.nombre, 
--	ar.idPais, 
--	ps.nombre, 
--	ps.continente 
--FROM Autor ar
--INNER JOIN Pais ps
--ON ps.idPais = ar.idPais

--SELECT 
--	ar.nombre, 
--	ar.idPais, 
--	ps.nombre, 
--	ps.continente 
--FROM Autor ar
--RIGHT JOIN Pais ps
--ON ps.idPais = ar.idPais

--SELECT 
--	ar.nombre, 
--	ar.idPais, 
--	ps.nombre, 
--	ps.continente 
--FROM Autor ar
--LEFT JOIN Pais ps
--ON ps.idPais = ar.idPais

/* UNION y UNION ALL */
SELECT 
	titulo, 
	anoPublicacion 
FROM Libro WHERE anoPublicacion < 1900
UNION
SELECT 
	titulo, 
	anoPublicacion 
FROM Libro WHERE anoPublicacion > 1999

SELECT 
	titulo, 
	anoPublicacion 
FROM Libro WHERE idGenero > 1004
UNION ALL
SELECT 
	titulo, 
	anoPublicacion 
FROM Libro WHERE idGenero < 1010
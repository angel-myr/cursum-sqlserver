
USE cursumSQL

/* Operador AND y OR */
--SELECT * FROM Libro
--WHERE (anoPublicacion > 1950 and anoPublicacion < 1960) 
--	or anoPublicacion = 1982

/* Operador IN */
--SELECT * FROM Autor WHERE idGenero IN (1001, 1002)
--SELECT * FROM Autor WHERE nombre IN ('Victor Hugo', 'Julio Verne')

/* Operador LIKE */
--SELECT * FROM Autor WHERE nombre LIKE '%v%' or nombre LIKE '%a%'
--SELECT * FROM Genero WHERE descripcion LIKE '%hechos%'

/* Operador NOT */
--SELECT * FROM Autor WHERE 
--	nombre NOT IN ('Victor Hugo', 'Julio Verne', 'Alejandro Dumas')
--SELECT * FROM Genero WHERE 
--	nombre NOT LIKE '%a%' and NOT idGenero <= 1003

/* Operador BETWEEN */
SELECT nombre, fechaNacimiento FROM Autor
	WHERE fechaNacimiento BETWEEN '1800-01-01' AND '1899-12-31'
SELECT titulo, anoPublicacion FROM Libro
	WHERE anoPublicacion BETWEEN 1900 AND 1960

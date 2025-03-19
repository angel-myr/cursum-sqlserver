/*
	Sentencias
*/

USE cursumSQL

/* Funci�n LEFT y RIGHT */

--DECLARE @autores VARCHAR(50) = (
--	SELECT TOP 1 nombre FROM Autor
--)
--DECLARE @paises VARCHAR (50) = (
--	SELECT TOP 1 nombre FROM Pais
--)
--DECLARE @pseudo VARCHAR(100) = LEFT(@autores, 3) + '-' + RIGHT(@paises, 3)
--PRINT(@pseudo)

--SELECT LEFT(ar.nombre, 3), (
--	SELECT RIGHT(ps.nombre, 2) FROM Pais ps WHERE ar.idPais = ps.idPais
--) FROM Autor ar

/* Funci�n LEN, LOWER y UPPER */
--SELECT 
--	titulo, 
--	LEN(titulo) AS 'Tama�o', 
--	(
--		UPPER(LEFT(titulo, LEN(titulo)/2)) + '---' +
--		LOWER(RIGHT(titulo, LEN(titulo)/2))
--	) AS 'Titular'
--FROM Libro ORDER BY 'Tama�o'

/* Funci�n REPLACE, LTRIM, RTRIM y CONCAT */

--SELECT 
--	nombre, 
--	REPLACE(nombre, ' ', '_'), 
--	LTRIM('   _' + codigo) AS 'C�digo Alt Izquierda',
--	RTRIM(codigo + '_    ') AS 'C�digo Alt Derecha'
--FROM Pais
--SELECT 
--	idAutor,
--	nombre, 
--	CONCAT(LOWER(REPLACE(nombre, ' ','')), idAutor) AS 'Username' 
--FROM Autor

/* Funci�n GETDATE y GETUTCDATE */
--SELECT 
--	GETDATE() AS 'Tiempo del Sistema',
--	GETUTCDATE() AS 'Tiempo Convencional Mundial'

/* Funci�n DATEADD */
DECLARE @fechaNacimiento DATE = (
	SELECT TOP 1 fechaNacimiento FROM Autor
	WHERE idAutor = 3010
)
--SELECT 
--	idAutor,
--	fechaNacimiento,
--	DATEADD(YEAR, +5, fechaNacimiento) AS '5 a�os despu�s',
--	DATEADD(MONTH, +5, fechaNacimiento) AS '5 meses despu�s',
--	DATEADD(DAYOFYEAR, +5, fechaNacimiento) AS '5 d�as despu�s',
--	DATEADD(DAY, +5, fechaNacimiento) AS '5 d�as despu�s',
--	DATEADD(WEEK, +5, fechaNacimiento) AS '5 semanas despu�s'
--	DATEADD(HOUR, +5, fechaNacimiento)
--FROM Autor
--SELECT
--	idAutor,
--	fechaNacimiento,
--	DATEDIFF(YEAR, fechaNacimiento, GETDATE()) AS 'Tiene ___ a�os',
--	DATEDIFF(MONTH, fechaNacimiento, GETDATE()) AS 'Tiene ___ meses',
--	DATEDIFF(DAYOFYEAR, fechaNacimiento, GETDATE()) AS 'Tiene ___ d�as',
--	DATEDIFF(DAY, fechaNacimiento, GETDATE()) AS 'Tiene ___ d�as',
--	DATEDIFF(WEEK, fechaNacimiento, GETDATE()) AS 'Tiene ___ semanas'
--	DATEDIFF(HOUR, fechaNacimiento, GETDATE()) AS 'Tiene ___ meses'
--FROM Autor

/* Funci�n DATEPART y ISDATE */

--SELECT 
--	idAutor,
--	fechaNacimiento,
--	DATEPART(YEAR, fechaNacimiento) AS 'A�o',
--	DATEPART(MONTH, fechaNacimiento) AS 'Mes',
--	DATEPART(DAYOFYEAR, fechaNacimiento) AS 'D�a del A�o',
--	DATEPART(DAY, fechaNacimiento) AS 'D�a del Mes',
--	DATEPART(WEEK, fechaNacimiento) AS 'Semana', 
--	DATEPART(WEEKDAY, fechaNacimiento) AS 'D�a de la Semana'
--FROM Autor

/* Funci�n CAST y CONVERT */

DECLARE @monto INT = 690
SELECT 
	@monto AS 'Entero', 
	CAST(@monto AS MONEY) AS 'Dinero',
	CONVERT(VARCHAR(50), @monto) AS 'Texto'


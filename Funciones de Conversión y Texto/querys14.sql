/*
	Sentencias
*/

USE cursumSQL

/* Función LEFT y RIGHT */

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

/* Función LEN, LOWER y UPPER */
--SELECT 
--	titulo, 
--	LEN(titulo) AS 'Tamaño', 
--	(
--		UPPER(LEFT(titulo, LEN(titulo)/2)) + '---' +
--		LOWER(RIGHT(titulo, LEN(titulo)/2))
--	) AS 'Titular'
--FROM Libro ORDER BY 'Tamaño'

/* Función REPLACE, LTRIM, RTRIM y CONCAT */

--SELECT 
--	nombre, 
--	REPLACE(nombre, ' ', '_'), 
--	LTRIM('   _' + codigo) AS 'Código Alt Izquierda',
--	RTRIM(codigo + '_    ') AS 'Código Alt Derecha'
--FROM Pais
--SELECT 
--	idAutor,
--	nombre, 
--	CONCAT(LOWER(REPLACE(nombre, ' ','')), idAutor) AS 'Username' 
--FROM Autor

/* Función GETDATE y GETUTCDATE */
--SELECT 
--	GETDATE() AS 'Tiempo del Sistema',
--	GETUTCDATE() AS 'Tiempo Convencional Mundial'

/* Función DATEADD */
DECLARE @fechaNacimiento DATE = (
	SELECT TOP 1 fechaNacimiento FROM Autor
	WHERE idAutor = 3010
)
--SELECT 
--	idAutor,
--	fechaNacimiento,
--	DATEADD(YEAR, +5, fechaNacimiento) AS '5 años después',
--	DATEADD(MONTH, +5, fechaNacimiento) AS '5 meses después',
--	DATEADD(DAYOFYEAR, +5, fechaNacimiento) AS '5 días después',
--	DATEADD(DAY, +5, fechaNacimiento) AS '5 días después',
--	DATEADD(WEEK, +5, fechaNacimiento) AS '5 semanas después'
--	DATEADD(HOUR, +5, fechaNacimiento)
--FROM Autor
--SELECT
--	idAutor,
--	fechaNacimiento,
--	DATEDIFF(YEAR, fechaNacimiento, GETDATE()) AS 'Tiene ___ años',
--	DATEDIFF(MONTH, fechaNacimiento, GETDATE()) AS 'Tiene ___ meses',
--	DATEDIFF(DAYOFYEAR, fechaNacimiento, GETDATE()) AS 'Tiene ___ días',
--	DATEDIFF(DAY, fechaNacimiento, GETDATE()) AS 'Tiene ___ días',
--	DATEDIFF(WEEK, fechaNacimiento, GETDATE()) AS 'Tiene ___ semanas'
--	DATEDIFF(HOUR, fechaNacimiento, GETDATE()) AS 'Tiene ___ meses'
--FROM Autor

/* Función DATEPART y ISDATE */

--SELECT 
--	idAutor,
--	fechaNacimiento,
--	DATEPART(YEAR, fechaNacimiento) AS 'Año',
--	DATEPART(MONTH, fechaNacimiento) AS 'Mes',
--	DATEPART(DAYOFYEAR, fechaNacimiento) AS 'Día del Año',
--	DATEPART(DAY, fechaNacimiento) AS 'Día del Mes',
--	DATEPART(WEEK, fechaNacimiento) AS 'Semana', 
--	DATEPART(WEEKDAY, fechaNacimiento) AS 'Día de la Semana'
--FROM Autor

/* Función CAST y CONVERT */

DECLARE @monto INT = 690
SELECT 
	@monto AS 'Entero', 
	CAST(@monto AS MONEY) AS 'Dinero',
	CONVERT(VARCHAR(50), @monto) AS 'Texto'


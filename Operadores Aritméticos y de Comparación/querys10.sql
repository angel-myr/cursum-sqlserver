/* Operadores + - / * % */
USE cursumSQL

DECLARE @sentencia VARCHAR(50) = 'El autor mejor calificado es'
DECLARE @autor VARCHAR(50) = (
	SELECT TOP 1 nombre FROM Autor WHERE calificacion = (
		SELECT TOP 1 MAX(calificacion) FROM Autor
	)
)
DECLARE @resultado VARCHAR(100) = @sentencia + ' ' + @autor
PRINT @resultado

DECLARE @a DECIMAL(10,2) = 30
DECLARE @b DECIMAL(10,2) = 20
PRINT @a + @b
PRINT @a - @b
PRINT @a * @b
PRINT @a / @b
PRINT @a % @b

/* = > < <> */
DECLARE @otro VARCHAR(50) = 'Stephen King'
IF @sentencia > @autor
	PRINT 'Es mayor'
IF @autor <> @otro
	PRINT 'Son diferentes'
IF @sentencia < @autor
	PRINT 'Es menor'
IF @autor = @otro
	PRINT 'Son iguales'
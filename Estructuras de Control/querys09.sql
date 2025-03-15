/*
	Sentencias
*/

/* IF ELSE EXISTS() */
--DECLARE @id_genero int
--SET @id_genero = 1003

--IF EXISTS(SELECT * FROM Libro WHERE idGenero = @id_genero) 
--	AND @id_genero > 1000
--	BEGIN
--		PRINT 'Existe'
--		SELECT * FROM Libro WHERE idGenero = @id_genero
--	END
--ELSE
--	BEGIN
--		PRINT 'No existen registros con ese codigo'
--		SELECT * FROM Libro
--	END

/* WHILE */
--DECLARE @cantidadRegistros INT = (SELECT COUNT(idLibro) FROM Libro)
--DECLARE @contador INT = 0
--DECLARE @inicio INT = (SELECT TOP 1 idLibro FROM Libro)

--PRINT @cantidadRegistros
--PRINT @contador
--PRINT @inicio

--WHILE @contador < @cantidadRegistros
--	BEGIN
--		SELECT idLibro, titulo FROM Libro WHERE idLibro = (@inicio + @contador)
--		SET @contador = @contador + 1
--	END

/* CASE */
--SELECT * FROM Genero
--DECLARE @genero varchar(50) = 'Ficción'
--DECLARE @comentario varchar(max) = ''

--SET @comentario = (
--	CASE
--		WHEN @genero = 'Ficción' THEN 'Bastante creativo'
--		WHEN @genero = 'Terror' THEN 'Dio mucho miedo'
--		WHEN @genero = 'Historia' THEN 'Entendi muchas referencias'
--		WHEN @genero = 'Fantasía' THEN 'Nada del otro mundo'
--		WHEN @genero = 'Misterio' THEN 'Muchos huecos argumentales'
--		ELSE 'Muy aburrido'
--	END
--)
--PRINT @comentario

--SELECT idGenero, nombre, (
--	CASE
--		WHEN nombre = 'Ficción' THEN 'Bastante creativo'
--		WHEN nombre = 'Terror' THEN 'Dio mucho miedo'
--		WHEN nombre = 'Historia' THEN 'Entendi muchas referencias'
--		WHEN nombre = 'Fantasía' THEN 'Nada del otro mundo'
--		WHEN nombre = 'Misterio' THEN 'Muchos huecos argumentales'
--		ELSE 'Muy aburrido'
--	END
--) AS 'Opinion' FROM Genero

/* RETURN BREAK TRY CATCH */
--DECLARE @contador INT = 0
--WHILE @contador <= 20
--BEGIN
--	PRINT @contador
--	IF @contador = 12
--		BEGIN
--			PRINT 'Numero de la suerte'
--			BREAK
--			PRINT 'Nada más'
--		END
--	IF @contador = 13
--		BEGIN
--			PRINT 'Numero maldito'
--			RETURN
--			PRINT 'Nada más'
--		END
--	print 'Ciclo culminado'
--	SET @contador = @contador + 1
--	PRINT @contador
--END
BEGIN TRY
	DECLARE @secreto INT
	SET @secreto = 'Hola'
	PRINT @secreto
END TRY
BEGIN CATCH
	PRINT 'Error en tipo de dato: No puedes declarar como VARCHAR'
END CATCH
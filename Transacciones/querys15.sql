/*
	Sentencias
*/

USE cursumSQL
GO

--SELECT * FROM Autor

--BEGIN TRANSACTION
--	UPDATE Autor SET publicacionesCargadas = 0
--		WHERE idGenero = 1001
--	if @@ROWCOUNT <= 5
--		COMMIT TRANSACTION
--	else
--		ROLLBACK TRANSACTION
		
--SELECT * FROM Autor

SELECT * FROM Libro ORDER BY anoPublicacion

BEGIN TRANSACTION
	UPDATE Libro SET estado = 10
		WHERE anoPublicacion > 2000
	IF @@ROWCOUNT > 5
		COMMIT TRANSACTION
	ELSE
		ROLLBACK TRANSACTION

SELECT * FROM Libro ORDER BY anoPublicacion


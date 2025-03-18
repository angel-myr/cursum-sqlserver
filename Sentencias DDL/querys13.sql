/*
	Sentencias
*/

USE cursumSQL
GO

/* FUNCIONES */

--CREATE FUNCTION _ObtenerEdadAutor (
--	@idAutor INT
--) 
--RETURNS INT
--AS
--BEGIN
--	DECLARE @fechaNacimiento DATE = (
--		SELECT fechaNacimiento FROM Autor WHERE idAutor = @idAutor
--	)
--	DECLARE @fechaActual DATE = GETDATE()
--	DECLARE @edad INT = DATEDIFF(YEAR, @fechaNacimiento, @fechaActual)
--	RETURN @edad
--END

--SELECT dbo._ObtenerEdadAutor(1008)


/* ALTER TABLE*/

--ALTER TABLE Autor ADD sexo VARCHAR(10)
--ALTER TABLE Autor ALTER COLUMN sexo BIT
--ALTER TABLE Autor DROP COLUMN sexo

--ALTER TABLE Autor
--ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)

--ALTER TABLE Libro
--ADD FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)

--ALTER TABLE EstadoLibro
--ADD FOREIGN KEY (idLibro) REFERENCES Libro(idLibro)

/* DROP y TRUNCATE TABLE */

CREATE TABLE Error (
	idError INT,
	descripcion VARCHAR(MAX),
	solucion VARCHAR(MAX),
	activo BIT,
)
INSERT INTO Error(idError, descripcion, solucion, activo) 
	VALUES (101, 'Registro no encontrado en la tabla', 'Control + R', 0)
INSERT INTO Error(idError, descripcion, solucion, activo) 
	VALUES (106, 'No se pude procesar un valor NULL', 'Formatear', 1)
INSERT INTO Error(idError, descripcion, solucion, activo) 
	VALUES (108, 'Tipo de datos erróneo', 'Consultar documentación', 1)
SELECT * FROM Error
TRUNCATE TABLE Error
DROP TABLE Error
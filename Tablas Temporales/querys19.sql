-- Tabla Temporal en Memoria
DECLARE @Personaje TABLE (
	idPersonaje INT IDENTITY(1, 1),
	nombre VARCHAR(50)
)
INSERT INTO @Personaje VALUES ('Rodia Raskolnikov')
INSERT INTO @Personaje VALUES ('Aureliano Buend�a')
INSERT INTO @Personaje VALUES ('Robert Langdon')
INSERT INTO @Personaje VALUES ('Jean Valjean')
INSERT INTO @Personaje VALUES ('Hamlet')
SELECT * FROM @Personaje

-- Tabla Temporal F�sica
CREATE TABLE Personaje (
	idPersonaje INT IDENTITY(1, 1),
	nombre VARCHAR(50)
)
INSERT INTO Personaje VALUES ('Rodia Raskolnikov')
INSERT INTO Personaje VALUES ('Aureliano Buend�a')
INSERT INTO Personaje VALUES ('Robert Langdon')
INSERT INTO Personaje VALUES ('Jean Valjean')
INSERT INTO Personaje VALUES ('Hamlet')
SELECT * FROM Personaje
DROP TABLE Personaje








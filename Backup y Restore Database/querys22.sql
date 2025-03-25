--USE cursumSQL

DECLARE @fecha VARCHAR(MAX) = CONVERT(char(20), GETDATE(), 120)
SET @fecha = REPLACE(@fecha,'-','')
SET @fecha = REPLACE(@fecha,':','')
SET @fecha = REPLACE(@fecha,' ','')
PRINT @fecha

DECLARE @ruta VARCHAR(MAX) = 'C:\Prueba\cursumSQL' + @fecha + '.bak'
PRINT @ruta

BACKUP DATABASE cursumSQL
TO DISK = @ruta
WITH NO_COMPRESSION, NAME = 'ergumSQL'
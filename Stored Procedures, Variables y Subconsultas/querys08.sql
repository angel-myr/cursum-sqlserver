USE cursumSQL

--EXECUTE _BusquedaAutorPorID 2014
--EXECUTE _CrearAutorFantasma
--EXECUTE _ActualizarNacimientoAutor 3010, NULL
EXECUTE _DatosCompletosAutor 2014

SELECT * 
FROM sys.objects 
WHERE (type = 'P' AND name = '_BusquedaAutorPorID')
OR (type = 'P' AND name = '_ActualizarNacimientoAutor') 
OR (type = 'P' AND name = '_CrearAutorFantasma') 
OR (type = 'P' AND name = '_DatosCompletosAutor')

SELECT * FROM Autor

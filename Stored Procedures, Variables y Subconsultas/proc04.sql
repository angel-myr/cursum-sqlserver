USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_DatosCompletosAutor]    Script Date: 14/03/2025 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[_DatosCompletosAutor](
	@id_autor INT
)
AS
	SELECT idAutor, nombre, 
		(SELECT nombre FROM Pais ps WHERE ps.idPais = ar.idPais)
		AS 'Pais',
		publicacionesCargadas, calificacion, fechaNacimiento,
		(SELECT nombre FROM Genero gro WHERE gro.idGenero = ar.idPais)
		AS 'Genero Principal'
	FROM Autor ar WHERE ar.idAutor = @id_autor

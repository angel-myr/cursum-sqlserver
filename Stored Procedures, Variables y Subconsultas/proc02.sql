USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_BusquedaAutorPorID]    Script Date: 14/03/2025 16:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[_BusquedaAutorPorID](
	@id_autor int
)
AS
	DECLARE @id_autor_verificado INT
	SET @id_autor_verificado = ISNULL(@id_autor, 1001)
	PRINT @id_autor_verificado

	SELECT * FROM Autor WHERE idAutor = @id_autor_verificado

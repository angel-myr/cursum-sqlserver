USE [cursumSQL]
GO
/****** Object:  StoredProcedure [dbo].[_ActualizarNacimientoAutor]    Script Date: 14/03/2025 16:28:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE _BusquedaAutorPorID 2014
ALTER PROCEDURE [dbo].[_ActualizarNacimientoAutor](
	@id_autor INT,
	@fecha DATE
)
AS
	UPDATE Autor SET fechaNacimiento = ISNULL(@fecha, GETDATE())
		WHERE idAutor = @id_autor

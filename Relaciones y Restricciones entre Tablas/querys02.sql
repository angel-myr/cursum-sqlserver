/*
	Sentencias
*/

/* Establecer llaves foráneas */
--ALTER TABLE DescargaUsuarioLibro
--ADD CONSTRAINT FK_DescargaUsuarioLibro_Descarga FOREIGN KEY (idDescarga)
--REFERENCES Descarga(idDescarga);

--ALTER TABLE DescargaUsuarioLibro
--ADD CONSTRAINT FK_DescargaUsuarioLibro_Usuario FOREIGN KEY (idUsuario)
--REFERENCES Usuario(idUsuario);

--ALTER TABLE DescargaUsuarioLibro
--ADD CONSTRAINT FK_DescargaUsuarioLibro_Libro FOREIGN KEY (idLibro)
--REFERENCES Libro(idLibro);

/* Eliminar una llave foránea */
--ALTER TABLE DescargaUsuarioLibro  
--DROP CONSTRAINT FK_DescargaUsuarioLibro_Descarga;  

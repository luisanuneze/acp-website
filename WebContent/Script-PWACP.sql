/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/*  Created On : 05-mar.-2021 21:43:43 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS "Árbol" CASCADE
;

DROP TABLE IF EXISTS "Banner" CASCADE
;

DROP TABLE IF EXISTS "CatalogoDeProductos" CASCADE
;

DROP TABLE IF EXISTS "CatalogoDeServicios" CASCADE
;

DROP TABLE IF EXISTS "Distribuccion" CASCADE
;

DROP TABLE IF EXISTS "Evento" CASCADE
;

DROP TABLE IF EXISTS "Familia" CASCADE
;

DROP TABLE IF EXISTS "Floracion" CASCADE
;

DROP TABLE IF EXISTS "Formulario" CASCADE
;

DROP TABLE IF EXISTS "Genero" CASCADE
;

DROP TABLE IF EXISTS "Home" CASCADE
;

DROP TABLE IF EXISTS "Info_footer" CASCADE
;

DROP TABLE IF EXISTS "Mapa" CASCADE
;

DROP TABLE IF EXISTS "Multimedia" CASCADE
;

DROP TABLE IF EXISTS "Opciones" CASCADE
;

DROP TABLE IF EXISTS "Pais" CASCADE
;

DROP TABLE IF EXISTS "Publicaciones" CASCADE
;

DROP TABLE IF EXISTS "PublicacionesMultimedia" CASCADE
;

DROP TABLE IF EXISTS "Region" CASCADE
;

DROP TABLE IF EXISTS "Rol" CASCADE
;

DROP TABLE IF EXISTS "Rol_opciones" CASCADE
;

DROP TABLE IF EXISTS "Rol_usuario" CASCADE
;

DROP TABLE IF EXISTS "Sector" CASCADE
;

DROP TABLE IF EXISTS "Servicios" CASCADE
;

DROP TABLE IF EXISTS "TipoDeVisualizacion" CASCADE
;

DROP TABLE IF EXISTS "TipoProducto" CASCADE
;

DROP TABLE IF EXISTS "Usuario" CASCADE
;

/* Create Tables */

CREATE TABLE "Árbol"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Geoma" varchar NULL,
	"Nombrecientifico" varchar NULL,
	"Nombrecomun" varchar NULL,
	"ÁrbolID" integer NOT NULL,
	"DistribuccionID" integer NOT NULL,
	"FamiliaID" integer NOT NULL,
	"GeneroID" integer NOT NULL,
	"FloracionID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Banner"
(
	"Descripcion" varchar NULL,
	"Estado" varchar NULL,
	"Imagen" varchar NULL,
	"BannerID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "CatalogoDeProductos"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Foto" varchar NULL,
	"Nombre" varchar(50) NULL,
	"CatalogoDeProductosID" integer NOT NULL,
	"TipoProductoID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "CatalogoDeServicios"
(
	"Nombre" varchar NULL,
	"Tipo" varchar NULL,
	"CatalogoDeServiciosID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Distribuccion"
(
	"Descripcion" varchar(50) NULL,
	"Estado" integer NULL,
	"Nombre" varchar NULL,
	"DistribuccionID" integer NOT NULL,
	"PaisID" integer NOT NULL
)
;

CREATE TABLE "Evento"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Fechafin" date NULL,
	"Fechainicio" date NULL,
	"Hipervinculo" varchar NULL,
	"Nombre" varchar NULL,
	"Tipoevento" varchar NULL,
	"Ubicacion" varchar NULL,
	"EventoID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Familia"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Nombre" varchar NULL,
	"FamiliaID" integer NOT NULL
)
;

CREATE TABLE "Floracion"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Nombre" varchar NULL,
	"Temporada" varchar NULL,
	"FloracionID" integer NOT NULL
)
;

CREATE TABLE "Formulario"
(
	"Correoelectronico" varchar NULL,
	"Cuerpoemail" varchar NULL,
	"Nombreusuario" varchar NULL,
	"Numerotelefono" integer NULL,
	"FormularioID" integer NOT NULL,
	"CatalogoDeServiciosID" integer NULL
)
;

CREATE TABLE "Genero"
(
	"Descripcion" varchar NULL,
	"Estado" varchar NULL,
	"Nombre" varchar NULL,
	"GeneroID" integer NOT NULL
)
;

CREATE TABLE "Home"
(
	"Descrip_pag" varchar NULL,
	"Historia" varchar NULL,
	"Mision" varchar NULL,
	"Vision" varchar NULL,
	"HomeID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Info_footer"
(
	"Correo" varchar NULL,
	"Descripcion" varchar NULL,
	"Extension" varchar NULL,
	"Telefono" integer NULL,
	"Info_footerID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Mapa"
(
	"Estado" integer NULL,
	"Nombre" varchar NULL,
	"MapaID" integer NOT NULL,
	"ÁrbolID" integer NOT NULL,
	"SectorID" integer NOT NULL
)
;

CREATE TABLE "Multimedia"
(
	"Estado" integer NULL,
	"Tipomultimedia" varchar NULL,
	"MultimediaID" integer NOT NULL
)
;

CREATE TABLE "Opciones"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"OpcionesID" integer NOT NULL
)
;

CREATE TABLE "Pais"
(
	"Estado" varchar NULL,
	"Nombre" varchar NULL,
	"PaisID" integer NOT NULL,
	"RegionID" integer NOT NULL
)
;

CREATE TABLE "Publicaciones"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Multimedia" varchar NULL,
	"PublicacionesID" integer NOT NULL,
	"Titulo" varchar NULL,
	"UsuarioID" integer NOT NULL,
	"TipoDeVisualizacionID" integer NULL
)
;

CREATE TABLE "PublicacionesMultimedia"
(
	"MultimediaID" integer NULL,
	"PublicacionesID" integer NULL
)
;

CREATE TABLE "Region"
(
	"Estado" varchar NULL,
	"Idregion" varchar NULL,
	"Nombre" varchar NULL,
	"RegionID" integer NOT NULL
)
;

CREATE TABLE "Rol"
(
	"Estado" integer NULL,
	"Roldescripcion" varchar NULL,
	"RolID" integer NOT NULL
)
;

CREATE TABLE "Rol_opciones"
(
	"Rol_opcionesID" integer NOT NULL,
	"OpcionesID" integer NOT NULL,
	"RolID" integer NOT NULL
)
;

CREATE TABLE "Rol_usuario"
(
	"Rol_usuarioID" integer NOT NULL,
	"RolID" integer NOT NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "Sector"
(
	"Estado" integer NULL,
	"Geoms" geometry NULL,
	"Nombre" varchar NULL,
	"SectorID" integer NOT NULL
)
;

CREATE TABLE "Servicios"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Foto" varchar NULL,
	"Nombre" varchar NULL,
	"ServiciosID" integer NOT NULL,
	"CatalogoDeServiciosID" integer NULL,
	"UsuarioID" integer NOT NULL
)
;

CREATE TABLE "TipoDeVisualizacion"
(
	"Descripcion" varchar NULL,
	"Nombre" varchar NULL,
	"TipoDeVisualizacionID" integer NOT NULL
)
;

CREATE TABLE "TipoProducto"
(
	"Descripcion" varchar NULL,
	"Estado" integer NULL,
	"Tipoproducto" varchar NULL,
	"TipoProductoID" integer NOT NULL
)
;

CREATE TABLE "Usuario"
(
	"Apellidos" varchar NULL,
	"Contrasenia" varchar NULL,
	"Email" varchar NULL,
	"Estado" integer NULL,
	"Nombres" varchar NULL,
	"Usuario" varchar NULL,
	"UsuarioID" integer NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "Árbol" ADD CONSTRAINT "PK_Árbol"
	PRIMARY KEY ("ÁrbolID")
;

ALTER TABLE "Banner" ADD CONSTRAINT "PK_Banner"
	PRIMARY KEY ("BannerID")
;

ALTER TABLE "CatalogoDeProductos" ADD CONSTRAINT "PK_CatalogoDeProductos"
	PRIMARY KEY ("CatalogoDeProductosID")
;

ALTER TABLE "CatalogoDeServicios" ADD CONSTRAINT "PK_CatalogoDeServicios"
	PRIMARY KEY ("CatalogoDeServiciosID")
;

ALTER TABLE "Distribuccion" ADD CONSTRAINT "PK_Distribuccion"
	PRIMARY KEY ("DistribuccionID")
;

ALTER TABLE "Evento" ADD CONSTRAINT "PK_Evento"
	PRIMARY KEY ("EventoID")
;

ALTER TABLE "Familia" ADD CONSTRAINT "PK_Familia"
	PRIMARY KEY ("FamiliaID")
;

ALTER TABLE "Floracion" ADD CONSTRAINT "PK_Floracion"
	PRIMARY KEY ("FloracionID")
;

ALTER TABLE "Formulario" ADD CONSTRAINT "PK_Formulario"
	PRIMARY KEY ("FormularioID")
;

ALTER TABLE "Genero" ADD CONSTRAINT "PK_Genero"
	PRIMARY KEY ("GeneroID")
;

ALTER TABLE "Home" ADD CONSTRAINT "PK_Home"
	PRIMARY KEY ("HomeID")
;

ALTER TABLE "Info_footer" ADD CONSTRAINT "PK_Info_footer"
	PRIMARY KEY ("Info_footerID")
;

ALTER TABLE "Mapa" ADD CONSTRAINT "PK_Mapa"
	PRIMARY KEY ("MapaID")
;

ALTER TABLE "Multimedia" ADD CONSTRAINT "PK_Multimedia"
	PRIMARY KEY ("MultimediaID")
;

ALTER TABLE "Opciones" ADD CONSTRAINT "PK_Opciones"
	PRIMARY KEY ("OpcionesID")
;

ALTER TABLE "Pais" ADD CONSTRAINT "PK_Pais"
	PRIMARY KEY ("PaisID")
;

ALTER TABLE "Publicaciones" ADD CONSTRAINT "PK_Publicaciones"
	PRIMARY KEY ("PublicacionesID")
;

ALTER TABLE "Region" ADD CONSTRAINT "PK_Region"
	PRIMARY KEY ("RegionID")
;

ALTER TABLE "Rol" ADD CONSTRAINT "PK_Rol"
	PRIMARY KEY ("RolID")
;

ALTER TABLE "Rol_opciones" ADD CONSTRAINT "PK_Rol_opciones"
	PRIMARY KEY ("Rol_opcionesID")
;

ALTER TABLE "Rol_usuario" ADD CONSTRAINT "PK_Rol_usuario"
	PRIMARY KEY ("Rol_usuarioID")
;

ALTER TABLE "Sector" ADD CONSTRAINT "PK_Sector"
	PRIMARY KEY ("SectorID")
;

ALTER TABLE "Servicios" ADD CONSTRAINT "PK_Servicios"
	PRIMARY KEY ("ServiciosID")
;

ALTER TABLE "TipoDeVisualizacion" ADD CONSTRAINT "PK_TipoDeVisualizacion"
	PRIMARY KEY ("TipoDeVisualizacionID")
;

ALTER TABLE "TipoProducto" ADD CONSTRAINT "PK_TipoProducto"
	PRIMARY KEY ("TipoProductoID")
;

ALTER TABLE "Usuario" ADD CONSTRAINT "PK_Usuario"
	PRIMARY KEY ("UsuarioID")
;

/* Create Foreign Key Constraints */

ALTER TABLE "Árbol" ADD CONSTRAINT "FK_Árbol_Distribuccion"
	FOREIGN KEY ("DistribuccionID") REFERENCES "Distribuccion" ("DistribuccionID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Árbol" ADD CONSTRAINT "FK_Árbol_Familia"
	FOREIGN KEY ("FamiliaID") REFERENCES "Familia" ("FamiliaID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Árbol" ADD CONSTRAINT "FK_Árbol_Genero"
	FOREIGN KEY ("GeneroID") REFERENCES "Genero" ("GeneroID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Árbol" ADD CONSTRAINT "FK_Árbol_Floracion"
	FOREIGN KEY ("FloracionID") REFERENCES "Floracion" ("FloracionID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Árbol" ADD CONSTRAINT "FK_Árbol_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Banner" ADD CONSTRAINT "FK_Banner_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "CatalogoDeProductos" ADD CONSTRAINT "FK_CatalogoDeProductos_TipoProducto"
	FOREIGN KEY ("TipoProductoID") REFERENCES "TipoProducto" ("TipoProductoID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "CatalogoDeProductos" ADD CONSTRAINT "FK_CatalogoDeProductos_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "CatalogoDeServicios" ADD CONSTRAINT "FK_CatalogoDeServicios_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Distribuccion" ADD CONSTRAINT "FK_Distribuccion_Pais"
	FOREIGN KEY ("PaisID") REFERENCES "Pais" ("PaisID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Evento" ADD CONSTRAINT "FK_Evento_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Formulario" ADD CONSTRAINT "FK_Formulario_CatalogoDeServicios"
	FOREIGN KEY ("CatalogoDeServiciosID") REFERENCES "CatalogoDeServicios" ("CatalogoDeServiciosID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Home" ADD CONSTRAINT "FK_Home_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Info_footer" ADD CONSTRAINT "FK_Info_footer_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Mapa" ADD CONSTRAINT "FK_Mapa_Árbol"
	FOREIGN KEY ("ÁrbolID") REFERENCES "Árbol" ("ÁrbolID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Mapa" ADD CONSTRAINT "FK_Mapa_Sector"
	FOREIGN KEY ("SectorID") REFERENCES "Sector" ("SectorID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Pais" ADD CONSTRAINT "FK_Pais_Region"
	FOREIGN KEY ("RegionID") REFERENCES "Region" ("RegionID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Publicaciones" ADD CONSTRAINT "FK_Publicaciones_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Publicaciones" ADD CONSTRAINT "FK_Publicaciones_TipoDeVisualizacion"
	FOREIGN KEY ("TipoDeVisualizacionID") REFERENCES "TipoDeVisualizacion" ("TipoDeVisualizacionID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "PublicacionesMultimedia" ADD CONSTRAINT "FK_PublicacionesMultimedia_Multimedia"
	FOREIGN KEY ("MultimediaID") REFERENCES "Multimedia" ("MultimediaID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "PublicacionesMultimedia" ADD CONSTRAINT "FK_PublicacionesMultimedia_Publicaciones"
	FOREIGN KEY ("PublicacionesID") REFERENCES "Publicaciones" ("PublicacionesID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Rol_opciones" ADD CONSTRAINT "FK_Rol_opciones_Opciones"
	FOREIGN KEY ("OpcionesID") REFERENCES "Opciones" ("OpcionesID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Rol_opciones" ADD CONSTRAINT "FK_Rol_opciones_Rol"
	FOREIGN KEY ("RolID") REFERENCES "Rol" ("RolID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Rol_usuario" ADD CONSTRAINT "FK_Rol_usuario_Rol"
	FOREIGN KEY ("RolID") REFERENCES "Rol" ("RolID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Rol_usuario" ADD CONSTRAINT "FK_Rol_usuario_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Servicios" ADD CONSTRAINT "FK_Servicios_CatalogoDeServicios"
	FOREIGN KEY ("CatalogoDeServiciosID") REFERENCES "CatalogoDeServicios" ("CatalogoDeServiciosID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Servicios" ADD CONSTRAINT "FK_Servicios_Usuario"
	FOREIGN KEY ("UsuarioID") REFERENCES "Usuario" ("UsuarioID") ON DELETE No Action ON UPDATE No Action
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE "CatalogoDeProductos"
	IS 'Esta clase contiene informacion sobre el catalogo de productos'
;

COMMENT ON TABLE "Floracion"
	IS 'En esta clase se guardaran los datos de las temporada en los cuales los arboles florecen'
;

COMMENT ON TABLE "Opciones"
	IS 'Esta clase contiene atributos que guradarán información sobre las distintas opciones que pueden asignarsele a un tipo de rol asignado a un usuario'
;

COMMENT ON TABLE "Rol"
	IS 'Esta clase contiene atributos que guradarán información sobre los tipos de roles disponibles para los usuarios'
;

COMMENT ON TABLE "TipoProducto"
	IS 'Esta clase contiene información sobre los tipos de productos que se ofrecen en el Portal Web del Arboreto Carmelo Palma'
;

COMMENT ON TABLE "Usuario"
	IS 'Esta clase contiene atributos que guradarán información sobre el usuario que tendrá acceco administrativo al sistema.'
;

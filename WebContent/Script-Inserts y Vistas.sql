---================---
--- SCRIPT ARMANDO ---
---================---

-- Inserts Usuario --
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Saldivar', 1234, 'iris@gmail.com', 1, 'Iris', 'iriS', '2021-04-16');
	
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Cordero Montoya', 1234, 'armamo@gmail.com', 1, 'Armando Ernesto', 'Aecm', '2021-04-18');
	
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Berríos', 1234, 'mabx@gmail.com', 1, 'Marcos', 'mabx11', '2021-04-18');
	
SELECT * FROM usuario;

-- Inserts Rol --
INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Administrador', 'Encargado de gestionar todo el Portal Web', '2020-04-01', 1);

INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Sub-administrador', 'Encargado de gestionar todo el Portal Web excepto la Seguridad', '2020-04-18', 1);

INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Pasante', 'Tiene ciertos permisos de gestion del Portal', '2020-04-18', 1);

	
SELECT * FROM rol;

-- Inserts Opciones --
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblUsuarios.jsp', 'Interfaz que controla la gestion de Usuarios', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblRol.jsp', 'Interfaz que controla la gestion de Roles', 1);

INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblOpciones.jsp', 'Interfaz que lista las Opcioens del portal', 1);
	
SELECT * FROM opciones;

---===============---
--- SCRIPT MARCOS ---
---===============---

-- Inserts RolUsuario --
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (1, 1, '2021-04-16');
	
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (2, 3, '2021-04-18');
	
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (3, 2, '2021-04-18');

SELECT * FROM rol_usuario;

-- Inserts RolOpciones --
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 1, '2021-04-16');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 2, '2021-04-18');
	
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 3, '2021-04-18');

SELECT * FROM rol_opciones;

-- VW_RolUsuario --
CREATE OR REPLACE VIEW VW_RolUsuario AS 
SELECT rol_usuario.rol_usuarioid AS "ID", usuario.usuario AS "Usuario", 
usuario.nombres AS "Nombres", usuario.apellidos AS "Apellidos", rol.rol AS "Rol"
FROM rol_usuario, usuario, rol
WHERE rol_usuario.usuarioid = usuario.usuarioid AND rol_usuario.rolid = rol.rolid;

SELECT * FROM VW_RolUsuario;

-- VW_RolOpciones --
CREATE OR REPLACE VIEW VW_RolOpciones AS 
SELECT rol_opciones.rol_opcionesid AS "ID", rol.rol AS "Rol", 
opciones.opcion AS "Opcion"
FROM rol_opciones, opciones, rol
WHERE rol_opciones.opcionesid = opciones.opcionesid AND rol_opciones.rolid = rol.rolid;

SELECT * FROM VW_RolOpciones;

---===================---
--- SCRIPT JACQUELINE ---
---===================---


---=============---
--- SCRIPT YARÓ ---
---=============---

-- VW_PaisRegion --
CREATE OR REPLACE VIEW VW_PaisRegion AS 
SELECT pais.paisid AS "ID", pais.nombre AS "Pais", 
pais.estado AS "Estado".
region.nombre AS "Region"
FROM pais, region
WHERE pais.regionid = region.regionid;

SELECT * FROM VW_PaisRegion;

-- VW_Distribucion --
CREATE OR REPLACE VIEW VW_Distribucion AS 
SELECT distribucion.distribucionid AS "ID",distribucion.nombre AS "Distribucion", 
distribucion.descripcion AS "Descripcion",
distribucion.estado AS "Estado",
pais.nombre AS "Pais"
FROM distribucion, pais
WHERE distribucion.paisid = pais.paisid;

SELECT * FROM VW_Distribucion;


-- Inserts Region --
    INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Sur América', 1, '2021-04-17');
	
	INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Centroamerica', 1, '2021-04-17');
	
	INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Norte América', 1, '2021-04-17');
	
	-- Inserts Pais --
    INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Venezuela', 1, 1, '2021-04-17');
	
	  INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Perú', 1, 1, '2021-04-17');
	
	  INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Brasil', 1, 1, '2021-04-17');

-- Inserts Distribucion --
    INSERT INTO public.distribucion(
	nombre, estado, descripcion, paisid, fechacreacion)
	VALUES ('O Venezuela', 1, 'Desde el oeste de Venezuela hasta al norte de Perú' ,1, '2021-04-17');
	
	-- Inserts Familia --
    INSERT INTO public.familia(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Juglandaceae', 1, 'Las Juglandaceae son una familia de plantas conocida como la familia de las nueces. Los miembros de esta familia son nativos de América , Eurasia y el sudeste asiático .' , '2021-04-17');
	
		
-- Inserts Genero --
    INSERT INTO public.genero(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Juglans', 1, 'Los nogales son cualquier especie de árbol del género de plantas Juglans , el género tipo de la familia Juglandaceae , cuyas semillas se conocen como nueces.' , '2021-04-17');
	
		
	-- Inserts Floracion --
    INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Primavera', 'Marzo 20 - Junio 21 ', 1, 'En esta época del año, comienzan a salir las flores y crecen las hojas en los árboles.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Verano', 'Junio 21 - Septiembre 22', 1, 'El verano es la temporada con mayor calor, los días son más largos porque el Sol proporciona luz directa a la Tierra. ');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Otoño', 'Septiembre 22 - Dieciembre 21', 1, 'El otoño es la estación del año donde desciende la temperatura, las hojas de los árboles pierden su color verde y comienzan a caer.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Invierno', 'Diciembre 21 - Marzo 20', 1, 'Es una estación donde hace más frío, incluso cae nieve en algunas regiones. Los días son más cortos pues el Sol proporciona luz indirecta a la Tierra.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Verano HS', 'Diciembre 21 - Junio 21', 1, 'Epoca de Verano en el Hemisferio Sur.');
	
	INSERT INTO public.floracion(
	nombre, temporada, estado, descripcion)
	VALUES ('Invierno HS', 'Junio 21 - Diciembre 21', 1, 'Epoca de Invierno en el Hemisferio Sur.');
	
	
		
---==============---
--- SCRIPT LAURA ---
---==============---


---==============---
--- SCRIPT LUISA ---
---==============---


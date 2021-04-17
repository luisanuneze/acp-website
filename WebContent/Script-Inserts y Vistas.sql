---================---
--- SCRIPT ARMANDO ---
---================---

-- Inserts Usuario --
INSERT INTO public.usuario(
	apellidos, contrasenia, email, estado, nombres, usuario, fechacreacion)
	VALUES ('Saldivar', 1234, 'iris@gmail.com', 1, 'Iris', 'iriS', '2021-04-16');
	
SELECT * FROM usuario;

-- Inserts Rol --
INSERT INTO public.rol(
	rol, roldescripcion, fechacreacion, estado)
	VALUES ('Administrador', 'Encargado de gestionar todo el Portal Web', '2020-04-01', 1);

SELECT * FROM rol;

-- Inserts Opciones --
INSERT INTO public.opciones(
	opcion, descripcion, estado)
	VALUES ('tblUsuarios.jsp', 'Interfaz que controla la gestion de Usuarios', 1);

SELECT * FROM opciones;

---===============---
--- SCRIPT MARCOS ---
---===============---

-- Inserts RolUsuario --
INSERT INTO public.rol_usuario(
	usuarioid, rolid, fechacreacion)
	VALUES (1, 1, '2021-04-16');

SELECT * FROM rol_usuario;

-- Inserts RolOpciones --
INSERT INTO public.rol_opciones(
	rolid, opcionesid, fechacreacion)
	VALUES (1, 1, '2021-04-16');

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

SELECT * FROM VW_PaisRegions;

---==============---
--- SCRIPT LAURA ---
---==============---


---==============---
--- SCRIPT LUISA ---
---==============---


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

-- Inserts Inicio --
INSERT INTO public.home (mision, vision, historia, descrip_pag, usuarioid, fechamodificacion) 
VALUES ('Esta es nuestra mision', 'Esta es nuestra vision', 'Esta es nuestra historia', 
'Descripcion de la pagina' , 1, '2021-04-19');

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

-- VW_Arbol --
CREATE OR REPLACE VIEW VW_Arbol AS 
SELECT arbol.arbolid AS "ID",
arbol.nombrecientifico AS "NombreCientifico",
arbol.nombrecomun AS "NombreComun", 
arbol.descripcion AS "Descripcion",
arbol.estado AS "Estado",
familia.nombre AS "Familia",
genero.nombre AS "Genero",
floracion.nombre AS "EpocaFloracion",
distribucion.nombre AS "Distribucion"
FROM arbol, distribucion, familia, genero, floracion
WHERE arbol.familiaid = familia.familiaid 
AND arbol.generoid = genero.generoid
AND arbol.floracionid = floracion.floracionid
AND arbol.distribucionid = distribucion.distribucionid;

SELECT * FROM VW_Arbol;




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
	
	-- Inserts Arbol --
    INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, distribucionid, familiaid, generoid, floracionid, fechacreacion)
	VALUES ('Juglans neotropica', 'Cedro negro', 1, 'Miden 40 cm de largo por 25 cm de ancho, con 12 pares folíolos de borde aserrado y asimétricos. Requiere de suelos profundos, fértiles y bien drenados.Su madera es moderadamente pesada, se emplea para elaborar enchapes, carpintería, ebanistería fina , pisos y en construcción.', 1, 1, 1, 5, '2021-04-17');
	

---==============---
--- SCRIPT LAURA ---
---==============---

	
-- Inserts Region --
    INSERT INTO public.region(
	nombre, estado, fechacreacion)
	VALUES ('Asia Occidental ', 1, '2021-04-19');
	
-- Inserts Pais --
	INSERT INTO public.pais(
	nombre, estado, regionid, fechacreacion)
	VALUES ('Arabia Saudita', 1, 4, '2021-04-19');
	
-- Inserts Distribucion --
    INSERT INTO public.distribucion(
	nombre, estado, descripcion, paisid, fechacreacion)
	VALUES ('Oriente Medio', 1, 'Es la región aproximadamente equivalente al suroeste de Asia.' ,4, '2021-04-19');

-- Inserts Familia --
    INSERT INTO public.familia(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Rosaceae', 1, 'Las Rosaceaes son un gran número de plantas leñosas y herbáceas, muy estimada principalmente por sus árboles y arbustos frutales, así como por numerosas especies de valor ornamental. ', '2021-04-19');
	
-- Inserts Genero --
	INSERT INTO public.genero(
	nombre, estado, descripcion, fechacreacion)
	VALUES ('Prunus', 1, 'Prunus es un género de árboles y arbustos de la familia Rosaceae, que incluye varias especies cultivadas por sus frutos.' , '2021-04-19');

-- Inserts Arbol --
	INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, distribucionid, familiaid, generoid, floracionid, usuarioid, fechacreacion)
	VALUES ('Prunus dulcis', 'Almendro', 1, 'Puede alcanzar hasta 10 m. de altura, 
			pero generalmente se le mantiene más bajo mediante poda. La corteza de 
			sus ramitas jóvenes es verde, se vuelve violácea donde recibe la luz 
			solar directa; a partir del segundo año se vuelve gris, y se va oscureciendo 
			progresivamente.', 1, 2, 2, 4, 1, '2021-04-19');
			
	INSERT INTO public.arbol(
	nombrecientifico, nombrecomun, estado, descripcion, distribucionid, familiaid, generoid, floracionid, usuarioid, fechacreacion)
	VALUES ('Juglans regia', 'Nogal', 1, 'Es un árbol caducifolio que llega a los 25m 
			de altura con un tronco que puede superar los 2 m de diámetro. De este tronco, 
			que es corto y robusto y de color blanquecino o gris claro, salen gruesas y 
			vigorosas ramas para formar una copa grande y redondeada.', 2 , 1, 1, 1, 1, '2021-04-19');
	

---==============---
--- SCRIPT LUISA ---
---==============---

--- Inserts Servicios ---
INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado)
	VALUES ('Venta de semillas', 'imagen.png', 
			'Ofrecemos una gran variedad de semillas...', '2021-04-18 00:00:00',1);

INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado)
	VALUES ('Visitas Guiadas', 'imagen.png', 
			'Ofrecemos un servicio de recorrido dentro...', '2021-04-18 00:00:00',1);
	
INSERT INTO public.servicios(
	nombre, foto, descripcion, fechacreacion, estado)
	VALUES ('Charlas', 'imagen.png', 
			'Como parte de nuestros servicios, damos...', '2021-04-18 00:00:00',1);
	
SELECT * FROM servicios;

--- Inserts Tipo Producto ---

INSERT INTO public.tipoproducto(
	tipoproducto, descripcion, fechacreacion, estado)
	VALUES ('Semilla de flor', 'Semillas que germinan flores', 
			'2021-04-18 00:00:00', 1);

INSERT INTO public.tipoproducto(
	tipoproducto, descripcion, fechacreacion, estado)
	VALUES ('Semilla de arbol', 'Semillas que germinan arboles', 
			'2021-04-18 00:00:00', 1);

SELECT * FROM tipoproducto;

--- Inserts Catalogo de Productos ---

INSERT INTO public.catalogodeproductos(
	nombre, tipoproductoid, foto, descripcion,fechacreacion, estado)
	VALUES ('Semilla de Marango', 2, 'imagen.png', 'Semilla del Arbol de Marango, que...',
			'2021-04-18 00:00:00', 1);

INSERT INTO public.catalogodeproductos(
	nombre, tipoproductoid, foto, descripcion,fechacreacion, estado)
	VALUES ('Semilla de Girasol', 1, 'imagen.png', 'Semilla de flor de Girasol, que...',
			'2021-04-18 00:00:00', 1);

SELECT * FROM catalogodeproductos;

CREATE OR REPLACE VIEW VW_Productos AS
SELECT catalogodeproductos.catalogodeproductosid AS "ID", catalogodeproductos.nombre AS "Nombre",
tipoproducto.tipoproducto AS "TipoProducto", catalogodeproductos.foto AS "Foto", catalogodeproductos.descripcion AS "Descripcion",
catalogodeproductos.estado AS "Estado"
FROM catalogodeproductos, tipoproducto
WHERE catalogodeproductos.tipoproductoid = tipoproducto.tipoproductoid;

SELECT * FROM VW_Productos;


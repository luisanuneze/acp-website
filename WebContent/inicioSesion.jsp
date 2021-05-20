<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="entidades.*, datos.*, java.util.*;"%>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	String mensaje = request.getParameter("msj");
	mensaje=mensaje==null?"":mensaje;
	
	HttpSession hts = request.getSession(false);
	hts.removeAttribute("acceso");
	hts.invalidate();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>PWACP - Portal Web Arboreto Carmelo Palma</title>

<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

	<main id="main">

		<!-- Inicio de sesion -->
		<div id="section-login" class="section-login row">

			<!-- Seccion del banner -->
			<%@ include file="/menu/banner.jsp"%>
			<!-- Finaliza seccion del banner -->

			<!-- Formulario de inicio de sesion -->
			<div id="formulario" class="formulario col">
				<form class="user" method="post" action="./Sl_Login">
					<h2>Inicio de sesión</h2>
					<div class="form-group">
						<label for="usuario"> Usuario:</label> <input
							placeholder="Ingrese su nombre de usuario" type="text"
							class="form-control w-100" id="usuario" name="usuario">
					</div>
					<div class="form-group">
						<label for="contrasenia"> Contraseña:</label> <input
							placeholder="Ingrese su contraseña" type="password"
							class="form-control w-100" id="contrasenia" name="contrasenia">
					</div>
					<div class="form-group">
						<%
			                                	ArrayList<Rol> listRol = new ArrayList<Rol>();
			                                	Dt_Rol dtr = new Dt_Rol();
												listRol = dtr.listaRolActivos();
                                			%>
						<select class="form-control" name="cbxRol" id="cbxRol" required>
							<option value="">Seleccione...</option>
							<%
		                                    		for(Rol r: listRol){
		                                    	%>
							<option value="<%=r.getRolID()%>"><%=r.getRol()%></option>
							<%
		                                    		}
		                                    	%>
						</select>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" id="check"> Mantener
							sesión iniciada </label> </br>
						</br>
					</div>
					<div class="button-iniciar">
						<button>Iniciar sesión</button>
						</br> <a href="recuperacionCuenta.jsp">¿Olvidaste tu contraseña?</a>
					</div>

					<!-- <br><br><br><h4><strong>Seguimos trabajando, <br> para mejorar su servicio</strong></h4>
                <img style="width: 120px; align-items: center;" src="https://www.movilring.com/wp-content/uploads/2018/07/1.png"> -->
				</form>

			</div>
			<!-- Finaliza formulario de inicio de sesion -->
		</div>
		<!-- Finaliza inicio de sesion -->
	</main>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/purecounter/purecounter.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>
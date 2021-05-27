<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="entidades.Usuario, datos.Dt_Usuario, java.util.*;"%>
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
	
<!-- jAlert css  -->
<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

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

<!-- DATATABLE -->
<link href="DataTables/DataTables-1.10.21/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- DATATABLE buttons -->
<link href="DataTables/Buttons-1.6.3/css/buttons.dataTables.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- =======================================================
    * Template Name: FlexStart - v1.1.1
    * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/menu/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		<!-- Empty seccion for space-->
		<div id="empty" class="empty"></div>
		<!-- End Empty Section -->

		<!-- ======= Inicio Section ======= -->
		<section id="about" class="about">

			<div class="container" data-aos="fade-up">

				<h2 class="form-header" style="color: black;">Editar Usuario</h2>
				<br>

				<%
                 String us = "";
				 us = request.getParameter("UsuarioID")==null?"0":request.getParameter("UsuarioID");
														
				 Usuario user = new Usuario();
				 Dt_Usuario dtu = new Dt_Usuario();
				 user = dtu.getUsuario(Integer.parseInt(us));
            %>

				<form class="user row" method="post" action="./Sl_GestionUsuario">
					<!-- El valor de este input es para el Servlet opcion guardar -->
					<input name="usuarioid" type="hidden"
						value="<%=user.getUsuarioID()%>" /> <input name="opcion"
						type="hidden" value="2" />
					<div class="form-group col-sm-6">
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtUserName" id="txtUserName"
								placeholder="Nombre de Usuario" required>
						</div>
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtNombres" id="txtNombres" placeholder="Nombres" required>
						</div>
						<div class="col-sm-12">
							<input type="text" class="form-control form-control-user"
								name="txtApellidos" id="txtApellidos" placeholder="Apellidos"
								required>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="col-sm-12">
							<input type="email" class="form-control form-control-user"
								name="txtEmail" id="txtEmail" placeholder="Email" required>
						</div>
						<div class="col-sm-12">
							<input type="password" class="form-control form-control-user"
								name="txtPwd" id="txtPwd" placeholder="Contraseña" required>
						</div>
						<div class="col-sm-12">
							<input type="password" class="form-control form-control-user"
								name="txtPwd2" id="txtPwd2" placeholder="Repetir Contraseña" required>
						</div>
						<div class="col-sm-12">
							<input type="Tel" class="form-control form-control-user"
								name="txttel" id="txttel" placeholder="Ingrese 0 si no posee numero de contacto" required>
						</div>
					</div>


					<br>

					<!-- Botones -->
					<!-- Botones -->
					<div class="button-formulario">
						<input class="btn-user button button-formulario" type="submit"
							value="Actualizar" /> <a href="javascript:history.go(-1)"
							style="padding: 13px 35px"
							class="btn-user button button-formulario ">Regresar</a>
					</div>
				</form>

			</div>

		</section>
		<!-- End Inicio Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@ include file="/menu/footer.jsp"%>
	<!-- End Footer -->

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

	<!-- Bootstrap core JavaScript-->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- DATATABLE -->
	<script src="DataTables/DataTables-1.10.21/js/jquery.dataTables.js"></script>

	<!-- DATATABLE buttons -->
	<script src="DataTables/Buttons-1.6.3/js/dataTables.buttons.min.js"></script>

	<!-- js Datatable buttons print -->
	<script src="DataTables/Buttons-1.6.3/js/buttons.html5.min.js"></script>
	<script src="DataTables/Buttons-1.6.3/js/buttons.print.min.js"></script>

	<!-- js Datatable buttons pdf -->
	<script src="DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
	<script src="DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>

	<!-- js Datatable buttons excel -->
	<script src="DataTables/JSZip-2.5.0/jszip.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<!-- jAlert js -->
	<script src="jAlert/dist/jAlert.min.js"></script>
	<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>
	

	<script>  
   $(document).ready(function()
	{

		$("#txtUserName").val("<%=user.getUsuario()%>");
		$("#txtNombres").val("<%=user.getNombres()%>");
		$("#txtApellidos").val("<%=user.getApellidos()%>");
		$("#txtEmail").val("<%=user.getEmail()%>");
		$("#txtPwd").val("<%=user.getContrasenia()%>");
		$("#txtPwd2").val("<%=user.getContrasenia()%>");
		$("#txttel").val("<%=user.getTelefono()%>");
	});
   
	   
</script>

<script type="text/javascript">
$("#txtPwd2").change(
		function() {
			var clave = "";
			var clave2 = "";
			clave = $("#txtPwd").val();
			clave2 = $("#txtPwd2").val();
			if (clave != clave2) {
				errorAlert('Error',
						'Las contraseñas no coinciden');
				$("#txtPwd").val("");
				$("#txtPwd2").val("");
			}
		});
});
</script>



</body>
</html>
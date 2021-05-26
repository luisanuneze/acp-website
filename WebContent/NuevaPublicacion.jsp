<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
    //Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
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

<!-- jAlert css  -->
<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

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

				<h2 class="form-header" style="color: black;">Registrar Nueva
					Publicacion</h2>
				<br>

				<form class="user row" method="post" action="./Sl_GestionPublicaciones">
					<!-- El valor de este input es para el Servlet opcion guardar -->
					<input name="opcion" type="hidden" value="1" />
					<div class="form-group col-sm-6">
						<div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtTitulo" id="txtTitulo"
								placeholder="Título de publicación" required>
						</div>
						<div class="col-sm-12 mb-3 mb-sm-0">
							<textarea class="form-control form-control-user"
								name="txtDescrip" id="txtDescrip" placeholder="Descripción" required></textarea>
						</div>
						
					</div>

					<br>

					<!-- Botones -->
					<div class="button-formulario">
						<input class="btn-user button button-formulario" type="submit"
							value="Guardar" /> <a href="tblPublicaciones.jsp"
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

	<script type="text/javascript">
	
	    $(document).ready(function ()
	    {
			/////////// VARIABLE DE CONTROL MSJ ///////////
	        var mensaje = "";
	        mensaje = "<%=varMsj%>
		";

							if (mensaje == "existe") {
								errorAlert(
										'Error',
										'El título que esta intentando registrar ya existe en la base de datos!');
							}

						});
	</script>

</body>
</html>
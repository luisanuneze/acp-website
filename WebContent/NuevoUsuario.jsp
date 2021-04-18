<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: FlexStart - v1.1.1
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>

<!-- ======= Header ======= --> 
  <%@ include file="/menu/header.jsp" %>
  <!-- End Header -->
  
   <main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty">
    </div>    
    <!-- End Empty Section -->  

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
      
        		<h2 class="form-header" style="color: black;">Registrar Nuevo Usuario</h2>
        		<br>

        		<form class="user row" method="post" action="./Sl_GestionUsuario">
        		<!-- El valor de este input es para el Servlet opcion guardar -->
                	<input name="opcion" type="hidden" value="1" />
                    <div class="form-group col-sm-6">
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="text" class="form-control form-control-user" name="txtUserName" id="txtUserName"
                                placeholder="Nombre de Usuario" required>
                        </div>
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="text" class="form-control form-control-user" name="txtNombres" id="txtNombres"
                                placeholder="Nombres" required>
                        </div>
                        <div class="col-sm-12 mb-3 mb-sm-0">
                        	<input type="text" class="form-control form-control-user" name="txtApellidos" id="txtApellidos"
                            	placeholder="Apellidos" required>
                    	</div>
                    </div>
                    <div class="form-group col-sm-6">
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="email" class="form-control form-control-user" name="txtEmail" id="txtEmail"
                                placeholder="Email" required>
                        </div>
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="password" class="form-control form-control-user" name="txtPwd" id="txtPwd"
                                placeholder="Contraseña" required>
                        </div>
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="password" class="form-control form-control-user" name="txtPwd2"
                                id="txtPwd2" placeholder="Repetir Contraseña">
                        </div>
                    </div>
                    <!-- <a href="login.html" class="btn btn-primary btn-user btn-block">
                        Register Account
                    </a> 
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                        <i class="fab fa-google fa-fw"></i> Register with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                        <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                    </a>-->
                    
                </form>

        <br>

        <!-- Botones -->
        <div class="col-md-6">
          <button style="background-color:#0e203f; color:white"> Guardar </button>
          <a href="tblUsuarios.jsp"><button style="background-color:#0e203f; color:white"> Regresar </button></a>
        </div>

      </div>

    </section>
    <!-- End Inicio Section -->

  </main><!-- End #main -->
  
  <!-- ======= Footer ======= -->
  <%@ include file="/menu/footer.jsp" %>
  <!-- End Footer -->
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
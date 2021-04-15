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
      
        <!-- Despliegue de filtros -->
        <div class="">
            Filtrar �rboles por:
            <select class="form-select" name="selecciona...">
                <option value="value1">Valor 1</option>
                <option value="value2">Valor 2</option>
                <option value="value3">Valor 3</option>
            </select>
        </div> 
        <!-- Termina despliegue de filtros-->

        <div class="card-view">
            <a href="edicionarboles.html"><div class="arboles d-flex flex-column">
                <img src="https://image.flaticon.com/icons/png/512/2975/2975970.png" ><hr>
                <p>Nombre com�n</p>
            </div></a>
            <a href="edicionarboles.html"><div class="arboles d-flex flex-column">
                <img src="https://image.flaticon.com/icons/png/512/2975/2975970.png" ><hr>
                <p>Nombre com�n</p>
            </div></a>
            <a href="edicionarboles.html"><div class="arboles d-flex flex-column">
                <img src="https://image.flaticon.com/icons/png/512/2975/2975970.png" ><hr>
                <p>Nombre com�n</p>
            </div></a>
            <a href="edicionarboles.html"><div class="arboles new-arbol d-flex flex-column">
                <center><img src="https://www.flaticon.es/premium-icon/icons/svg/2623/2623098.svg" ><hr></center>
                <p>Agregar nuevo �rbol</p>
            </div></a>
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
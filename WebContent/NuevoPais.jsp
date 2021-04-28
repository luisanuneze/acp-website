<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Pais, datos.Dt_Pais, entidades.Region, datos.Dt_Region, java.util.*;" %>
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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

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

            <h2 class="form-header" style="color: black;">Registrar Nuevo País</h2>
            <br>
            <form action="forms/contact.php" method="post" class="php-email-form">
                <div class="row gy-4">

                    <%
                        ArrayList<Region> listRegion = new ArrayList<Region>();
                        Dt_Region dtr = new Dt_Region();
                        listRegion = dtr.listaRegionActivas();

                    %>

                    <div class="col-md-12">
                        <input type="text" class="form-control" placeholder="Nombre" required>
                        <br>
                    </div>
                    <div class="row col-md-12">
                        <div class="col-sm-11">
                            <select class="form-select" name="" required>
                                <option value="">Region...</option>
                                <%
                                    for (Region re : listRegion) {
                                %>
                                <option value="<%= re.getRegionID() %>"><%= re.getNombre() %>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="col-sm-1">
                            <a title="Agregar nueva región" href="NuevaRegion.jsp">
                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                        </div>
                    </div>
                    <br>

                    <div class="col-md-12">
                        <textarea class="form-control" name="message" rows="6" placeholder="Descripción"
                                  required></textarea>
                    </div>
                </div>
                <br>

                <!-- Botones -->
                <div class="button-formulario">
                    <button> Guardar</button>
                    <a href="javascript:history.go(-1)" class="button">Regresar </a>
                </div>
            </form>

        </div>


    </section>
    <!-- End Inicio Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp" %>
<!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
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
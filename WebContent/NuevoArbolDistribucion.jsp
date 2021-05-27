<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Arbol, datos.Dt_Arbol, vistas.VW_Arbol, entidades.Distribucion, datos.Dt_Distribucion, vistas.VW_Distribucion, java.util.*;" %>
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

            <h2 class="form-header" style="color: black;">Registrar Nueva Distribución</h2>
            <br></br>
            <form action="./Sl_GestionDistribucionArbol" method="post" class="ArbolDistribucion">
            
            <!-- El valor de este input es para el Servlet opcion guardar -->
            <input name="opcion" type="hidden" value="1"/>
            
                <div class="row gy-4">

                    <%
                        ArrayList<VW_Arbol> listArbol = new ArrayList<VW_Arbol>();
                        Dt_Arbol dta = new Dt_Arbol();
                        listArbol = dta.listaArbol();

                        ArrayList<VW_Distribucion> listDistribucion = new ArrayList<VW_Distribucion>();
                        Dt_Distribucion dtd = new Dt_Distribucion();
                        listDistribucion = dtd.listaDistribucion();

                    %>
				<div class="row col-md-6">
                    <div class="row col-md-12">
                        <div class="col-sm-11">
                            <select class="form-select" name="cbxArbol" id="cbxArbol" required>
                                <option value="">Árbol...</option>
                                <%
                                    for (VW_Arbol ar : listArbol) {
                                %>
                                <option value="<%= ar.getID() %>"><%= ar.getNombreComun() %>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="col-sm-1">
                            <a title="Agregar nuevo árbol" href="NuevoArbol.jsp">
                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                        </div>
                    </div>
                    <br></br>
                    <div class="row col-md-12">
                        <div class="col-sm-11">
                            <select class="form-select" name="cbxDistribucion" id="cbxDistribucion" required>
                                <option value="">Distribución...</option>
                                <%
                                    for (VW_Distribucion di : listDistribucion) {
                                %>
                                <option value="<%= di.getID() %>"><%= di.getDistribucion() %>
                                </option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                        <div class="col-sm-1">
                            <a title="Agregar nueva distribución" href="NuevaDistribucion.jsp">
                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                        </div>
                    </div>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.VW_Distribucion, java.util.*;" %>
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

            <div class="row ">
                <!-- Cardview -->
                <div class="col-sm-2 arboles card-view">
                    <div class="">
                        <img src="https://image.flaticon.com/icons/png/512/2975/2975970.png">
                        <hr>
                        <p>Nombre común</p>
                    </div>
                </div>
                <!-- Fin cardview -->


                <%
                    ArrayList<Genero> listGenero = new ArrayList<Genero>();
                    Dt_Genero dtg = new Dt_Genero();
                    listGenero = dtg.listaGenerosActivos();

                    ArrayList<Familia> listFamilia = new ArrayList<Familia>();
                    Dt_Familia dtf = new Dt_Familia();
                    listFamilia = dtf.listaFamiliasActivas();

                    ArrayList<Floracion> listFloracion = new ArrayList<Floracion>();
                    Dt_Floracion dtfl = new Dt_Floracion();
                    listFloracion = dtfl.listaFloracionsActivos();

                    ArrayList<VW_Distribucion> listDistribucion = new ArrayList<VW_Distribucion>();
                    Dt_Distribucion dtd = new Dt_Distribucion();
                    listDistribucion = dtd.listaDistribucion();

                %>


                <!-- Formulario arboles -->
                <div class="contenido-arboles formulario col-sm-10">
                    <h2 class="form-header" style="color: black;">Agregar Nuevo Árbol</h2>

                    <form action="arboles.jsp" class="row">
                        <div class="row">

                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                    Nombre común:
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="" id=""
                                               placeholder="Nombre común" required>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    Nombre científico:
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="" id=""
                                               placeholder="Nombre científico" required>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    Género:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="selecciona..." required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Genero ar : listGenero) {
                                                %>
                                                <option value="<%= ar.getGeneroID() %>"><%= ar.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nuevo género" href="NuevoGenero.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>

                            <div class="form-group col-sm-6">
                                <div class="col-sm-12">
                                    Familia:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="selecciona..." required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Familia fr : listFamilia) {
                                                %>
                                                <option value="<%= fr.getFamiliaID() %>"><%= fr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nueva familia" href="NuevaFamilia.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                                <div class="col-sm-12">
                                    Floración:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="selecciona..." required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Floracion flr : listFloracion) {
                                                %>
                                                <option value="<%= flr.getFloracionID() %>"><%= flr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nueva floración" href="NuevaFloracion.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                                <div class="col-sm-12">
                                    Distribución:
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <select class="form-select" name="selecciona..." required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (VW_Distribucion fdr : listDistribucion) {
                                                %>
                                                <option value="<%= fdr.getID() %>"><%= fdr.getDistribucion() %>
                                                </option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-sm-2">
                                            <a title="Agregar nueva distribución" href="NuevaDistribucion.jsp">
                                                <i class="add fa-2x fas fa-plus-circle"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-sm-11">
                                Descripción:
                                <div class="col-sm-12">
                                    <textarea class="form-control" name="message" rows="6" placeholder="Descripción"
                                              required></textarea>
                                </div>
                                <br>
                            </div>

                            <!-- Botones -->
                            <div class="col-md-10 button-iniciar">
                                <button> Guardar</button>
                                <a href="javascript:history.go(-1)" class="button"> Regresar</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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
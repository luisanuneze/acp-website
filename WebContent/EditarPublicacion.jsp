<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import = "entidades.*, datos.*, java.util.*;" %>
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

            <h2 class="form-header" style="color: black;">Editar Publicaci�n</h2>
            <br>
             <%
                            	String pu = "";
								pu = request.getParameter("PublicacionesID")==null?"0":request.getParameter("PublicacionesID");
														
								Publicaciones pub = new Publicaciones();
								Dt_Publicaciones dtpu = new Dt_Publicaciones();
								pub = dtpu.getPubli(Integer.parseInt(pu));
							
                            %>
            
            
            <form action="./Sl_GestionPublicaciones" method="post" class="user">
            <input name="PublicacionesID" type="hidden" value="<%=pub.getPublicacionesid()%>" />
             <input name="opcion" type="hidden" value="2" />
                <div class="row gy-4">
                    <div class="col-sm-12 mb-3 mb-sm-0">
							<input type="text" class="form-control form-control-user"
								name="txtTitulo" id="txtTitulo"
								placeholder="T�tulo de publicaci�n" required>
					</div>
					<div class="col-sm-12 mb-3 mb-sm-0">
							<textarea class="form-control form-control-user"
								name="txtDescrip" id="txtDescrip" placeholder="Descripci�n" required></textarea>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script>  
   $(document).ready(function()
	{
	   $("#txtTitulo").val("<%=pub.getTitulo()%>");
	   $("#txtDescrip").val("<%=pub.getDescripcion()%>");
	 
		
		
	});
</script>

</body>
</html>
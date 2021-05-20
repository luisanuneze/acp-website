<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.VW_Arbol, java.util.*;" %>
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

            <h2 class="form-header" style="color: black;">Registrar Foto de Árbol</h2>
            <br>
            <%
					int idarbol = 0;
					Arbol ar = new Arbol();
					Dt_Arbol dtu = new Dt_Arbol();
					idarbol = Integer.parseInt(request.getParameter("idArbol"));
					ar = dtu.getArbol(idarbol);
				%>
				
            <form  method="post" class="user" name="frm-foto" enctype="multipart/form-data" action="./Sl_FotoArbol">
                <div class="row gy-4">
                    <div class="col-md-12">
                    <div class="cuadro-fotoNima" align="center">
						<img id="preview" src="<%=ar.getImagen()==null?"#":ar.getImagen()%>" name="preview"  alt="Foto Arbol"
									style="width: 400px; height: 400px; border-bottom-color: white; margin: 2px;" />
                    </div>

                    <div class="col-md-12">
                       <input type="file" id="foto" name="foto" onchange="Test.UpdatePreview(this)" required="required">&nbsp; 
								
								<input type="hidden" name="idarbol" value="<%=idarbol%>">
                    </div>
                </div>
                <br>

                <!-- Botones -->
                <div class="button-formulario">
                    <input  class="button" type="submit" value="Guardar" />
                    <a href="tblUsuarios.jsp">
                    <button style="background-color:#0e203f; color:white"> Regresar</button>
                </a>
                    <input class="button" type="reset" value="Cancelar" />
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

<script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages
    <script src="js/sb-admin-2.min.js"></script>-->
    
    
    <script>
	    $(document).ready(function() 
		{
	 
Test = {
	    	        UpdatePreview: function(obj)
	    	        {
	    	          // if IE < 10 doesn't support FileReader
	    	          if(!window.FileReader)
	    	          {
	    	             
	    	          } 
	    	          else 
	    	          {
	    	             var reader = new FileReader();
	    	             var target = null;
	    	             
	    	             reader.onload = function(e) 
	    	             {
	    	              target =  e.target || e.srcElement;
	    	
 $("#preview").prop("src", target.result);
	    	             };
	    	              reader.readAsDataURL(obj.files[0]);
	    	          }
	    	        }
	    	    };
		});
	</script>



</body>
</html>
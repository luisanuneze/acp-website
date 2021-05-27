<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>
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
<%@ include file="/menu/v_header.jsp" %>
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
                  <%
                            	String us = "";
								us = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
														
								Arbol arb = new Arbol();
								Dt_Arbol dta = new Dt_Arbol();
								arb = dta.getArbol(Integer.parseInt(us));
							
                            %>
                            
                            <%
                            	String rous = "";
								rous = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
														
								VW_Arbol vwru = new VW_Arbol();
								Dt_Arbol dtrous = new Dt_Arbol();
								vwru = dtrous.getArbol2(Integer.parseInt(rous));
                            %>
                            
                <div  class="col-sm-2 arboles card-view ">
                    <div class="">
                        <img name="imgArbol" id="imgArbol" src="<%=arb.getImagen()==null?"#":arb.getImagen()%>">
                           <hr></hr>
                        <p name="txtNombreCo" id="txtNombreCo"><%=arb.getNombrecomun()%></p>
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
                %>


                <!-- Tabla arboles -->
                <div class="contenido-arboles formulario col-sm-6">

                    
                    <table class="table table-bordered center">
                    
	                    <tr>
	                    	<th colspan="2" style="background-color:#081C44; text-align:center; color:white"> Características del <%=arb.getNombrecomun()%> </th>
	                    </tr>
	                    <tr>
	                    	<th> Nombre Común</th>
	                    	<td> <p name="txtNombreCo" id="txtNombreCo"><%=arb.getNombrecomun()%></p> </td>
	                    </tr>
	                    <tr>
	                    	<th> Nombre Científico</th>
	                    	<td> <p name="txtNombreCi" id="txtNombreCi"><%=arb.getNombrecientifico()%></p> </td>
	                    </tr>
	                    <tr>
	                    	<th> Género</th>
	                    	 
	                    	<td> <p name="cbxGenero" id="cbxGenero"><%= vwru.getGenero()%></p> </td>
	                    	
	                    </tr>
	                    <tr>
	                    	<th> Familia</th>
	                    	
	                    	<td> <p name="cbxFamilia" id="cbxFamilia"><%= vwru.getFamilia()%></p> </td>
	                    	
	                    	
	                    </tr>
	                    <tr>
	                    	<th> Floracion</th>
	                    	
	                    	<td> <p name="cbxFlora" id="cbxFlora"><%= vwru.getEpocaFloracion()%></p> </td>
	                    		
	                    </tr>
	                    <tr>
	                    	<th> Descripción</th>
	                    	<td> <p name="txaDescrip" id="txaDescrip"><%=arb.getDescripcion()%></p> </td>
	                    </tr>
                    
                    </table>
                    
                    <br><br>
                    
                    <!-- Botones -->
                    <div class="col-md-10 button-anadirpub">
                        <a href="javascript:history.go(-1)" class="button"> Regresar</a>
                    </div>
                    
                    
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

<script>  
   $(document).ready(function()
	{
	   $("#imgArbol").val("<%=arb.getImagen()%>");
	   $("#txtNombreo").val("<%=arb.getNombrecomun()%>");
	   $("#txtNombreC").val("<%=arb.getNombrecomun()%>");
	   $("#txtNombreCi").val("<%=arb.getNombrecientifico()%>");
	   $("#cbxGenero").val("<%=arb.getGeneroID()%>");
	   $("#cbxFamilia").val("<%=arb.getFamiliaID()%>");
	   $("#cbxFlora").val("<%=arb.getFloracionID()%>");
	   $("#txaDescrip").val("<%=arb.getDescripcion()%>");
	   
	 
		
		
	});
</script>
</body>

</html>
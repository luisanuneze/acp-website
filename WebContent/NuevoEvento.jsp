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
  <link rel="stylesheet" href="assets/css/calendar.css">

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
      
        		<h2 class="form-header" style="color: black;">Registrar Nuevo Evento</h2>
        		<br>

        		<form class=" row" method="post" >
                                <div class="col-sm-4">
                                	<div class="col-sm-12 mb-3 mb-sm-0">
                                	
                            			<input type="text" class="form-control form-control-user" name="txtEvento" id="txtEvento"
                                		placeholder="Nombre de Evento" required>
                                	
                                	</div><br><br>
                        			<div class="col-sm-12 mb-3 mb-sm-0">
                        			
                            			<input type="text" class="form-control form-control-user" name="txtDescripcion" id="txtDescripcion"
                                		placeholder="Descripcion" required>
                        			
                        			</div><br><br>
                                	<div class="col-sm-12 mb-3 mb-sm-0">
                                	
                        				<input type="text" class="form-control form-control-user" name="txtUbicacion" id="txtUbicacion"
                            			placeholder="Ubicacion" required>
                                	
                                	</div><br>
                                	
                                	
                                	<!-- Botones -->
							        <div class="col-md-6">
							          <button style="background-color:#0e203f; color:white" type="submit" value="Guardar"> Guardar </button>
							        </div>
                            			
                    			</div>
                    			<div class="col-sm-4">
                    			
                            			<input type="url" class="form-control form-control-user" name="txtHipervinculo" id="txtHipervinculo"
                                		placeholder="Hipervinculo" required>
                                		
                                		<br>
                                		
                        				<h8>Fecha de Inicio de Evento</h8>
                            			<input type="date" class="form-control form-control-user" name="txtFechainicio" id="txtFechainicio"
                                		placeholder="Fecha inicio" required>
                                		
                                		<br>
                                		
                        				<h8>Fecha de Fin de Evento</h8>
                        	   			<input type="date" class="form-control form-control-user" name="txtFechafin"
                              			 id="txtFechafin" placeholder="Fecha fin">
                              			 
                              			 <br>
                              			 
                              			 <div class="col-md-6">
							          		<a class="button" href="tblEventos.jsp"> Regresar </a>
							        	 </div>
                              			                              	                          			 
                        				
                        		</div>
                        				
                        		
                               <div class="col-sm-4" >
                               		<div class="centrado">
                               	
                               	
	                        				<select>
	                        					<option value = "">Seleccione el tipo de evento</option>
	                        					<option value = "Publica">Publico</option>
	                        					<option value = "Privada">Privado</option>
	                        				</select><br>
	                        				
	                       				<div class="root">
	        								<div class="calendar" id="calendar">
	
	        								</div>
	
	    								</div>
                               	
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
  
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/es.js"></script>
  <script type="text/javascript" src="assets/js/calendar.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  <script type="text/javascript">
        let calendar = new Calendar('calendar');
        calendar.getElement().addEventListener('change', e => {
            console.log(calendar.value().format('LLL'));
        });
   </script>

</body>
</html>
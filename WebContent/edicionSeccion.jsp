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
       <section id="about item-editar" class="about item-editar">
   
           <div class="container" data-aos="fade-up">  
       
               <div class="edicion-section ">
       
                   <a href="EditarVision.jsp"><div class="content">    
                       <div id="Content-edicion" class="Content-edicion">
                       <h2>Editar sección de visión</h2>
                       </div>
                   </div></a>
       
                   <a href="EditarMision.jsp"><div class="content">    
                       <div id="Content-edicion" class="Content-edicion">
                           <h2>Editar sección de misión</h2>
                       </div>    
                   </div></a>

                   <a href="EditarHistoria.jsp"><div class="content">    
                       <div id="Content-edicion" class="Content-edicion">
                           <h2>Editar sección de historia</h2>
                       </div>    
                   </div></a>

                   <div class="content">
                       <div id="Content-edicion" class="Content-edicion">
                           <h2>Editar información del footer</h2>
                       </div>    
                   </div>
       
               </div>
   
               <!-- <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                   <img src="assets/img/about.jpg" class="img-fluid" alt="">
               </div> -->

           <!-- Boton cancelar-->
           <div id="button-cancelar" class="button-cancelar">
               <a href="index.jsp"><button> Regresar</button></a>
             </div>
           <!-- Termina boton cancelar-->
   
           </div>

       </section>
       <!-- End Inicio Section -->
       
   </main>     
   
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
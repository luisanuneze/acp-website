<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.Familia, datos.Dt_Familia, java.util.*;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <title>PWACP - Portal Web Arboreto Carmelo Palma</title>
  
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/logo.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <!-- Custom fonts for this template -->
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

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
  
  <!-- DATATABLE -->
<link href="DataTables/DataTables-1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- DATATABLE buttons -->
<link href="DataTables/Buttons-1.6.3/css/buttons.dataTables.min.css" rel="stylesheet">
  
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

      <div class="container-fluid container" data-aos="fade-up">

       <div>
       
          <!-- DataTables Familia -->
          <div class="card shadow mb-4">
              <div class="card-header py-3 row">
              	<div class="col">
          			<h1 class="h3 mb-2 text-gray-800">Gestión de Familia</h1>
	          	</div>
	          	<div class="col" align="right">
	          	
					<!-- Button agregar e imprimir-->
					<a href="NuevaFamilia.jsp" data-toggle="modal"
						data-target="#modalNuevoUsuario"> <i
						class="fas fa-file-medical fa-2x" title="Agregar nueva familia"></i>
					</a>&nbsp;&nbsp;
					<a href="#"> <i class="fas fa-print fa-2x"
						title="Imprimir registro"></i>
					</a> 
					<!-- Fin Button agregar e imprimir -->
					
				</div>
              </div>
              
              <div class="card-body">
              	
                  <div class="table-responsive">
                      <table class="table table-bordered" id="tblFamilia" width="100%" cellspacing="0">
                      <%
                      	ArrayList<Familia> listFamilia = new ArrayList<Familia>();
                      	Dt_Familia dtf = new Dt_Familia();
                      	listFamilia = dtf.listaFamiliasActivas();
                      	
                      %>
                          <thead>
                              <tr>
                                  <th>ID</th>
                                  <th>Nombre</th>
                                  <th>Descripción</th>
                                  <th>Fecha creación</th>
                                  <th>Opciones</th>
                              </tr>
                          </thead>
                          <tfoot>
                              <tr>
                                  <th>ID</th>
                                  <th>Nombre</th>
                                  <th>Descripción</th>
                                  <th>Fecha creación</th>
                                  <th>Opciones</th>
                              </tr>
                          </tfoot>
                          <tbody>
                         		<%
                             		for(Familia fa: listFamilia){
                             	%>
                             <tr>
                                 <td><%=fa.getFamiliaID() %></td>
                                 <td><%=fa.getNombre() %></td>
                                 <td><%=fa.getDescripcion() %></td>
                                 <td><%=fa.getFechaCreacion() %></td>
                                 <td><a id="btn-edita-abrir" href="EditarFamilia.jsp"> <i class="fas fa-edit" >Editar</i></a> 
                                 	<a href="#"> <i class="fas fa-trash-alt">Eliminar</i></a> 
                                 	<a href="#"> <i class="fas fa-eye">Visualizar</i>
										</a></td>
                             </tr>
                             		<%
                             		}
                                 %>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
          
          <!-- Fin DataTables Familia -->
          
       
       </div>

      </div>


    </section>
    <!-- End Inicio Section -->

  </main>
  <!-- End #main -->

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
  
  <!-- Bootstrap core JavaScript-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- DATATABLE -->
	<script src="DataTables/DataTables-1.10.21/js/jquery.dataTables.js"></script>

	<!-- DATATABLE buttons -->
	<script src="DataTables/Buttons-1.6.3/js/dataTables.buttons.min.js"></script>

	<!-- js Datatable buttons print -->
	<script src="DataTables/Buttons-1.6.3/js/buttons.html5.min.js"></script>
	<script src="DataTables/Buttons-1.6.3/js/buttons.print.min.js"></script>

	<!-- js Datatable buttons pdf -->
	<script src="DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
	<script src="DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>

	<!-- js Datatable buttons excel -->
	<script src="DataTables/JSZip-2.5.0/jszip.min.js"></script>

<!-- 	<script>
		$(document).ready(function() {
			
			////// APLICAMOS FORMATO Y BOTONES A LA TABLA //// INICIAMOS EL PLUGIN DATATABLE
			$('#tblFamilia').DataTable({
				dom : 'Bfrtip',
				buttons : [
				             'pdf',
				'excel', 'print' ]

			});
			////////////////////////////////////////////////

		});
	</script> -->
</body>
</html>
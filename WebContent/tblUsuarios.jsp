<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="entidades.Usuario, datos.Dt_Usuario, java.util.*;" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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

  <!-- =======================================================
  * Template Name: FlexStart - v1.1.1
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->



<!-- Custom styles for this page -->
<!-- <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

<!-- DATATABLE -->
<link href="DataTables/DataTables-1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- DATATABLE buttons -->
<link href="DataTables/Buttons-1.6.3/css/buttons.dataTables.min.css" rel="stylesheet">

</head>

<body id="page-top">

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

      <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Gesti�n de Usuarios</h1>
                    <p class="mb-4">Desde esta pantalla del sistema usted podr� controlar la creaci�n, actualizaci�n y el dar de baja a los usuarios.</p>
					
					
                    <!-- DataTables Usuarios -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Usuarios Registrados</h6>
                        </div>
                        <div class="card-body">
                        	<div align="right">
                        		<h7> | </h7>
                        		<a href="NuevoUsuario.jsp">
                        			<h7 class="fas fa-user-plus fa-2x" title="Registrar Nuevo Usuario">Nuevo</h7>
                        		</a>
                        		<h7>    ||   </h7>
                        		
                        		<a href="tblRolUser.jsp">
                        			<h7 class="fas fa-user-plus fa-2x" title="Agregar rol a Usuario">Rol a Usuario</h7>
                        		</a>
                        		<h7> |</h7>
                        		&nbsp;&nbsp;
                        		<!-- Button trigger modal -->
                        		<a href="#" data-toggle="modal" data-target="#modalNewUser">
                        			<i class="fas fa-plus-square fa-2x" title="Registrar Nuevo Usuario"></i>
                        		</a>
                        		<!-- FIN Button trigger modal -->
                        		&nbsp;&nbsp;
                        		<a href="#">
                        			<i class="fas fa-print fa-2x" title="Imprimir Lista de Usuarios Activos"></i>
                        		</a>
                        		
                        	</div>
                        	
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tblUsers" width="100%" cellspacing="0">
                                <%
                                	ArrayList<Usuario> listUser = new ArrayList<Usuario>();
                                	Dt_Usuario dtu = new Dt_Usuario();
                                	listUser = dtu.listaUserActivos();
                                	
                                %>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Usuario</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Estado</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Usuario</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Estado</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                   		<%
                                       		for(Usuario us: listUser){
                                       	%>
                                       <tr>
                                           <td><%=us.getUsuarioID() %></td>
                                           <td><%=us.getUsuario() %></td>
                                           <td><%=us.getNombres() %></td>
                                           <td><%=us.getApellidos() %></td>
                                           <td><%=us.getEstado()==1||us.getEstado()==2?"ACTIVO":"INACTIVO" %></td>
                                           <td>
                                           		<a id="btn-edita-abrir" href="EditarUsuario.jsp?usuarioID=<%=us.getUsuarioID()%>">
                        							<i class="fas fa-edit" title="Modificar datos del Usuario">Editar</i>
                        						</a>
                                           		<a href="#">
                        							<i class="fas fa-trash-alt" title="Eliminar Usuario">Eliminar</i>
                        						</a>
                                           		<a href="#">
                        							<i class="fas fa-eye" title="Visualizar Usuario"></i>
                        						</a>
                                           
                                           </td>
                                       </tr>
                                       		<%
                                       		}
                                           %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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

<script>
    $(document).ready(function ()
    {
        ////// APLICAMOS FORMATO Y BOTONES A LA TABLA //// INICIAMOS EL PLUGIN DATATABLE
        $('#tblUsers').DataTable({
            dom: 'Bfrtip',
            buttons: [
//             'pdf',
            'excel',
            'print'
            ]

        });

        ////////////////////////////////////////////////

    });
</script>


</body>
</html>
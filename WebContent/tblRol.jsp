<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Rol, datos.Dt_Rol, java.util.*;" %>
<!DOCTYPE html>
<%
	//Variable de control de mensajes
	String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");


%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>PWACP - Portal Web Arboreto Carmelo Palma</title>

    <meta content="" name="description">

    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/logo.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Custom fonts for this template -->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css"
          rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <!-- jAlert css  -->
	<link rel="stylesheet" href="jAlert/dist/jAlert.css" />

    <!-- =======================================================
      * Template Name: FlexStart - v1.1.1
      * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->


    <!-- Custom styles for this page -->
    <!-- <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

    <!-- DATATABLE -->
    <link href="DataTables/DataTables-1.10.21/css/jquery.dataTables.min.css"
          rel="stylesheet">
    <!-- DATATABLE buttons -->
    <link href="DataTables/Buttons-1.6.3/css/buttons.dataTables.min.css"
          rel="stylesheet">

</head>

<body id="page-top">

<!-- ======= Header ======= -->
<%@ include file="/menu/header.jsp" %>
<!-- End Header -->

<main id="main">
    <!-- Empty seccion for space-->
    <div id="empty" class="empty"></div>
    <!-- End Empty Section -->

    <!-- ======= Inicio Section ======= -->
    <section id="about" class="about">

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Gesti�n de Roles</h1>
            <p class="mb-4">Desde esta pantalla del sistema usted podr�
                controlar la creaci�n, actualizaci�n y el dar de baja a los roles.</p>


            <!-- DataTables Usuarios -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Roles
                        Registrados</h6>
                </div>
                <div class="card-body">
                    <div align="right">

                        &nbsp;&nbsp;
                        <!-- Button trigger modal -->
                        <a href="NuevoRol.jsp" data-toggle="modal" data-target="#modalNuevoRol">
                            <i class="fas fa-plus-square fa-2x" title="Registrar Nuevo Rol"></i>
                        </a>
                        <!-- FIN Button trigger modal -->
                        &nbsp;&nbsp; <a href="#"> <i class="fas fa-print fa-2x"
                                                     title="Imprimir Lista de Roles Activos"></i>
                    </a>

                        <a href="tblRolOpc.jsp">
                            <button style="background-color:#0e203f; color:white"> Opcion a Rol</button>
                        </a>

                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="tblRol" width="100%"
                               cellspacing="0">
                            <%
                                ArrayList<Rol> listRol = new ArrayList<Rol>();
                                Dt_Rol dtr = new Dt_Rol();
                                listRol = dtr.listaRolActivos();

                            %>
                            <thead>
                            <tr>
                                <th>Rol</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Rol</th>
                                <th>Descripcion</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                for (Rol r : listRol) {
                            %>
                            <tr>
                                <td><%=r.getRol() %>
                                </td>
                                <td><%=r.getRoldescripcion() %>
                                </td>
                                <td><%=r.getEstado() == 1 || r.getEstado() == 2 ? "ACTIVO" : "INACTIVO" %>
                                </td>
                                <td>
                                <a id="btn-edita-abrir" href="EditarRol.jsp?RolID=<%=r.getRolID()%>"> <i
                                        class="fas fa-edit" title="Modificar datos del Rol"></i>
                                </a>
                                <a class="ajax-link" href="javascript:void(0);" 
                                           		onclick="$.jAlert({
                                           		    'type': 'confirm',
                                           		    'confirmQuestion': 'Realmente desea eliminar este registro?',
                                           		    'onConfirm': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here

                                           		      window.location.href = 'Sl_GestionRol?RolID=<%=r.getRolID()%>';
                                           		      btn.parents('.jAlert').closeAlert();
                                           		      return false;
                                           		    },
                                           		    'onDeny': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here
                                           		      btn.parents('.jAlert').closeAlert();
                                           		      return false;
                                           		    }
                                           		  });">
                        							<i class="fas fa-trash-alt" title="Eliminar Rol"></i>
                        						</a> 
                                <a href="#"> <i class="fas fa-eye" title="Visualizar Rol"></i>
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

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<%@ include file="/menu/footer.jsp" %>
<!-- End Footer -->

<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
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

<!-- jAlert js -->
<script src="jAlert/dist/jAlert.min.js"></script>
<script src="jAlert/dist/jAlert-functions.min.js"> //optional!!</script>


<script>
    $(document).ready(function () {
        ////// APLICAMOS FORMATO Y BOTONES A LA TABLA //// INICIAMOS EL PLUGIN DATATABLE
        $('#tblRol').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'pdf',
                'excel', 'print']

        });

        ////////////////////////////////////////////////
         /////////// VARIABLE DE CONTROL MSJ ///////////
        var mensaje = "";
        mensaje = "<%=varMsj%>";

        if(mensaje == "1")
        {
            successAlert('�xito', 'Los datos han sido registrados exitosamente!');
        }
        if(mensaje == "2")
        {
            errorAlert('Error', 'Revise los datos e intente nuevamente!');
        }
        if(mensaje == "3")
        {
            successAlert('�xito', 'Los datos han sido actualizados exitosamente!');
        }
        if(mensaje == "4")
        {
            errorAlert('Error', 'Revise los datos e intente nuevamente!!');
        }
        if(mensaje == "5")
        {
            successAlert('�xito', 'El rol ha sido dado de baja exitosamente!');
        }
        if(mensaje == "6")
        {
            errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
        }

    });
</script>


</body>
</html>
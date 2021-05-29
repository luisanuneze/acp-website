<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Publicaciones, datos.Dt_Publicaciones, vistas.VW_RolUsuario, datos.Dt_RolOpciones, java.util.*;" %>
<%
	response.setHeader( "Pragma", "no-cache" );
	response.setHeader( "Cache-Control", "no-store" );
	response.setDateHeader( "Expires", 0 );
	response.setDateHeader( "Expires", -1 );
	
	VW_RolUsuario vru = new VW_RolUsuario();
	Dt_RolOpciones dtro = new Dt_RolOpciones();
	ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
	
	//OBTENEMOS LA SESION
	vru = (VW_RolUsuario) session.getAttribute("acceso");
	if(vru==null){
		response.sendRedirect("inicioSesion.jsp?msj=401");
	}
	else{
		//OBTENEMOS LA LISTA DE OPCIONES ASIGNADAS AL ROL
		listRolOpc = dtro.listaRolOpc2(vru.getRolid());
		//listOpc = dtro.listaRolOpc(vru.getIdrol());
		
		//RECUPERAMOS LA URL = MI OPCION ACTUAL
		int index = request.getRequestURL().lastIndexOf("/");
		String miPagina = request.getRequestURL().substring(index+1);
		boolean permiso = false; //VARIABLE DE CONTROL
		
		//VALIDAR SI EL ROL CONTIENE LA OPCION ACTUAL DENTRO DE LA MATRIZ DE OPCIONES
		for(VW_RolOpciones vrop : listRolOpc){
			if(vrop.getOpcion().trim().equals(miPagina.trim())){
				permiso = true; //ACCESO CONCEDIDO
				break;
			}
		}
		
		if(!permiso){
			response.sendRedirect("401.jsp");
		}	
	}
	
	//Variable de control de mensajes
		String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");
%>
<!DOCTYPE html>
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
        <div class="container-fluid container" data-aos="fade-up">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Gestión de Publicaciones</h1>
            <p class="mb-4">Desde esta pantalla del sistema usted podrá
                controlar la creación, actualización y el dar de baja a publicaciones.</p>


            <!-- DataTables Usuarios -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Publicaciones
                        Registrados</h6>
                </div>
                <div class="card-body">
                    <div align="right">
                        &nbsp;&nbsp;
                        <!-- Button trigger modal -->
                        <a href="NuevaPublicacion.jsp" data-toggle="modal"
                           data-target="#modalNuevaPublicacion"> <i
                                class="fas fa-plus-square fa-2x" title="Registrar Nueva Publicacion"></i>
                        </a>
                        
                        

                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="tblPublicaciones" width="100%"
                               cellspacing="0">
                            <%
                                ArrayList<Publicaciones> listPubli = new ArrayList<Publicaciones>();
                                Dt_Publicaciones dtpu = new Dt_Publicaciones();
                                listPubli = dtpu.listaPublisActivas();

                            %>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Título</th>
                                <th>Descripcion</th>
                                <th>Documento</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Título</th>
                                <th>Descripcion</th>
                                <th>Documento</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <%
                                for (Publicaciones pu : listPubli) {
                            %>
                            <tr>
                                <td><%=pu.getPublicacionesid() %>
                                </td>
                                <td><%=pu.getTitulo() %>
                                </td>
                                <td><%=pu.getDescripcion() %>
                                </td>
                                <td class="text-center"><a href="#"></a><i class="fa fa-file" aria-hidden="false" title="<%=pu.getMultimedia() %>"></i></a>
                                </td>
                                <td><%=pu.getEstado() != 3 ? "ACTIVO" : "INACTIVO" %>
                                </td>
                                <td class="text-center">
                                <a id="btn-edita-abrir" href="EditarPublicacion.jsp?PublicacionesID=<%=pu.getPublicacionesid()%>">
                                    <i class="fas fa-edit" title="Modificar datos de la Publicación"></i>
                                </a> 
                               
                                           		<a class="ajax-link" href="javascript:void(0);" 
                                           		onclick="$.jAlert({
                                           		    'type': 'confirm',
                                           		    'confirmQuestion': 'Realmente desea eliminar este registro?',
                                           		    'onConfirm': function(e, btn){
                                           		      e.preventDefault();
                                           		      //do something here

                                           		      window.location.href = 'Sl_GestionPublicaciones?PublicacionesID=<%=pu.getPublicacionesid()%>';
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
                        							<i class="fas fa-trash-alt" title="Eliminar Publicacion"></i>
                        						</a> 
                        		<a href="documento.jsp?publicacionesID=<%=pu.getPublicacionesid()%>">
                        							<i class="fa fa-file" aria-hidden="true" title="Guardar documento"></i>
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
       $(document).ready(function()
		{
		 
			
		    var mensaje = "";
			mensaje = "<%=varMsj%>";
			
			if(mensaje == "1")
            {
                successAlert('Éxito', 'Los datos han sido registrados exitosamente!');
            }
            if(mensaje == "2")
            {
                errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
            }
            if(mensaje == "3")
            {
                successAlert('Éxito', 'Los datos han sido actualizados exitosamente!');
            }
            if(mensaje == "4")
            {
                errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
            }
            if(mensaje == "5")
            {
                successAlert('Éxito', 'La Publicación ha sido dado de baja exitosamente!');
            }
            if(mensaje == "6")
            {
                errorAlert('Error', 'Revise los datos e intente nuevamente!!!');
            }
            if(mensaje == "g1")
            {
                successAlert('Éxito', 'El documento se guardó con exito!!!');
            }
            if(mensaje == "g2")
            {
                successAlert('Éxito', 'El documento se guardó con exito!!!');
            }

			if (mensaje == "existe") {
				errorAlert('Error','El titulo de la publicación que esta intentando registrar ya existe en la base de datos!');
			}
		});
        ////////////////////////////////////////////////
        /////////// VARIABLE DE CONTROL MSJ ///////////
        

    
</script>


</body>
</html>
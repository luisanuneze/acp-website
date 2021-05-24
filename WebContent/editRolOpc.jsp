<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="entidades.*, datos.*, vistas.*, java.util.*;" %>
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
            <h1 class="h3 mb-2 text-gray-800">Actualizar Opcion a Rol</h1>


            <!-- DataTables Usuarios -->
            <div class="card shadow mb-4">

                <div class="card-body">
                    <div align="right">

                        <a href="tblRolOpc.jsp">
                            <h7 class="fas fa-arrow-left fa-2x"
                                title="Retornar a la pagina anterior"></h7>
                        </a>

                    </div>
                    
                    <%
                            	String us = "";
								us = request.getParameter("rol_opcionesID")==null?"0":request.getParameter("rol_opcionesID");
														
								RolOpciones ro = new RolOpciones();
								Dt_RolOpciones dtro = new Dt_RolOpciones();
								ro = dtro.getRolOpciones(Integer.parseInt(us));
                            %>
                            
                     <%
                            	String ropc = "";
								ropc = request.getParameter("rol_opcionesID")==null?"0":request.getParameter("rol_opcionesID");
														
								VW_RolOpciones vwro = new VW_RolOpciones();
								Dt_RolOpciones dtvwro = new Dt_RolOpciones();
								vwro = dtvwro.getRolOpciones2(Integer.parseInt(ropc));
                            %>       
                    
                    <div class="table-responsive">
                        <form class="user" method="post" action="./Sl_GestionRolOpc">
                            <!-- El valor de este input es para el Servlet opcion guardar -->
                            <input name="idRolOpc" type="hidden" value="<%=ro.getRol_opcionesID()%>" /> 
							<input name="opcion" type="hidden" value="2" />
							<input name="ID" type="hidden" value="<%=vwro.getID()%>" /> 
							<input name="opcion" type="hidden" value="2" />
                            <div class="text-center">
                                <div class="col-sm-12 mb-3">
                                    <%
                                        ArrayList<Rol> listRol = new ArrayList<Rol>();
                                        Dt_Rol dtr = new Dt_Rol();
                                        listRol = dtr.listaRolActivos();
                                    %>
                                    <select class="form-control" name="cbxRol" id="cbxRol" disabled="disabled"
                                            required>
                                        <option value="">Seleccione...</option>
                                        <%
                                            for (Rol r : listRol) {
                                        %>
                                        <option value="<%=r.getRolID()%>"><%=r.getRol()%>
                                        </option>
                                        <%
                                            }
                                        %>

                                    </select>
                                </div>
                                <div class="col-sm-12 mb-3">
                                    <%
                                        ArrayList<Opciones> listOpc = new ArrayList<Opciones>();
                                        Dt_Opciones dto = new Dt_Opciones();
                                        listOpc = dto.listaOpcActivos();
                                    %>
                                    <select class="form-control" name="cbxOpc" id="cbxOpc"
                                            required>
                                        <option value="">Seleccione...</option>
                                        <%
                                            for (Opciones u : listOpc) {
                                        %>
                                        <option value="<%=u.getOpcionesID()%>"><%=u.getOpcion()%>
                                        </option>
                                        <%
                                            }
                                        %>

                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="text-center">
                                <input style="background-color:#0e203f; color:white"
                                       class="btn btn-primary btn-user btn-block" type="submit"
                                       value="Actualizar"/>


                                <input style="background-color:#0e203f; color:white"
                                       class="btn btn-google btn-user btn-block" type="reset"
                                       value="Cancelar"/>
                            </div>
                        </form>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>
$(document).ready(function()
		{
			$("#cbxRol").val("<%=ro.getRolId()%>");
			$("#cbxOpc").val("<%= ro.getOpcionesID()%>");
		});
</script>

<script>
    $(document).ready(function () {
        ////// APLICAMOS FORMATO Y BOTONES A LA TABLA //// INICIAMOS EL PLUGIN DATATABLE
        $('#tblRolOpc').DataTable({
            dom: 'Bfrtip',
            buttons: [
                //             'pdf',
                'excel']

        });

        ////////////////////////////////////////////////

    });
</script>


</body>
</html>
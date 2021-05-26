<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.Eventos, datos.Dt_Eventos, datos.Dt_Usuario, entidades.Usuario, datos.PoolConexion,java.util.*;" %>
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

            <h2 class="form-header" style="color: black;">Editar Evento</h2>
            <br>
            
            <%
                 String ev = "";
				 ev = request.getParameter("Eventoid")==null?"0":request.getParameter("Eventoid");
														
				 Eventos eve = new Eventos();
				 Dt_Eventos dte = new Dt_Eventos();
				 eve = dte.getEventos(Integer.parseInt(ev));
            %>
            
            <%
          		ArrayList<Usuario> listUser = new ArrayList<Usuario>();
          		Dt_Usuario dtu = new Dt_Usuario();
          		listUser = dtu.listaUserActivos();
        	%>

            <form class=" row" method="post" action="./Sl_GestionEventos">
                <!-- El valor de este input es para el Servlet opcion guardar -->
					<input name="eventoid" type="hidden"
						value="<%=eve.getEventoid()%>" /> 
						<input name="opcion" type="hidden" value="2" />
                <div class="col-sm-4">
                    <div class="col-sm-12 mb-3 mb-sm-0">

                        <input type="text" class="form-control form-control-user" name="txtEvento" id="txtEvento"
                               placeholder="Nombre de Evento" required>

                    </div>
                    <br><br>
                    <div class="col-sm-12 mb-3 mb-sm-0">

                        <input type="text" class="form-control form-control-user" name="txtDescripcion"
                               id="txtDescripcion"
                               placeholder="Descripcion" required>

                    </div>
                    <br><br>
                    <div class="col-sm-12 mb-3 mb-sm-0">

                        <input type="text" class="form-control form-control-user" name="txtUbicacion" id="txtUbicacion"
                               placeholder="Ubicacion" required>

                    </div>
                    <br>
                    
                    <!-- Botones -->
                    <div class="col-md-6">
                		<input class="btn btn-primary btn-user btn-block" type="submit" value="Actualizar" />
                    </div>



                </div>
                <div class="col-sm-4">
                
               		    <select class="form-control" name="TipoEvento" id="TipoEvento" required>
                            <option value="">Seleccione el tipo de evento</option>
                            <option value="Publica">Publico</option>
                            <option value="Privada">Privado</option>
                        </select>
                        <br>

                    <h8>Fecha de Inicio de Evento</h8>
                    <input type="date" class="form-control form-control-user" name="txtFechainicio" id="txtFechainicio"
                           placeholder="Fecha inicio" required>

                    <br>

                    <h8>Fecha de Fin de Evento</h8>
                    <input type="date" class="form-control form-control-user" name="txtFechafin"
                           id="txtFechafin" placeholder="Fecha fin">
                           

                    <br><br>

                    <div class="col-md-6">
                        <a class="button" href="tblEventos.jsp"> Regresar </a>
                    </div>


                </div>


                <div class="col-sm-4">
                    <div class="centrado">

                        
                        <div>
                        <select class="form-control" name="cbxuser" id="cbxuser">
                        	<option value="">Seleccione el usuario encargado...</option>
                        <%
                        	for(Usuario u: listUser){
                        %>
                        	<option value="<%= u.getUsuarioID() %>"><%= u.getUsuario() %></option>
                        <%
                        		}
                        %>
                        </select>
                        </div><br><br>

                        <div class="root">
                            <div class="calendar" id="calendar">

                            </div>

                        </div>

                    </div>


                </div>
            </form>

            <br>


        </div>

    </section>
    <!-- End Inicio Section -->

</main><!-- End #main -->

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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/es.js"></script>
<script type="text/javascript" src="assets/js/calendar.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
    let calendar = new Calendar('calendar');
    calendar.getElement().addEventListener('change', e => {
        console.log(calendar.value().format('LLL'));
    });
</script>

<script>  
   $(document).ready(function()
	{

		$("#txtEvento").val("<%=eve.getNombre()%>");
		$("#txtDescripcion").val("<%=eve.getDescripcion()%>");
		$("#txtUbicacion").val("<%=eve.getUbicacion()%>");
		$("#txtFechainicio").val("<%=eve.getFechainicio()%>");
		$("#txtFechafin").val("<%=eve.getFechafin()%>");
		$("#cbxuser").val("<%=eve.getUsuarioid()%>");
		$("#TipoEvento").val("<%=eve.getTipoevento()%>");
	});
</script>

</body>
</html>
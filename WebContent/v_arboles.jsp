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

            <!-- Despliegue de filtros -->
            <div class="form-group row">
                <div class="col-sm-4">  
                </div>
                <div class="col" align="right">
                    
                </div>
 <h1 class="h3 mb-2 text-gray-800">Cátologo de árboles</h1>
            </div>
            <!-- Termina despliegue de filtros-->

            <%
                ArrayList<VW_Arbol> listArbol = new ArrayList<VW_Arbol>();
                Dt_Arbol dta = new Dt_Arbol();
                listArbol = dta.listaArbol();

            %>
            <!-- Cardview arboles -->
            <div class="card-view">
                <%
                    for (VW_Arbol ar : listArbol) {
                %>
              
						<div class="arboles d-flex flex-column">
                        <img src="<%=ar.getImagen() == null ? "#" : ar.getImagen()%>">
                        <hr>
                        <p><%=ar.getNombreComun() %>
                        </p>
                       
                    </div>
                     
                <%
                    }
                %>


              <button type="button" class="btn btn-outline-primary btn-block"
							data-toggle="modal"
							data-target="#exampleModal">
							Ver</button>

            </div>
            <!-- Fin cardviews -->

        </div>
<%
                            	String us = "";
								us = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
														
								Arbol arb = new Arbol();
								Dt_Arbol dtar = new Dt_Arbol();
								arb = dta.getArbol(Integer.parseInt(us));
							
                            %>
                            
                            <%
                            	String rous = "";
								rous = request.getParameter("arbolID")==null?"0":request.getParameter("arbolID");
														
								VW_Arbol vwru = new VW_Arbol();
								Dt_Arbol dtrous = new Dt_Arbol();
								vwru = dtrous.getArbol2(Integer.parseInt(rous));
                            %>

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


			<!-- Modal -->
			<div class="modal fade" id="exampleModal"  tabindex="-1" role="dialog"
				aria-labelledby="exampleModal" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header  bg-primary text-white">
							<h5 class="modal-title" id="exampleModalLongTitle">Arbol</h5>
							<button type="button" class="close text-white"
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form>
							<!-- El valor de este input es para el Servlet opcion guardar -->
								<input name="idArbol" type="hidden" value="<%=arb.getArbolId()%>" /> 
								<input name="opcion" type="hidden" value="2" /> 
								<input name="ID" type="hidden" value="<%=vwru.getID()%>" /> 
								<input name="opcion" type="hidden" value="2" />
								<div class="form-group">
									<div class="">
										<img name="imgArbol" id="imgArbol"
											src="<%=arb.getImagen() == null ? "#" : arb.getImagen()%>">
										<hr>
										<p></p>
									</div>
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Nombre Común:</label>
									<input type="text" class="form-control" name="txtNombreC" id="txtNombreC">
								</div>

								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Nombre Científico:</label>
									<input type="text" class="form-control" name="txtNombreCi" id="txtNombreCi">
								</div>

								<div class="form-group">
									<label for="message-text" class="col-form-label">Género:</label>  
										<select class="form-select" name="cbxGenero" id="cbxGenero" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Genero ar : listGenero) {
                                                %>
                                                <option value="<%= ar.getGeneroID() %>"><%= ar.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Familia:</label>
									 <select class="form-select" name="cbxFamilia" id="cbxFamilia" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Familia fr : listFamilia) {
                                                %>
                                                <option value="<%= fr.getFamiliaID() %>"><%= fr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Floración:</label>
									 <select class="form-select" name="cbxFlora" id="cbxFlora" required>
                                                <option value="">Seleccione</option>
                                                <%
                                                    for (Floracion flr : listFloracion) {
                                                %>
                                                <option value="<%= flr.getFloracionID() %>"><%= flr.getNombre() %>
                                                </option>
                                                <%
                                                    }
                                                %>

                                            </select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Descripción:</label>
									<textarea class="form-control" name="txaDescrip" id="txaDescrip"></textarea>
								</div>

								<br>

							</form>

							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cerrar</button>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>  
   $(document).ready(function()
	{
	   $("#imgArbol").val("<%=arb.getImagen()%>");
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
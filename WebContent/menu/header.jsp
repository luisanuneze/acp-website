<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="entidades.Genero, datos.Dt_Genero, entidades.Home, datos.Dt_Home, vistas.*, datos.Dt_RolOpciones, java.util.*;" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<!-- Custom fonts for this template -->
<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- ======= Header ======= --> 
  <header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="index.jsp">Página principal</a></li>
          <li><a class="nav-link" href="eventos.jsp">Eventos</a></li>
           <li class="dropdown"><a href="arboles.jsp"><span>Árboles</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link" href="tblGenero.jsp">Género</a></li>
              <li><a class="nav-link" href="tblFamilia.jsp">Familia</a></li>
              <li><a class="nav-link" href="tblFloracion.jsp">Floración</a></li>
               <li class="dropdown"><a href="tblDistribucion.jsp"><span>Distribución</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
               	  <li class="dropdown"><a href="tblPais.jsp"><span>País</span> <i class="bi bi-chevron-right"></i></a>
                  <ul>
                    <li><a class="nav-link" href="tblRegion.jsp">Región</a></li>
                 </ul>
                </ul>
              </li> 
            </ul>
          </li>
          <li><a class="nav-link" href="#">Mapa</a></li>
          <li><a class="nav-link" href="servicios.jsp">Servicios</a></li>
          <li><a class="nav-link" href="publicaciones.jsp">Publicaciones</a></li>
          <li class="dropdown"><a href="#"><span>Seguridad</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li class="dropdown"><a href="tblUsuarios.jsp"><span>Usuarios</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a class="nav-link" href="tblRolUser.jsp">Asignar Rol</a></li>
                </ul>
              </li>
              <!--<li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
              <li class="dropdown"><a href="tblRol.jsp"><span>Roles</span><i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a class="nav-link" href="tblRolOpc.jsp">Asignar Opción</a></li>
                </ul>
              </li>
              <li><a class="nav-link" href="tblOpciones.jsp">Opciones</a></li>
            </ul>
          </li>
          <%
            /*String Username = null;
            if(vru == null){
            	
            }else
            {
            	Username = vru.getUsuario();
            }*/
          %>
          <li class="dropdown"><a href="#"><img src="assets/img/usuario.png"><i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link" href="#">User: <%//=Username%></a></li>
              <li><a class="nav-link" href="#">Editar datos</a></li>
              <li><a class="nav-link" href="inicioSesion.jsp">Salir</a></li>  
            </ul>
          </li>  
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!-- .navbar -->

    </div>
  </header>    
  <!-- End Header -->
</body>

</html>
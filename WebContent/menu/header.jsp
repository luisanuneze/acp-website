<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
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
          <li><a class="nav-link scrollto active" href="index.jsp">Página principal</a></li>
          <li><a class="nav-link" href="#">Eventos</a></li>
           <li class="dropdown"><a href="arboles.jsp"><span>Árboles</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link" href="tblFamilia.jsp">Familia</a></li>
              <!--<li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
            </ul>
          </li>
          <li><a class="nav-link" href="#">Mapa</a></li>
          <li><a class="nav-link" href="publicaciones.jsp">Publicaciones</a></li>
          <li class="dropdown"><a href="#"><span>Seguridad</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link" href="tblUsuarios.jsp">Usuarios</a></li>
              <!--<li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li> -->
              <li><a class="nav-link" href="tblRol.jsp">Roles</a></li>
              <li><a class="nav-link" href="tblOpciones.jsp">Opciones</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <li><a href="inicioSesion.jsp"><img src="assets/img/usuario.png"></a></li>
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      <!-- .navbar -->

    </div>
  </header>    
  <!-- End Header -->
</body>

</html>
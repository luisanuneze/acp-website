<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entidades.Info_Footer, datos.Dt_InfoFooter, java.util.*;" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
</head>

<body>
  <!-- ======= Footer ======= --> 
  <footer id="footer" class="footer">

    <div class="container">
    
    <%
         ArrayList<Info_Footer> listInfo_Footer = new ArrayList<Info_Footer>();
         Dt_InfoFooter dtfo = new Dt_InfoFooter();
         listInfo_Footer = dtfo.listaFooter();
     %>

      <h4><strong>Contacto</strong></h4>
      <%
          for (Info_Footer foo : listInfo_Footer) {
      %>
      <p>
        <%=foo.getDireccion() %><br>
        Managua, Nicaragua<br><br>
        <strong>Tel�fono: </strong><%=foo.getTelefono() %><br>
        <strong>Ext: </strong><%=foo.getExtension() %><br>
        <strong>Correo: </strong><%=foo.getCorreo() %><br>
      </p>      
       <%
           }
       %>

      <br><center><hr></center>

      <div class="credits">
        Designed by Tiny Trees�
      </div>

    </div>
  </footer>
  <!-- End Footer -->
</body>

</html>
package servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Usuario;
import entidades.Usuario;

/**
 * Servlet implementation class Sl_GestionUsuario
 */
@WebServlet("/Sl_GestionUsuario")

public class Sl_GestionUsuario  extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int usuarioID =0;
		usuarioID = Integer.parseInt(request.getParameter("usuarioID"));
		Dt_Usuario dtu = new Dt_Usuario();
		
		if(dtu.eliminarUser(usuarioID)) {
        	response.sendRedirect("tblUsuarios.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblUsuarios.jsp?msj=6");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		System.out.println("Entro a la consola");
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO USUARIO
			Dt_Usuario dtu = new Dt_Usuario();
			Usuario user = new Usuario();
			
			//user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioID")));
			user.setNombres(request.getParameter("txtNombres"));
			user.setApellidos(request.getParameter("txtApellidos"));
			user.setUsuario(request.getParameter("txtUserName"));
			user.setEmail(request.getParameter("txtEmail"));
			user.setContrasenia(request.getParameter("txtPwd"));
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        user.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("user.getFechaCreacion(): "+user.getFechaCreacion());
		        	
			        if(dtu.guardarUser(user)) {
			        	response.sendRedirect("tblUsuarios.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblUsuarios.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionUsuario, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
			
				try {
					user.setUsuarioID(Integer.parseInt(request.getParameter("usuarioID")));
					//PARA GUARDAR LA FECHA Y ORA DE MODIFICACION
					Date fechaSistema = new Date();
					user.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
					System.out.println("user.getFechaModificacion(): "+user.getFechaModificacion());
							        	
		        if(dtu.modificarUser(user)) {
		        	response.sendRedirect("tblUsuarios.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("tblUsuarios.jsp?msj=4");
		        }
		        
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionUsuario, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblUsuarios.jsp?msj=5");	
			break;
	}
		
		
		
	}
	
}

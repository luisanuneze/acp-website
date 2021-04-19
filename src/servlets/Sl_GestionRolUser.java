package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_RolUsuario;
import entidades.RolUsuario;

/**
 * Servlet implementation class Sl_GestionRolUser
 */
@WebServlet("/Sl_GestionRolUser")
public class Sl_GestionRolUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRolUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO ROL-USER
		RolUsuario ru = new RolUsuario();		
		ru.setUsuarioID(Integer.parseInt(request.getParameter("cbxUser")));
		ru.setRolId(Integer.parseInt(request.getParameter("cbxRol")));
		Dt_RolUsuario dtru = new Dt_RolUsuario(); 
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creaci�n.
		        	
		        	Date fechaSistema = new Date();
			        ru.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("user.getFechaCreacion(): "+ru.getFechaCreacion());
		        	
			        if(dtru.guardarRolUser(ru)) {
			        	response.sendRedirect("rolUser.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("rolUser.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
	        	/*
		        if(dtu.modificarUser(user)) {
		        	response.sendRedirect("tblUsuarios.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("tblUsuarios.jsp?msj=4");
		        }
		        */	
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolUser, el error es: " + e.getMessage());
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

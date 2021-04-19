package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Eventos;
import entidades.Eventos;

/**
 * Servlet implementation class Sl_GestionEventos
 */
@WebServlet("/Sl_GestionEventos")

public class Sl_GestionEventos extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionEventos() {
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
				
		//CONSTRUIR EL OBJETO USUARIO
			Dt_Eventos dte = new Dt_Eventos();
			Eventos eve = new Eventos();
			eve.setEventoid(Integer.parseInt(request.getParameter("eventoid")));
			eve.setUsuarioid(Integer.parseInt(request.getParameter("usuarioid")));
			eve.setNombre(request.getParameter("txtNombre"));
			eve.setDescripcion(request.getParameter("txtDescripcion"));
			eve.setTipoevento(request.getParameter("txtTipoEve"));
			eve.setUbicacion(request.getParameter("txtUbicacion"));
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creación.
		        	
		        	Date fechaSistema = new Date();
			        eve.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("user.getFechaCreacion(): "+eve.getFechaCreacion());
		        	
			        if(dte.guardarEvent(eve)) {
			        	response.sendRedirect("tblUsuarios.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblUsuarios.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionEventos, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
	        	/*
		        if(dte.modificarEvento(eve)) {
		        	response.sendRedirect("tblEventos.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("tblEventos.jsp?msj=4");
		        }
		        */	
	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionEventos, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblEventos.jsp?msj=5");	
			break;
	}
		
		
		
	}

}

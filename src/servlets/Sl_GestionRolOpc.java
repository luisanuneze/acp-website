package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_RolOpciones;
import datos.Dt_RolUsuario;
import entidades.RolOpciones;

/**
 * Servlet implementation class Sl_GestionRolOpc
 */
@WebServlet("/Sl_GestionRolOpc")
public class Sl_GestionRolOpc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionRolOpc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int rol_opcionesID =0;
		rol_opcionesID = Integer.parseInt(request.getParameter("rol_opcionesID"));
		Dt_RolOpciones dtro = new Dt_RolOpciones(); 
		
		if(dtro.eliminaRolOpc(rol_opcionesID)) {
        	response.sendRedirect("tblRolOpc.jsp?msj=5");
        }
        else {
        	response.sendRedirect("tblRolOpc.jsp?msj=6");
        }
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
				
		//CONSTRUIR EL OBJETO ROL-OPC
		RolOpciones ro = new RolOpciones();		
		ro.setOpcionesID(Integer.parseInt(request.getParameter("cbxOpc")));
		ro.setRolId(Integer.parseInt(request.getParameter("cbxRol")));
		Dt_RolOpciones dtro = new Dt_RolOpciones(); 
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creaci�n.
		        	
		        	Date fechaSistema = new Date();
			        ro.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("ro.getFechaCreacion(): "+ro.getFechaCreacion());
		        	
			        if(dtro.guardarRolOpc(ro)) {
			        	response.sendRedirect("tblRolOpc.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblRolOpc.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionRolOpc, el error es: " + e.getMessage());
					e.printStackTrace();
		        }
		        
				break;
			}
		
		case 2:{
				
			try {
				ro.setRol_opcionesID(Integer.parseInt(request.getParameter("ID")));
				//PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				ro.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("user.getFechaModificacion(): "+ro.getFechaModificacion());

	        	
		        if(dtro.modificarRolOpc(ro)) {
		        	response.sendRedirect("tblRolOpc.jsp?msj=3");
		        }
		        else {
		        	response.sendRedirect("tblRolOpc.jsp?msj=4");
		        }

	        	
	        }
	        catch(Exception e) {
	        	System.out.println("Sl_GestionRolOpc, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblRolOpc.jsp?msj=5");	
			break;
	}
		
		
		
	}

}

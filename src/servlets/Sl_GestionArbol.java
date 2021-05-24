package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.Dt_Arbol;
import entidades.Arbol;

/**
 * Servlet implementation class Sl_GestionArbol
 */
@WebServlet("/Sl_GestionArbol")
public class Sl_GestionArbol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_GestionArbol() {
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
		doGet(request, response);
		
		//obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));
				
		//CONSTRUIR EL OBJETO USUARIO
			Dt_Arbol dta = new Dt_Arbol();
			Arbol arb = new Arbol();
			//fam.setFamiliaID(Integer.parseInt(request.getParameter("familiaID")));
			arb.setNombrecientifico(request.getParameter("txtNombreC"));
			arb.setNombrecomun(request.getParameter("txtNombreCi"));
			arb.setDescripcion(request.getParameter("txtDesA"));
			arb.setDistribucionID(Integer.parseInt(request.getParameter("cbxDis")));
			arb.setFamiliaID(Integer.parseInt(request.getParameter("cbxFam")));
			arb.setGeneroID(Integer.parseInt(request.getParameter("cbxGen")));
			arb.setFloracionID(Integer.parseInt(request.getParameter("cbxFlor")));
			
		
		
		switch (opc){
		case 1:{
			
		        try {
		        	// Para Guardar la Fecha y Hora de creaci�n.
		        	
		        	Date fechaSistema = new Date();
			        arb.setFechaCreacion(new java.sql.Timestamp(fechaSistema.getTime()));
			        System.out.println("fam.getFechaCreacion(): "+arb.getFechaCreacion());
		        	
			        if(dta.guardarArbol(arb)) {
			        	response.sendRedirect("tblArbol.jsp?msj=1");
			        }
			        else {
			        	response.sendRedirect("tblArbol.jsp?msj=2");
			        }
			        	
		        }
		        catch(Exception e) {
		        	System.out.println("Sl_GestionArbol, el error es: " + e.getMessage());
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
	        	System.out.println("Sl_GestionArbol, el error es: " + e.getMessage());
				e.printStackTrace();
	        }
				break;
				
			}
		
		default:
			response.sendRedirect("tblArbol.jsp?msj=5");	
			break;
	}
		
	}

}
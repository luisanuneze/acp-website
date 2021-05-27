package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Home;
import datos.Dt_Home;

/**
 * Servlet implementation class Sl_GestionHome
 */
@WebServlet("/Sl_GestionHome")

public class Sl_GestionHome extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sl_GestionHome() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		int HomeID =0;
		HomeID = Integer.parseInt(request.getParameter("homeID"));
		Dt_Home dtpa = new Dt_Home();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

		// obtenemos el valor de opcion
		int opc = 0;
		opc = Integer.parseInt(request.getParameter("opcion"));

		// CONSTRUIR EL OBJETO ROL
		Dt_Home dtho = new Dt_Home();
		Home ho = new Home();
		
		//rol.setRolID(Integer.parseInt(request.getParameter("rolID")));
		ho.setHistoria(request.getParameter("txtHistoria"));
		ho.setHistoria(request.getParameter("txtMision"));
		ho.setHistoria(request.getParameter("txtVision"));

		switch (opc) {
		case 1: {
			
			ho.setHomeID(Integer.parseInt(request.getParameter("homeID")));

			try {
				//pa.setPaisID(Integer.parseInt(request.getParameter("PaisID")));
				// PARA GUARDAR LA FECHA Y HORA DE MODIFICACION
				Date fechaSistema = new Date();
				ho.setFechaModificacion(new java.sql.Timestamp(fechaSistema.getTime()));
				System.out.println("ho.getFechaModificacion(): " + ho.getFechaModificacion());
				if (dtho.modificarHome(ho)) {
					response.sendRedirect("edicionSeccion.jsp?msj=3");
				} 
				else {
					response.sendRedirect("edicionSeccion.jsp?msj=4");
				}

			} catch (Exception e) {
				System.out.println("Sl_GestionHome, el error es: " + e.getMessage());
				e.printStackTrace();
			}
			break;
		}

		default:
			response.sendRedirect("edicionSeccion.jsp?msj=5");
			break;
		}
	}

}
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datos.Dt_Usuario;
import vistas.VW_RolUsuario;

/**
 * Servlet implementation class Sl_Login
 */
@WebServlet("/Sl_Login")
public class Sl_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sl_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		Dt_Usuario dtu = new Dt_Usuario();
		VW_RolUsuario vwru = new VW_RolUsuario();
		String usuario = "";
		String clave = "";
		int rolId = 0;
		
		usuario = request.getParameter("usuario");
		clave = request.getParameter("contrasenia");
		rolId = Integer.parseInt(request.getParameter("cbxRol"));
		System.out.println("Alo?");
		
		try{
			
			if(dtu.dtverificarLogin(usuario, clave, rolId)){
				vwru = dtu.dtGetRU(usuario);
				System.out.println("Alo?");
				HttpSession hts = request.getSession(true);
				System.out.println("A?");
				hts.setAttribute("acceso", vwru);
				response.sendRedirect("index.jsp");
				
			}
			else{
				response.sendRedirect("inicioSesion.jsp?msj=403");
				System.out.println("XD?");
			}
		}
		catch(Exception e)
		{
			System.out.println("Servlet: El error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		
	}

}
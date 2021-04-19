package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Servicios;

public class Dt_Servicios {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsServicios = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsServicios(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from servicios", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsServicios = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR SERVICIOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar servicios registrados y activos
		
		public ArrayList<Servicios> listaServicios(){
			ArrayList<Servicios> listServicios = new ArrayList<Servicios>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.servicios", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Servicios serv = new Servicios();
					serv.setServiciosid(rs.getInt("serviciosid"));
					//serv.setUsuarioid(rs.getInt("usuarioid"));
					serv.setNombre(rs.getString("nombre"));
					serv.setDescripcion(rs.getString("descripcion"));
					serv.setFoto(rs.getString("foto"));
					serv.setEstado(rs.getInt("estado"));
					serv.setFechaCreacion(rs.getTimestamp("fechacreacion"));
					listServicios.add(serv);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR SERVICIOS "+ e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return listServicios;
		}
		
		// Metodo para visualizar los datos de un usuario específico
		/*public Usuario getUsuario(int usuarioID)
		{
			Usuario user = new Usuario();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"usuario\" where estado <> 3 and \"usuarioID\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, usuarioID);
				rs = ps.executeQuery();
				if(rs.next())
				{
					user.setUsuarioID(usuarioID);
					user.setUsuario(rs.getString("usuario"));
					user.setContrasenia(rs.getString("contrasenia"));
					user.setNombres(rs.getString("nombres"));
					user.setApellidos(rs.getString("apellidos"));
					user.setEstado(rs.getInt("estado"));
				}
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR getNIMA(): "+ e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rs != null){
						rs.close();
					}
					if(ps != null){
						ps.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return user;
		}
		
		//Metodo para almacenar nuevo usuario
		public boolean guardarUser(Usuario user){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.moveToInsertRow();
//				rsUsuario.updateInt("UsuarioID", 2);
				rsUsuario.updateString("usuario", user.getUsuario());
				rsUsuario.updateString("contrasenia", user.getContrasenia());
				rsUsuario.updateString("nombres", user.getNombres());
				rsUsuario.updateString("apellidos", user.getApellidos());
				rsUsuario.updateTimestamp("fechacreacion", user.getFechaCreacion());
				rsUsuario.updateInt("Estado", 1);
				rsUsuario.insertRow();
				rsUsuario.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL GUARDAR Usuario "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return guardado;
		}
		
		// Metodo para modificar usuarios
		public boolean modificarUser(Usuario user)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsUsuario(c);
				rsUsuario.beforeFirst();
				while (rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==user.getUsuarioID())
					{
						rsUsuario.updateString("usuario", user.getUsuario());
						rsUsuario.updateString("contrasenia", user.getContrasenia());
						rsUsuario.updateString("nombres", user.getNombres());
						rsUsuario.updateString("apellidos", user.getApellidos());
						rsUsuario.updateTimestamp("fechaModicacion", user.getFechaModificacion());
						rsUsuario.updateInt("estado", 2);
						rsUsuario.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}*/

}

package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.CatProductos;

public class Dt_Productos {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsProductos = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		
		// Metodo para llenar el RusultSet
		
		public void llenaRsProductos(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from catalogodeproductos", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsProductos = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PRODUCTOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar productos registrados y activos
		
		public ArrayList<CatProductos> listaProductos(){
			ArrayList<CatProductos> listProductos = new ArrayList<CatProductos>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.catalogodeproductos", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery(); 
				while(rs.next()){
					CatProductos prod = new CatProductos();
					prod.setCatalogodeproductosid(rs.getInt("catalogodeproductosid"));
					prod.setDescripcion(rs.getString("descripcion"));
					prod.setEstado(rs.getInt("estado"));
					prod.setFoto(rs.getString("foto"));
					prod.setNombre(rs.getString("nombre"));
					prod.setTipoproductoid(rs.getInt("tipoproductoid"));
					prod.setFechaCreacion(rs.getTimestamp("fechacreacion"));
					listProductos.add(prod);
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
			return listProductos;
		}
		
		// Metodo para visualizar los datos de un usuario espec�fico
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

package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Rol;
import entidades.Usuario;

public class Dt_Rol {
	
	//Atributos
	
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rsRol = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para llenar el RusultSet
			
			public void llenaRsRol(Connection c){
				try{
					ps = c.prepareStatement("SELECT * from rol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsRol = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR ROLES 1 "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para visualizar roles registrados y activos
			
			public ArrayList<Rol> listaRolActivos(){
				ArrayList<Rol> listRol = new ArrayList<Rol>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"rol\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Rol r = new Rol();
						r.setRolID(rs.getInt("RolID"));
						r.setRoldescripcion(rs.getString("Roldescripcion"));
						r.setRol(rs.getString("Rol"));
						r.setEstado(rs.getInt("Estado"));
      					r.setFechaCreacion(rs.getTimestamp("Fechacreacion"));
						listRol.add(r);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR ROLES 2 "+ e.getMessage());
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
				return listRol;
			}

			// Metodo para visualizar los datos de un rol específico
			public Rol getRol(int RolID)
			{
				Rol r = new Rol();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.rol where estado <> 3 and RolID=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, RolID);
					rs = ps.executeQuery();
					if(rs.next())
					{
						r.setRolID(RolID);
						r.setRol(rs.getString("rol"));
						r.setRoldescripcion(rs.getString("roldescripcion"));
						r.setEstado(rs.getInt("estado"));
					}
				}
				catch (Exception e)
				{
					System.out.println("DATOS ERROR getRol(): "+ e.getMessage());
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
				
				return r;
			}
			
			//Metodo para almacenar nuevo Rol
			public boolean guardarRol(Rol rol){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsRol(c);
					rsRol.moveToInsertRow();
//					rsUsuario.updateInt("UsuarioID", 2);
					rsRol.updateString("rol", rol.getRol());
					rsRol.updateString("roldescripcion", rol.getRoldescripcion());
					rsRol.updateTimestamp("fechacreacion", rol.getFechaCreacion());
					rsRol.updateInt("Estado", 1);
					rsRol.insertRow();
					rsRol.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR Rol "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsRol != null){
							rsRol.close();
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
			
			// Metodo para modificar rol
			public boolean modificarRol(Rol rol)
			{
				boolean modificado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsRol(c);
					rsRol.beforeFirst();
					while (rsRol.next())
					{
						if(rsRol.getInt(1)==rol.getRolID())
						{
							rsRol.updateString("rol", rol.getRol());
							rsRol.updateString("roldescripcion", rol.getRoldescripcion());
							rsRol.updateTimestamp("fechaModificacion", rol.getFechaModificacion());
							rsRol.updateInt("estado", 2);
							rsRol.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR ROL "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsRol != null){
							rsRol.close();
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
			}

}

package datos;
//cambio
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Genero;

public class Dt_Genero {

	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance();
		Connection c = null;
		private ResultSet rsGenero = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		//Metodo para llenar el ResultSet
		
		public void llenaRsGenero(Connection c) {
			try {
			ps = c.prepareStatement("SELECT * from genero", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
			rsGenero = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
				e.printStackTrace();
		}
		
	}//end public void
		
		
		//Metodo para visualizar generos de arboles registradas y activas
		
				public ArrayList<Genero> listaGenerosActivos(){
					ArrayList<Genero> listGenero = new ArrayList<Genero>();
					try{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.\"genero\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						rs = ps.executeQuery();
						while(rs.next()){
							Genero gen = new Genero();
							gen.setGeneroID(rs.getInt("generoID"));
							gen.setNombre(rs.getString("nombre"));
							gen.setDescripcion(rs.getString("descripcion"));
							gen.setEstado(rs.getInt("estado"));
							gen.setFechaCreacion(rs.getTimestamp("fechacreacion"));
							gen.setFechaModificacion(rs.getTimestamp("fechamodificacion"));
							gen.setFechaEliminacion(rs.getTimestamp("fechaeliminacion"));
							listGenero.add(gen);
						}
					}
					catch (Exception e){
						System.out.println("DATOS: ERROR EN LISTAR GENERO "+ e.getMessage());
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
					return listGenero;
				}
				
				// Metodo para visualizar los datos de un genero específico
				public Genero getGenero(int generoID)
				{
					Genero gen = new Genero();
					try
					{
						c = PoolConexion.getConnection();
						ps = c.prepareStatement("select * from public.\"genero\" where estado <> 3 and \"generoID\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
						ps.setInt(1, generoID);
						rs = ps.executeQuery();
						if(rs.next())
						{
							gen.setGeneroID(generoID);
							gen.setNombre(rs.getString("nombre"));
							gen.setDescripcion(rs.getString("descripcion"));
							gen.setEstado(rs.getInt("estado"));
							
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
					
					return gen;
				}
		
		
				//Metodo para almacenar nueva genero
				public boolean guardarGen(Genero gen){
					boolean guardado = false;
					
					try{
						c = PoolConexion.getConnection();
						this.llenaRsGenero(c);
						rsGenero.moveToInsertRow();
//						rsUsuario.updateInt("UsuarioID", 2);
						rsGenero.updateString("nombre", gen.getNombre());
						rsGenero.updateString("descripcion", gen.getDescripcion());
						rsGenero.updateTimestamp("fechacreacion", gen.getFechaCreacion());
						rsGenero.updateTimestamp("fechamodificacion", gen.getFechaModificacion());
						rsGenero.updateTimestamp("fechacreacion", gen.getFechaEliminacion());
						rsGenero.updateInt("estado", 1);
						rsGenero.insertRow();
						rsGenero.moveToCurrentRow();
						guardado = true;
					}
					catch (Exception e) {
						System.err.println("ERROR AL GUARDAR GENERO "+e.getMessage());
						e.printStackTrace();
					}
					finally{
						try {
							if(rsGenero != null){
								rsGenero.close();
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
	
	
}//end public class

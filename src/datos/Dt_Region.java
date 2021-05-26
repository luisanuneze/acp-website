package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Region;


public class Dt_Region {

	//Atributos
	
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRegion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	//Metodo para llenar el ResultSet
	
		public void llenaRsRegion(Connection c) {
			try {
			ps = c.prepareStatement("SELECT * from region", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);	
			rsRegion = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR REGIONES "+ e.getMessage());
				e.printStackTrace();}
		}
	
			//Metodo para visualizar regiones registradas y activas
			public ArrayList<Region> listaRegionActivas(){
				ArrayList<Region> listRegion= new ArrayList<Region>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"region\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Region reg = new Region();
						reg.setRegionID(rs.getInt("regionID"));
						reg.setNombre(rs.getString("nombre"));
						reg.setEstado(rs.getInt("estado"));
						reg.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
						reg.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
						reg.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
						listRegion.add(reg);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR REGIONES "+ e.getMessage());
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
				return listRegion;
			}
			
			
			// Metodo para visualizar los datos de una region espec�fica
			public Region getRegion(int regionID)
			{
				Region reg = new Region();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"region\" where estado <> 3 and \"regionid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, regionID);
					rs = ps.executeQuery();
					if(rs.next())
					{
						reg.setRegionID(regionID);
						reg.setNombre(rs.getString("nombre"));
						reg.setEstado(rs.getInt("estado"));
						
					}
				}
				catch (Exception e)
				{
					System.out.println("DATOS ERROR getRegion(): "+ e.getMessage());
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
				
				return reg;
			}
	
			
			//Metodo para almacenar nueva region
			public boolean guardarReg(Region reg){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsRegion(c);
					rsRegion.moveToInsertRow();
//								rsUsuario.updateInt("UsuarioID", 2);
					rsRegion.updateString("nombre", reg.getNombre());
					rsRegion.updateTimestamp("fechaCreacion", reg.getFechaCreacion());
					rsRegion.updateInt("estado", 1);
					rsRegion.insertRow();
					rsRegion.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR REGION "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsRegion != null){
							rsRegion.close();
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
			
			
			
			
			
}//end public void

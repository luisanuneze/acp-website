package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Distribucion;
import entidades.VW_Distribucion;

public class Dt_Distribucion {
	//Atributos
			PoolConexion pc = PoolConexion.getInstance(); 
			Connection c = null;
			private ResultSet rsDistribucion = null;
			private ResultSet rs = null;
			private PreparedStatement ps = null;
			
			// Metodo para llenar el ResultSet
			public void llenaRsDistribucion(Connection c){
				try{
					ps = c.prepareStatement("select * from public.distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rsDistribucion = ps.executeQuery();
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Distribucion "+ e.getMessage());
					e.printStackTrace();
				}
			}
			
			//Metodo para listar los Distribuciones con sus paises
			public ArrayList<VW_Distribucion> listaDistribucion(){
				ArrayList<VW_Distribucion> listDistribucion = new ArrayList<VW_Distribucion>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.vw_distribucion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						VW_Distribucion ds = new VW_Distribucion();
						ds.setID(rs.getInt("iD"));
						ds.setPais(rs.getString("pais"));
						ds.setDescripcion(rs.getString("descripcion"));
						ds.setEstado(rs.getInt("estado"));
						ds.setDistribucion(rs.getString("distribucion"));
						listDistribucion.add(ds);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR Distribuciones "+ e.getMessage());
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
				return listDistribucion;
			}
			//Metodo para guardar una distribucion
			public boolean guardarDistribucion(Distribucion d){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsDistribucion(c);
					rsDistribucion.moveToInsertRow();
					rsDistribucion.updateString("nombre", d.getNombre());
					rsDistribucion.updateString("descripcion", d.getDescripcion());
					rsDistribucion.updateInt("paisID", d.getPaisID());
					rsDistribucion.updateInt("estado", 1);
					rsDistribucion.updateTimestamp("fechaCreacion", d.getFechaCreacion());
					rsDistribucion.insertRow();
					rsDistribucion.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL guardar Distribucion "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsDistribucion != null){
							rsDistribucion.close();
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
}

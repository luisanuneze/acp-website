package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Pais;
import entidades.Region;
import entidades.VW_PaisRegion;


public class Dt_Pais {

	//Atributos
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsPaisReg = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
		
		// Metodo para llenar el ResultSet
		public void llenaRsPaisReg(Connection c){
			try{
				ps = c.prepareStatement("select * from public.pais", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsPaisReg = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR PAIS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para listar los Paises con sus regiones
		public ArrayList<VW_PaisRegion> listaPaisReg(){
			ArrayList<VW_PaisRegion> listPaisReg = new ArrayList<VW_PaisRegion>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.vw_paisregion", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					VW_PaisRegion pr = new VW_PaisRegion();
					pr.setID(rs.getInt("iD"));
					pr.setPais(rs.getString("pais"));
					pr.setEstado(rs.getInt("estado"));
					pr.setRegion(rs.getString("region"));
					listPaisReg.add(pr);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR Paises "+ e.getMessage());
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
			return listPaisReg;
		}
		//Metodo para guardar un pais
		public boolean guardarPaisReg(Pais p){
			boolean guardado = false;
			
			try{
				c = PoolConexion.getConnection();
				this.llenaRsPaisReg(c);
				rsPaisReg.moveToInsertRow();
				rsPaisReg.updateString("nombre", p.getNombre());
				rsPaisReg.updateInt("regionID", p.getRegionID());
				rsPaisReg.updateInt("estado", 1);
				rsPaisReg.updateTimestamp("fechaCreacion", p.getFechaCreacion());
				rsPaisReg.insertRow();
				rsPaisReg.moveToCurrentRow();
				guardado = true;
			}
			catch (Exception e) {
				System.err.println("ERROR AL guardar Pais "+e.getMessage());
				e.printStackTrace();
			}
			finally{
				try {
					if(rsPaisReg != null){
						rsPaisReg.close();
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

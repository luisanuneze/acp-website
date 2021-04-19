package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Familia;
import entidades.Home;

public class Dt_Home {
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsHome = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
		// Metodo para llenar el ResultSet
		public void llenaRsHome(Connection c){
			try{
				ps = c.prepareStatement("select * from public.home", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsHome = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR DATOS HOME "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		
		//Metodo para visualizar opciones de home
		public ArrayList<Home> listaHome(){
			ArrayList<Home> listHome = new ArrayList<Home>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"Home\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Home hom = new Home();
					hom.setHomeID(rs.getInt("homeID"));
					hom.setUsuarioID(rs.getInt("usuarioID"));
					hom.setMision(rs.getString("mision"));
					hom.setVision(rs.getString("vision"));
					hom.setHistoria(rs.getString("historia"));
					hom.setDescrip_pag(rs.getString("descrip_pag"));
					hom.setFechaModificacion(rs.getTimestamp("fechaModificacion"));
					listHome.add(hom);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR HOME "+ e.getMessage());
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
			return listHome;
		}

}

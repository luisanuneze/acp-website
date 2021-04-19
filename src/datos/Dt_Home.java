package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				ps = c.prepareStatement("SELECT * from home", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
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
				ps = c.prepareStatement("select * from public.\"home\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Home hom = new Home();
					hom.setHomeID(rs.getInt("homeID"));
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
		
		// Metodo para modificar home
		public boolean modificarHome(Home home)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsHome(c);
				rsHome.beforeFirst();
				while (rsHome.next())
				{
					if(rsHome.getInt(1)==home.getHomeID())
					{
						rsHome.updateString("vision", home.getVision());
						rsHome.updateString("mision", home.getMision());
						rsHome.updateString("historia", home.getHistoria());
						rsHome.updateString("descrip_pag", home.getDescrip_pag());
						rsHome.updateTimestamp("fechaModicacion", home.getFechaModificacion());
						rsHome.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR HOME "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsHome != null){
						rsHome.close();
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

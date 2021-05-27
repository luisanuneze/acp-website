package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Info_Footer;
import entidades.Home;

public class Dt_InfoFooter {
	
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsHome = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
		// Metodo para llenar el ResultSet
		public void llenaRsInfo_Footer(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from info_footer", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsHome = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR DATOS FOOTER "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		
		//Metodo para visualizar opciones de home
		public ArrayList<Info_Footer> listaFooter(){
			ArrayList<Info_Footer> listFooter = new ArrayList<Info_Footer>();
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"info_footer\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Info_Footer foo = new Info_Footer();
					foo.setInfo_footerID(rs.getInt("info_footerID"));
					foo.setTelefono(rs.getString("telefono"));
					foo.setExtension(rs.getString("extension"));
					foo.setDireccion(rs.getString("direccion"));
					foo.setCorreo(rs.getString("correo"));
					foo.setDescripcion(rs.getString("descripcion"));
					listFooter.add(foo);
				}
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR FOOTER "+ e.getMessage());
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
			return listFooter;
		}
		
		// Metodo para visualizar los datos de home específico
		public Home getHome(int homeID)
		{
			Home hom = new Home();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.\"home\" where \"homeid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, homeID);
				rs = ps.executeQuery();
				if(rs.next())
				{
					hom.setHomeID(homeID);
					hom.setMision(rs.getString("mision"));
					hom.setVision(rs.getString("vision"));
					hom.setHistoria(rs.getString("historia"));
					
				}
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR getHome(): "+ e.getMessage());
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
			
			return hom;
		}
		
		// Metodo para modificar home
		public boolean modificarHome(Home home)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsInfo_Footer(c);
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

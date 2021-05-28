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
}

package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entidades.Eventos;
import entidades.Usuario;

public class Dt_Eventos {
	
	//Atributos
	
		PoolConexion pc = PoolConexion.getInstance(); 
		Connection c = null;
		private ResultSet rsEventos = null;
		private ResultSet rs = null;
		private PreparedStatement ps = null;
			
		// Metodo para llenar el RusultSet
			
		public void llenaRsEventos(Connection c){
			try{
				ps = c.prepareStatement("SELECT * from evento", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsEventos = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: ERROR EN LISTAR EVENTOS "+ e.getMessage());
				e.printStackTrace();
			}
		}
		
		//Metodo para visualizar eventos registrados y activos
		
			public ArrayList<Eventos> listaEventosActivos(){
				ArrayList<Eventos> listEvent = new ArrayList<Eventos>();
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"evento\"", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					rs = ps.executeQuery();
					while(rs.next()){
						Eventos eve = new Eventos();
						eve.setEventoid(rs.getInt("eventoid"));
						eve.setUsuarioid(rs.getInt("usuarioid"));
						eve.setNombre(rs.getString("nombre"));
						eve.setDescripcion(rs.getString("descripcion"));
						eve.setTipoevento(rs.getString("tipoevento"));
						eve.setUbicacion(rs.getString("ubicacion"));
						eve.setHipervinculo(rs.getString("hipervinculo"));
						eve.setFechainicio(rs.getTimestamp("fechainicio"));
						eve.setFechafin(rs.getTimestamp("fechafin"));
						eve.setFechaCreacion(rs.getTimestamp("fechacreacion"));
						eve.setEstado(rs.getInt("estado"));
						listEvent.add(eve);
					}
				}
				catch (Exception e){
					System.out.println("DATOS: ERROR EN LISTAR EVENTOS "+ e.getMessage());
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
				return listEvent;
			}
			
			// Metodo para visualizar los datos de un evento en específico
			public Eventos getEventos(int eventoid)
			{
				Eventos eve = new Eventos();
				try
				{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("select * from public.\"evento\" where estado <> 3 and \"eventoid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
					ps.setInt(1, eventoid);
					rs = ps.executeQuery();
					if(rs.next())
					{
						eve.setEventoid(eventoid);
						eve.setNombre(rs.getString("nombre"));
						eve.setDescripcion(rs.getString("descripcion"));
						eve.setTipoevento(rs.getString("tipoevento"));
						eve.setUbicacion(rs.getString("ubicacion"));
						eve.setFechainicio(rs.getTimestamp("fechainicio"));
						eve.setFechafin(rs.getTimestamp("fechafin"));
						eve.setEstado(rs.getInt("estado"));
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
				
				return eve;
			}
			
			//Metodo para almacenar nuevo evento
			public boolean guardarEvent(Eventos eve){
				boolean guardado = false;
				
				try{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);
					rsEventos.moveToInsertRow();
//					rsEventos.updateInt("eventoid", 2);
					rsEventos.updateInt("usuarioid", eve.getUsuarioid());
					rsEventos.updateString("nombre", eve.getNombre());
					rsEventos.updateString("descripcion", eve.getDescripcion());
					rsEventos.updateString("tipoevento", eve.getTipoevento());
					rsEventos.updateString("ubicacion", eve.getUbicacion());
					rsEventos.updateString("hipervinculo", eve.getHipervinculo());
					rsEventos.updateTimestamp("fechainicio", eve.getFechainicio());
					rsEventos.updateTimestamp("fechafin", eve.getFechafin());
					rsEventos.updateTimestamp("fechacreacion", eve.getFechaCreacion());
					rsEventos.updateInt("Estado", 1);
					rsEventos.insertRow();
					rsEventos.moveToCurrentRow();
					guardado = true;
				}
				catch (Exception e) {
					System.err.println("ERROR AL GUARDAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally{
					try {
						if(rsEventos != null){
							rsEventos.close();
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
			
			// Metodo para modificar eventos
			public boolean modificarEvento(Eventos eve)
			{
				boolean modificado=false;	
				try
				{
					c = PoolConexion.getConnection();
					this.llenaRsEventos(c);
					rsEventos.beforeFirst();
					while (rsEventos.next())
					{
						if(rsEventos.getInt(1)==eve.getEventoid())
						{
							rsEventos.updateString("nombre", eve.getNombre());
							rsEventos.updateString("descripcion", eve.getDescripcion());
							rsEventos.updateString("tipoevento", eve.getTipoevento());
							rsEventos.updateString("ubicacion", eve.getUbicacion());
							rsEventos.updateString("hipervinculo", eve.getHipervinculo());
							rsEventos.updateTimestamp("fechainicio", eve.getFechainicio());
							rsEventos.updateTimestamp("fechafin", eve.getFechafin());
							rsEventos.updateTimestamp("fechacreacion", eve.getFechaCreacion());
							rsEventos.updateInt("Estado", 2);
							rsEventos.updateRow();
							modificado=true;
							break;
						}
					}
				}
				catch (Exception e)
				{
					System.err.println("ERROR AL ACTUALIZAR EVENTO "+e.getMessage());
					e.printStackTrace();
				}
				finally
				{
					try {
						if(rsEventos != null){
							rsEventos.close();
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

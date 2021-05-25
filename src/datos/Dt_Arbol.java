package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Arbol;
import entidades.Genero;
import vistas.VW_Arbol;

public class Dt_Arbol {
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsArbol = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsArbol(Connection c){
		try{
			ps = c.prepareStatement("select * from public.arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsArbol = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para listar los arboles
	public ArrayList<VW_Arbol> listaArbol(){
		ArrayList<VW_Arbol> listArbol = new ArrayList<VW_Arbol>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				VW_Arbol ds = new VW_Arbol();
				ds.setID(rs.getInt("iD"));
				ds.setNombreCientifico(rs.getString("nombreCientifico"));
				ds.setNombreComun(rs.getString("nombreComun"));
				ds.setDescripcion(rs.getString("descripcion"));
				ds.setEstado(rs.getInt("estado"));
				ds.setFamilia(rs.getString("familia"));
				ds.setGenero(rs.getString("genero"));
				ds.setEpocaFloracion(rs.getString("epocaFloracion"));
				//ds.setDistribucion(rs.getString("Distribucion"));
				ds.setImagen(rs.getString("foto"));
				listArbol.add(ds);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Arboles "+ e.getMessage());
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
		return listArbol;
	}
	
	
	// Metodo para visualizar los datos de un �rbol espec�fico
	public Arbol getArbol(int arbolID)
	{
		Arbol arb = new Arbol();
		try
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.\"arbol\" where estado <> 3 and \"arbolid\"=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, arbolID);
			rs = ps.executeQuery();
			if(rs.next())
			{
				arb.setArbolId(arbolID);
				arb.setNombrecientifico(rs.getString("nombrecientifico"));
				arb.setNombrecomun(rs.getString("nombrecomun"));
				arb.setDescripcion(rs.getString("descripcion"));
				//arb.setDistribucionID(rs.getInt("distribucionID"));
				arb.setFamiliaID(rs.getInt("familiaID"));
				arb.setGeneroID(rs.getInt("generoID"));
				arb.setFloracionID(rs.getInt("floracionID"));
				arb.setImagen(rs.getString("imagen"));
				
				
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
		
		return arb;
	}
	
	
	
	//Metodo para guardar un arbol
	public boolean guardarArbol(Arbol a){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsArbol(c);
			rsArbol.moveToInsertRow();
			rsArbol.updateString("nombrecientifico", a.getNombrecientifico());
			rsArbol.updateString("nombrecomun", a.getNombrecomun());
			rsArbol.updateString("descripcion", a.getDescripcion());
			//rsArbol.updateInt("distribucionID", a.getDistribucionID());
			rsArbol.updateInt("generoID", a.getGeneroID());
			rsArbol.updateInt("familiaID", a.getFamiliaID());
			rsArbol.updateInt("floracionID", a.getFloracionID());
			rsArbol.updateInt("estado", 1);
			rsArbol.updateTimestamp("fechaCreacion", a.getFechaCreacion());
			rsArbol.insertRow();
			rsArbol.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL guardar Arbol "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsArbol != null){
					rsArbol.close();
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
	
	
	// Metodo para guardar la foto del Arbol
		public boolean guardarFotoArbol(int idArbol, String urlFoto)
		{
			boolean actualizado = false;
			
			try
			{
				c = PoolConexion.getConnection();
				this.llenaRsArbol(c);	
				rsArbol.beforeFirst();
				while(rsArbol.next())
				{
					if(rsArbol.getInt("arbolid")==idArbol)
					{
						
						rsArbol.updateString("imagen", urlFoto);
						rsArbol.updateInt("estado", 2);
						rsArbol.updateRow();
						actualizado = true;
						break;
					}
				}
			}
			catch (Exception e) 
			{
				System.err.println("ERROR AL GUARDAR FOTO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsArbol != null){
						rsArbol.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return actualizado;
		}
	
	
}

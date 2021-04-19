package datos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.RolUsuario;
import entidades.Usuario;
import entidades.VW_RolUsuario;


public class Dt_RolUsuario {
	
	//Atributos
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsRolUser = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	// Metodo para llenar el ResultSet
	public void llenaRsRolUser(Connection c){
		try{
			ps = c.prepareStatement("select * from public.rol_usuario", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsRolUser = ps.executeQuery();
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR rol_usuario "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	//Metodo para listar los Usuarios con Roles asignados
	public ArrayList<VW_RolUsuario> listaRolUser(){
		ArrayList<VW_RolUsuario> listRolUser = new ArrayList<VW_RolUsuario>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_rolusuario", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				VW_RolUsuario rous = new VW_RolUsuario();
				rous.setID(rs.getInt("iD"));
				rous.setUsuario(rs.getString("usuario"));
				rous.setNombres(rs.getString("nombres"));
				rous.setApellidos(rs.getString("apellidos"));
				rous.setRol(rs.getString("rol"));
				listRolUser.add(rous);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR USUARIOS CON ROLES "+ e.getMessage());
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
		return listRolUser;
	}
	
	//Metodo para asignar rol a usuario
	public boolean guardarRolUser(RolUsuario ru){
		boolean guardado = false;
		
		try{
			c = PoolConexion.getConnection();
			this.llenaRsRolUser(c);
			rsRolUser.moveToInsertRow();
			rsRolUser.updateInt("iduser", ru.getUsuarioID());
			rsRolUser.updateInt("idrol", ru.getRolId());
			rsRolUser.updateTimestamp("fechaCreacion", ru.getFechaCreacion());
			rsRolUser.insertRow();
			rsRolUser.moveToCurrentRow();
			guardado = true;
		}
		catch (Exception e) {
			System.err.println("ERROR AL guardar RolUsuario "+e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsRolUser != null){
					rsRolUser.close();
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
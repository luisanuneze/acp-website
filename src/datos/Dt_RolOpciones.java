package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.RolOpciones;
import vistas.VW_RolOpciones;

public class Dt_RolOpciones {

	// Atributos
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRolOpc = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;

	// Metodo para llenar el ResultSet
	public void llenaRsRolOpc(Connection c) {
		try {
			ps = c.prepareStatement("select * from public.rol_opciones", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsRolOpc = ps.executeQuery();
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR Rol_opciones " + e.getMessage());
			e.printStackTrace();
		}
	}

	// Metodo para listar los Roles con Opciones asignadas
	public ArrayList<VW_RolOpciones> listaRolOpc() {
		ArrayList<VW_RolOpciones> listRolOpc = new ArrayList<VW_RolOpciones>();
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.vw_rolopciones", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while (rs.next()) {
				VW_RolOpciones ropc = new VW_RolOpciones();
				ropc.setID(rs.getInt("iD"));
				ropc.setRol(rs.getString("rol"));
				ropc.setOpcion(rs.getString("opcion"));
				listRolOpc.add(ropc);
			}
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR ROLES CON OPCIONES " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (c != null) {
					PoolConexion.closeConnection(c);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return listRolOpc;
	}

	// Metodo para asignar opciones a rol
	public boolean guardarRolOpc(RolOpciones ro) {
		boolean guardado = false;

		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolOpc(c);
			rsRolOpc.moveToInsertRow();
			rsRolOpc.updateInt("iduopc", ro.getOpcionesID());
			rsRolOpc.updateInt("idrol", ro.getRolId());
			rsRolOpc.updateTimestamp("fcreacion", ro.getFechaCreacion());
			rsRolOpc.insertRow();
			rsRolOpc.moveToCurrentRow();
			guardado = true;
		} catch (Exception e) {
			System.err.println("ERROR AL guardar RolOpciones " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rsRolOpc != null) {
					rsRolOpc.close();
				}
				if (c != null) {
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
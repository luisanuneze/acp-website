package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.RolOpciones;
import entidades.RolUsuario;
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
	
	// Metodo para visualizar los datos de un usuario específico
		public RolOpciones getRolOpciones(int rol_opcionesID) {
			RolOpciones ro = new RolOpciones();
			try {

				System.out.println("Hasta aca todo bien");

				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.rol_opciones where rol_opcionesid=?",
						ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, rol_opcionesID);
				rs = ps.executeQuery();
				System.out.println("Ya hizo el select");
				if (rs.next()) {
					ro.setRol_opcionesID(rol_opcionesID);
					ro.setRolId(rs.getInt("rolId"));
					ro.setOpcionesID(rs.getInt("opcionesID"));
					ro.setFechaCreacion(rs.getTimestamp("fechaCreacion"));
					ro.setFechaModificacion(rs.getTimestamp("fechaModoficacion"));
					ro.setFechaEliminacion(rs.getTimestamp("fechaEliminacion"));
					System.out.println("Ya te deberia de aparecer wtf");
				}
			} catch (Exception e) {
				System.out.println("DATOS ERROR getNIMA(): " + e.getMessage());
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

			return ro;
		}

	// Metodo para asignar opciones a rol
	public boolean guardarRolOpc(RolOpciones ro) {
		boolean guardado = false;

		try {
			c = PoolConexion.getConnection();
			this.llenaRsRolOpc(c);
			rsRolOpc.moveToInsertRow();
			rsRolOpc.updateInt("opcionesId", ro.getOpcionesID());
			rsRolOpc.updateInt("rolId", ro.getRolId());
			rsRolOpc.updateTimestamp("fechaCreacion", ro.getFechaCreacion());
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
package entidades;

import java.sql.Timestamp;

public class Usuario {
	
	//Atributos
	private int UsuarioID;
	private String Usuario;
	private String Contrasenia;
	private String Nombres;
	private String Apellidos;
	private String Email;
	private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int estado;
	
	//Metodos
	public int getUsuarioID() {
		return UsuarioID;
	}
	public void setUsuarioID(int UsuarioID) {
		this.UsuarioID = UsuarioID;
	}
	public String getUsuario() {
		return Usuario;
	}
	public void setUsuario(String Usuario) {
		this.Usuario = Usuario;
	}
	public String getContrasenia() {
		return Contrasenia;
	}
	public void setContrasenia(String Contrasenia) {
		this.Contrasenia = Contrasenia;
	}
	public String getNombres() {
		return Nombres;
	}
	public void setNombre(String Nombres) {
		this.Nombres = Nombres;
	}
	public String getApellidos() {
		return Apellidos;
	}
	public void setApellido(String Apellidos) {
		this.Apellidos = Apellidos;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public Timestamp getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(Timestamp fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public Timestamp getFechaEliminacion() {
		return fechaEliminacion;
	}
	public void setFechaEliminacion(Timestamp fechaEliminacion) {
		this.fechaEliminacion = fechaEliminacion;
	}
	public String Email() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	
	

}
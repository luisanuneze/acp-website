package entidades;

import java.sql.Timestamp;

public class Eventos {

	private int eventoid;
	private int usuarioid;
	private String nombre;
	private String descripcion;
	private String tipoevento;
	private String ubicacion;
	private String hipervinculo; // ??, revisar
	private Timestamp fechainicio;
	private Timestamp fechafin;
	private Timestamp fechaCreacion;
	private Timestamp fechaModificacion;
	private Timestamp fechaEliminacion;
	private int estado;
	
	//Metodos
	public int getEventoid() {
		return eventoid;
	}
	public void setEventoid(int eventoid) {
		this.eventoid = eventoid;
	}
	public int getUsuarioid() {
		return usuarioid;
	}
	public void setUsuarioid(int usuarioid) {
		this.usuarioid = usuarioid;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getTipoevento() {
		return tipoevento;
	}
	public void setTipoevento(String tipoevento) {
		this.tipoevento = tipoevento;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	public String getHipervinculo() {
		return hipervinculo;
	}
	public void setHipervinculo(String hipervinculo) {
		this.hipervinculo = hipervinculo;
	}
	public Timestamp getFechainicio() {
		return fechainicio;
	}
	public void setFechainicio(Timestamp fechainicio) {
		this.fechainicio = fechainicio;
	}
	public Timestamp getFechafin() {
		return fechafin;
	}
	public void setFechafin(Timestamp fechafin) {
		this.fechafin = fechafin;
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
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}

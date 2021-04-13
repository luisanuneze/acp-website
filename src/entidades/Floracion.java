package entidades;

public class Floracion {
	
	//Atributos
	private int FloracionID;
	private String Nombre;
	private String Descripcion;
	private String Temporada;
	private int Estado;
	
	//Metodos
	public int getFloracionID() {
		return FloracionID;
	}
	public void setFloracionID(int floracionID) {
		FloracionID = floracionID;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public String getTemporada() {
		return Temporada;
	}
	public void setTemporada(String temporada) {
		Temporada = temporada;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}

}

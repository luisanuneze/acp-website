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

}

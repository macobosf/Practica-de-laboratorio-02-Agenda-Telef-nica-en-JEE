package ec.edu.ups.modelo;

public class Telefono {
	private int id;
	private String nombre;
	private String telefono;
	private String operadora;
	private String info;
	private int usuarioId;
	
	public Telefono() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Telefono(String nombre, String telefono, String operadora, String info, int usuarioId) {
		super();
		this.nombre = nombre;
		this.telefono = telefono;
		this.operadora = operadora;
		this.info = info;
		this.usuarioId = usuarioId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getOperadora() {
		return operadora;
	}

	public void setOperadora(String operadora) {
		this.operadora = operadora;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}
		
}

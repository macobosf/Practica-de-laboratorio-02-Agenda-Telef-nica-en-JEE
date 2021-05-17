package ec.edu.ups.modelo;

public class Telefono {
	private int id;
	private String numero;
	private String tipo;
	private String operadora;
	private String cedula;
	
	public Telefono() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Telefono(String numero, String tipo, String operadora, String cedula) {
		super();
		this.numero = numero;
		this.tipo = tipo;
		this.operadora = operadora;
		this.cedula = cedula;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getOperadora() {
		return operadora;
	}

	public void setOperadora(String operadora) {
		this.operadora = operadora;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	
}

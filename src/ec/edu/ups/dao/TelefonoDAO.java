package ec.edu.ups.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import ec.edu.ups.modelo.Telefono;

public class TelefonoDAO {

	private Connection conn;

	public TelefonoDAO(Connection conn) {
		super();
		this.conn = conn;
	};
	
	public boolean guardarTelefono(Telefono t){
		boolean f=false;
		try {
			String sql = "insert into telefono(numero, tipo, operadora, fk_cedula) values(?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t.getNumero());
			ps.setString(2, t.getTipo());
			ps.setString(3, t.getOperadora());
			ps.setString(4, t.getCedula());	
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}

package ec.edu.ups.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Telefono> getAllTelefono(String c){
		
		List<Telefono> list = new ArrayList<Telefono>();
		Telefono t=null;
		
		try {
			String sql = "select * from telefono where fk_cedula=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				 t = new Telefono();
				 t.setId(rs.getInt(1));
				 t.setNumero(rs.getString(2));
				 t.setTipo(rs.getString(3));
				 t.setOperadora(rs.getString(4));
				 list.add(t);
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return list;
		
	}
	
}

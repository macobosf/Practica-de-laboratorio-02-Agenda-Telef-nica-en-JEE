package ec.edu.ups.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ec.edu.ups.modelo.Usuario;

public class UsuarioDAO {
	private Connection conn;

	public UsuarioDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegistrer(Usuario u) {
		
		boolean f=false;
		try {
			String sql = "insert into usuario(cedula, nombre, apellido, correo, contrasenia) values(?,?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getCedula());
			ps.setString(2, u.getNombre());
			ps.setString(3, u.getApellido());
			ps.setString(4, u.getCorreo());
			ps.setString(5, u.getContrasenia());
			
			int i=ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
public Usuario loginUser(String e, String p) {
	
		Usuario user = null;
		
		try {
			String sql = "select * from usuario where correo=? and contrasenia=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				user=new Usuario();
				user.setCedula(rs.getString(1));
				user.setNombre(rs.getString(2));
				user.setApellido(rs.getString(3));
				user.setCorreo(rs.getString(4));
				user.setContrasenia(rs.getString(5));
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return user;
		
	}
	
}

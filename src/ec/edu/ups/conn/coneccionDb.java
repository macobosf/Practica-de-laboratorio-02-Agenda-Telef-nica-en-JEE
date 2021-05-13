package ec.edu.ups.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class coneccionDb {
	
	private static Connection conn;

	public static Connection getConn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/agenda", "root", "cuenca.123");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}

	public static void setConn(Connection conn) {
		coneccionDb.conn = conn;
	}
	
	
	

}

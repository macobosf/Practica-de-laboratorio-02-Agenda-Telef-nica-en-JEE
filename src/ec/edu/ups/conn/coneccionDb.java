package ec.edu.ups.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class coneccionDb {

	private static Connection conn;

	public static Connection getConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hola_mundo", "root", "cuenca.123");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;

	}

}

package ec.edu.ups.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.UsuarioDAO;
import ec.edu.ups.modelo.Usuario;
import ec.edu.ups.conn.coneccionDb;

/**
 * Servlet implementation class RegistrarseServlet
 */
@WebServlet("/registrar")
public class RegistrarseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cedula=request.getParameter("cedula");
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellido");
		String correo=request.getParameter("correo");
		String contrasenia=request.getParameter("contrasenia");
		
		Usuario u = new Usuario(cedula, nombre, apellido, correo, contrasenia);
		
		UsuarioDAO dao = new UsuarioDAO (coneccionDb.getConn());
		boolean f=dao.userRegistrer(u);
		
		if (f) {
			System.out.println("Usuario registrado de manera exitosa...");
		} else {
			System.out.println("Error en el servidor...");
		}
	}

}

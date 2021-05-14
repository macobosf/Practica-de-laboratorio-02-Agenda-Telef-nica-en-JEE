package ec.edu.ups.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ec.edu.ups.dao.UsuarioDAO;
import ec.edu.ups.modelo.Usuario;
import ec.edu.ups.conn.coneccionDb;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String correo = request.getParameter("correo");
		String contra = request.getParameter("contrasenia");
		
		//System.out.println(correo +" "+ contra);
		
		UsuarioDAO dao = new UsuarioDAO(coneccionDb.getConn());
		Usuario u = dao.loginUser(correo, contra);
		HttpSession session = request.getSession();
		if(u != null) {
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
			//System.out.println("Usuario Correcto " + u);
		}else {
			session.setAttribute("invalidMsg", "Correo o Contraseña Incorrectos");
			response.sendRedirect("login.jsp");
			//System.out.println("Usuario o Contraseña Incorrecta " + u);
		}
		
	}

}

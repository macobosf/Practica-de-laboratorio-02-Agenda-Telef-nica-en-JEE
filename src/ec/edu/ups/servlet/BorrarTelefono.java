package ec.edu.ups.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ec.edu.ups.conn.coneccionDb;
import ec.edu.ups.dao.TelefonoDAO;

/**
 * Servlet implementation class BorrarTelefono
 */
@WebServlet("/borrar")
public class BorrarTelefono extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarTelefono() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tid=Integer.parseInt(request.getParameter("tid"));
		TelefonoDAO dao = new TelefonoDAO(coneccionDb.getConn());
		
		boolean f=dao.eliminarTelefono(tid);
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Telefono Borrado Correctamente");
			response.sendRedirect("verTelefonos.jsp");
		}else {
			session.setAttribute("failMsg", "Error al eliminar telefono");
			response.sendRedirect("verTelefonos.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

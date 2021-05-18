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
import ec.edu.ups.modelo.Telefono;

/**
 * Servlet implementation class EditarServlet
 */
@WebServlet("/actualizar")
public class EditarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarServlet() {
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
		
		int tid = Integer.parseInt(request.getParameter("tid"));
		String numero = request.getParameter("numero");
		String tipo = request.getParameter("tipo");
		String operadora = request.getParameter("operadora");
		
		Telefono t = new Telefono();
		t.setId(tid);
		t.setNumero(numero);
		t.setTipo(tipo);
		t.setOperadora(operadora);
		
		TelefonoDAO dao = new TelefonoDAO(coneccionDb.getConn());
		HttpSession session = request.getSession();		
		boolean f=dao.updateTelefono(t);
		
		if(f) {
			session.setAttribute("succMsg", "Telefono Actualizado");
			response.sendRedirect("verTelefonos.jsp");
		} else {
			session.setAttribute("failMsg", "Error al Actualizar");
			response.sendRedirect("editarTel.jsp");
		}
		
	}

}

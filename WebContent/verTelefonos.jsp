<%@page import="ec.edu.ups.modelo.Telefono"%>
<%@page import="java.util.List"%>
<%@page import="ec.edu.ups.conn.coneccionDb"%>
<%@page import="ec.edu.ups.dao.TelefonoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ver Telefonos</title>
<%@include file="Componentes/estilos.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>

</head>
<body>
	<%@include file="Componentes/navbar.jsp"%>
	<nav class="navbar navbar-light bg-light">
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
		</form>
	</nav>


	<%
		if (user == null) {
		session.setAttribute("invalidMsg", "Inicie sesion o registrese para continuar.");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
		String succMsg = (String) session.getAttribute("succMsg");
	String failMsg = (String) session.getAttribute("failMsg");
	if (succMsg != null) {
	%>
	<div class="alert alert-warning" role="alert">Borrado Exitoso</div>
	<%
		session.removeAttribute("succMsg");
	}
	if (failMsg != null) {
	%>
	<p class="text-danger text-center"><%=failMsg%>
	</p>
	<%
		session.removeAttribute("failMsg");
	}
	%>

	<div class="container">
		<div class="row p-4">


			<%
				if (user != null) {

				TelefonoDAO dao = new TelefonoDAO(coneccionDb.getConn());
				List<Telefono> telefono = dao.getAllTelefono(user.getCedula());

				for (Telefono t : telefono) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							<%=user.getNombre()%>
							<%=user.getApellido()%>
						</h5>
						<p>
							Numero:
							<%=t.getNumero()%></p>
						<p>
							Tipo:
							<%=t.getTipo()%></p>
						<p>
							Operadora:
							<%=t.getOperadora()%></p>
						<div class="text-center">
							<a href="editarTel.jsp?tid=<%=t.getId()%>"
								class="btn btn-success btn-sm text-white">Editar</a> <a
								href="borrar?tid=<%=t.getId()%>"
								class="btn btn-danger btn-sm text-white">Eliminar</a> <a
								class="btn btn-secondary btn-sm text-white"
								href="tel:<%=t.getNumero()%>>">Llamar</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			}
			%>



		</div>
	</div>

	<%@include file="Componentes/footer.jsp"%>

</body>
</html>
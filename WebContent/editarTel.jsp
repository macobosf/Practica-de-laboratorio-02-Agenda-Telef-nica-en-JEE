<%@page import="ec.edu.ups.modelo.Telefono"%>
<%@page import="ec.edu.ups.conn.coneccionDb"%>
<%@page import="ec.edu.ups.dao.TelefonoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Telefono</title>
<%@include file="Componentes/estilos.jsp" %>
</head>
<body>
	<%@include file="Componentes/navbar.jsp" %>
	<%
		if (user == null) {
		session.setAttribute("invalidMsg", "Inicie sesion o registrese para continuar.");
		response.sendRedirect("login.jsp");
	}
	%>
	
	<div class="conatiner-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Añadir Numero Telefono</h4>

						<%
						String succMsg = (String) session.getAttribute("succMsg");
						String failMsg = (String) session.getAttribute("failMsg");

						if (succMsg != null) {
						%>
						<p class="text-success text-center"><%=succMsg%></p>
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

						<form action="actualizar" method="post">

							<%
								int tid = Integer.parseInt(request.getParameter("tid"));
								TelefonoDAO dao= new TelefonoDAO(coneccionDb.getConn());
								Telefono t = dao.getTelefonoByID(tid);
							%>
							
							<input type="hidden" value="<%=tid %>" name="tid">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Numero
								</label> <input value="<%=t.getNumero() %>" name="numero" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Operadora
								</label> <input value="<%=t.getOperadora() %>" name="operadora" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Tipo
								</label> <input value="<%=t.getTipo() %>"name="tipo" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Actualizar Telefono</button>
								<a href="verTelefonos.jsp" type="button" class="btn btn-primary">Cancelar</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 80px">
		<%@include file="Componentes/footer.jsp"%>
	</div>
	

</body>
</html>
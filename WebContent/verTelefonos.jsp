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
<title>Insert title here</title>
<%@include file="Componentes/estilos.jsp"%>
<style type="text/css">
.crd-ho:hover{
	background-color: #f7f7f7;
	
}

</style>

</head>
<body>
	<%@include file="Componentes/navbar.jsp"%>

	<%
		if (user == null) {
		session.setAttribute("invalidMsg", "Inicie sesion o registrese para continuar.");
		response.sendRedirect("login.jsp");
	}
	%>
	
	<div class="container">
		<div class="row p-4">
			<div class="col-md-3">
			
				<%
				
				if (user != null) {
				
				TelefonoDAO dao = new TelefonoDAO(coneccionDb.getConn());
				List<Telefono> telefono = dao.getAllTelefono(user.getCedula());
				
				for (Telefono t : telefono)
				{%>
					
				<div class="card crd-ho">
					<div class="card-body">
						<h5> <%=user.getNombre()%> <%=user.getApellido()%> </h5>
						<p>Numero: <%= t.getNumero()%></p>
						<p>Tipo: <%= t.getTipo()%></p>
						<p>Operadora: <%= t.getOperadora()%></p>
						<div class="text-center">
							<a class="btn btn-success btn-sm text-white">Editar</a>
							<a class="btn btn-danger btn-sm text-white">Eliminar</a>
						</div>
					</div>
				</div>
					
				<%
				}
				}
				%>
			
				
			</div>
		</div>
	</div>
	
</body>
</html>
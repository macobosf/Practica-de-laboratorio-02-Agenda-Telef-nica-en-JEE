<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Añadir Telefono</title>
<%@include file="Componentes/estilos.jsp"%>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="Componentes/navbar.jsp"%>
	<%
		if (user == null) {
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
						<p class="text-danger text-center"><%=failMsg%>>
						</p>
						<%
							session.removeAttribute("failMsg");
						}
						%>

						<form action="agregar" method="post">

							<%
								if (user != null) {
							%>
							<input type="hidden" value="<%=user.getCedula()%>" name="cedula" />
							<%
								}
							%>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Numero
								</label> <input name="numero" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Operadora
								</label> <input name="operadora" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Tipo
								</label> <input name="tipo" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="text-center mt-2">
								<button type="submit" class="btn btn-success">Añadir
									Telefono</button>
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
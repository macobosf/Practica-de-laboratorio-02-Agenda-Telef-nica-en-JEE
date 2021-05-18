<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logins</title>
<%@include file="Componentes/estilos.jsp"%>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="Componentes/navbar.jsp"%>
	<div class="conatiner-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Iniciar Sesión</h4>

						<%
							String invalidMsg = (String) session.getAttribute("invalidMsg");
						if (invalidMsg != null) {
						%>
						<p class="text-danger text-center">
							<%=invalidMsg%>
						</p>
						<%
							session.removeAttribute("invalidMsg");
						}
						%>

						<%
							String logMsg = (String) session.getAttribute("logMsg");
						if (logMsg != null) {
						%>
						<p class="text-success text-center">
							<%=logMsg%>
						</p>
						<%
							session.removeAttribute("logMsg");
						}
						%>

						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Correo
									Electronico</label> <input name="correo" type="email"
									class="form-control" id="email" aria-describedby="emailHelp">
								<span id="emailOK"></span>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Contraseña</label>
								<input name="contrasenia" type="password" class="form-control"
									id="txtPassword">
								<button id="show_password" class="btn btn-primary" type="button"
									onclick="mostrarPassword()">
									<span class="fa fa-eye-slash icon"></span>
								</button>
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function mostrarPassword() {
			var cambio = document.getElementById("txtPassword");
			if (cambio.type == "password") {
				cambio.type = "text";
				$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
			} else {
				cambio.type = "password";
				$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
			}
		}

		document
				.getElementById('email')
				.addEventListener(
						'input',
						function() {
							campo = event.target;
							valido = document.getElementById('emailOK');

							emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
							//Se muestra un texto a modo de ejemplo, luego va a ser un icono
							if (emailRegex.test(campo.value)) {

								//valido.innerText = "válido";
								valido.innerHTML = "<span style='color: #a1cc1b'>Correo Valido</span>"
								//valido.innerHTML = "<style: color: #a1cc1b>" + "valido" + "</style>";
							} else {
								//valido.innerText = "incorrecto";
								//valido.innerHTML = "<style: color: #d9cc00>" + "invalido" + "</style>";
								valido.innerHTML = "<span style='color: #ed1b24'>Correo Incorrecto</span>"
							}
						});
	</script>

	<div style="margin-top: 140px">
		<%@include file="Componentes/footer.jsp"%>
	</div>


</body>
</html>
</html>
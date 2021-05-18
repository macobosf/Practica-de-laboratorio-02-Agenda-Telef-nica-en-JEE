<%@page import="ec.edu.ups.modelo.Usuario"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i
		class="fas fa-phone-square-alt"> </i> Agenda Telefonica</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">


		<%
			Usuario user = (Usuario) session.getAttribute("user");
		if (user == null) {
		%>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-home"> </i> Inicio <span class="sr-only">(current)</span>
			</a></li>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="far fa-user"> </i> Iniciar Sesión</a> <a href="registro.jsp"
				class="btn btn-danger ml-2"><i class="fas fa-users"> </i>
				Registrarse</a>
		</form>

		<%
			} else {
		%>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-home"> </i> Inicio <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="anadirTelefono.jsp"><i class="fas fa-plus-square"> </i>
					Añadir Numero de Telefono</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="verTelefonos.jsp"><i class="fas fa-eye"> </i> Ver Numeros
					de Telefono</a></li>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			
			<button class="btn btn-success"><%=user.getNombre()%>
				<%=user.getApellido()%>
			</button>
			
			<a class="btn btn-secondary btn-sm text-white ml-2" 
			href="mailto:<%=user.getCorreo()%>">Enviar Correo</a>
			
			<a data-toggle="modal" data-target="#exampleModalCenter" href="salir"
				class="btn btn-danger ml-2">Salir</a>
			
		</form>
		<%
			}
		%>

	</div>

	<!-- Cerrar Sesion -->

	

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Confirmar</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
				<h6>Seguro que decea Salir</h6>
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">Regresar</button>
					<a href="salir" type="button" class="btn btn-danger">Salir</a>
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>

</nav>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Componentes/estilos.jsp"%>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="Componentes/navbar.jsp"%>
	<div class="conatiner-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-success">Iniciar Sesi�n</h4>
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Correo 
								Electronico</label> <input name="correo" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">	
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Contrase�a</label>
								<input name="contrasenia" type="password" class="form-control"
									id="exampleInputPassword1">
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
	
<div style="margin-top: 140px">
<%@include  file="Componentes/footer.jsp"%>
</div>


</body>
</html></html>
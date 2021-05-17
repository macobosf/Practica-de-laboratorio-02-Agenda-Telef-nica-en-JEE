<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Componentes/estilos.jsp"%>
</head>
<body>
	<%@include file="Componentes/navbar.jsp"%>

	<%
		if (user == null) {
		session.setAttribute("invalidMsg", "Inicie sesion o registrese para continuar.");
		response.sendRedirect("login.jsp");
	}
	%>

</body>
</html>
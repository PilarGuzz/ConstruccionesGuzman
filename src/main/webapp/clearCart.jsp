<%@page import="com.jacaranda.models.Carrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vaciar carrito</title>
</head>
<body>
<%
Carrito carro = (Carrito) session.getAttribute("carrito");
carro.getArticulos().clear();
response.sendRedirect("cart.jsp");
%>

</body>
</html>
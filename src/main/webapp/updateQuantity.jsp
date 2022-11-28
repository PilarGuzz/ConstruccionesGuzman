<%@page import="com.jacaranda.models.Carrito"%>
<%@page import="com.jacaranda.models.ItemCarrito"%>
<%@page import="com.jacaranda.models.Material"%>
<%@page import="com.jacaranda.models.CRUDMaterial"%>
<%@page import="com.jacaranda.models.ItemCarrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>

<% 
	Carrito carrito= (Carrito) session.getAttribute("carrito");
	Integer newCantidad = Integer.valueOf(request.getParameter("cantidad"));
	Integer materialId = Integer.valueOf(request.getParameter("materialId")); 
	
	carrito.getArticulos();
	
	Material mat = CRUDMaterial.getMaterial(materialId);
	
	ItemCarrito item = new ItemCarrito(mat, newCantidad);

	carrito.addItem(item);%>



	<jsp:forward page="cart.jsp"></jsp:forward>

</body>
</html>
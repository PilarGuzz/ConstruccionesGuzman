<%@page import="com.jacaranda.models.Carrito"%>
<%@page import="com.jacaranda.models.ItemCarrito"%>
<%@page import="com.jacaranda.models.Material"%>
<%@page import="com.jacaranda.models.CRUDMaterial"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCarrito</title>
</head>
<body>
<%
	
	HttpSession userSession = request.getSession();
	Carrito carro = (Carrito) userSession.getAttribute("carrito");
	
	int cantidad = Integer.valueOf(request.getParameter("cantidad"));
	int materialCode = Integer.valueOf(request.getParameter("materialCode"));
	
	Material mat = CRUDMaterial.getMaterial(materialCode);
	ItemCarrito itemCarro = new ItemCarrito(mat, cantidad);
	
	
	if(!carro.getArticulos().contains(itemCarro)){
		carro.addMaterial(itemCarro);
		
	}
	
	ServletContext context =  this.getServletContext();
	RequestDispatcher dispatcher = context.getRequestDispatcher ("/Login");
	dispatcher.forward(request, response);
	


%>

</body>
</html>
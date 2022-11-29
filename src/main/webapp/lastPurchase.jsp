<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.jacaranda.models.CRUDPurchase"%>
<%@page import="com.jacaranda.models.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>
<%@page import="com.jacaranda.models.Carrito"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="CSS/tablePage.css">
<title>Mis compras</title>
</head>
<%
 	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("usuario");
	Carrito carrito= (Carrito) session.getAttribute("carrito");
	
	if(isSession == null && userSession == null){
		response.sendRedirect("error.jsp?msg=No tienes permisos, haz login.");
		
	}  
%>

<body background="images/fondoBrick.jpg">
<div id="header">
	<div class="logo">
		<img src="images/logo2.png" width="160px" height="120px" id="logo">
	</div>
	<div class="name">
		<img src="images/name.png" width="100%">
	</div>
	<div class="sesion">
		<a href="index.jsp"><button  name="close" value="close" class="button close">Cerrar Sesion</button></a>
		<p>User:<%=userSession %></p>
	</div>
</div> 
<hr>

	<div>
		<table>
		
		
			<tr>
				
				<th>Fecha</th>
				<th>Artículo</th>
				<th>Cantidad</th>
				<th>Precio</th>
						
			</tr>
			
		
		<%
		
		List<Purchase> listPurchase = CRUDPurchase.getListPurchase(userSession);
		
		for(Purchase p : listPurchase){
						
		%>
			<tr>
				<td><%=DateTimeFormatter.ISO_LOCAL_DATE.format(p.getDate())+"   "+ DateTimeFormatter.ISO_LOCAL_TIME.format(p.getDate())%>
				<td><%=p.getMaterial().getName()%></td>
				<td><%=p.getQuantity()%>
				<td><%=Math.floor(p.getTotalPrice() * 100) / 100%>
				
			</tr>
			
			 
		<%
		}
		%>
		
		
		</table>
		<br>
		<form method="post" action="Login">
			<p>
				<button name="Back" value="back" type="submit" class="button">Volver
				</button>
			</p>

		</form>
	</div>

</body>
</html>
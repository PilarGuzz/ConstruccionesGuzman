<%@page import="com.jacaranda.models.ItemCarrito"%>
<%@page import="com.jacaranda.models.Carrito"%>
<%@page import="java.lang.Math"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<link rel="stylesheet" type="text/css" href="CSS/tablePage.css">
</head>
<%
String isSession = (String) session.getAttribute("login");
String userSession = (String) session.getAttribute("usuario");
Carrito carro = (Carrito) session.getAttribute("carrito");

if (isSession == null && userSession == null) {
	response.sendRedirect("error.jsp?msg=No tienes permisos, haz login.");
}
Double price = 0.0;
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
				<th>Nombre</th>
				<th>Category</th>
				<th>Description</th>
				<th>cantidad</th>
				<th>Precio</th>
				<th>Imagen</th>
				<th>TOTAL</th>
			</tr>

			<%
			for (ItemCarrito item : carro.getArticulos()) {
			%>
			<tr>
				<td><%=item.getArticulo().getName()%></td>
				<td><%=item.getArticulo().getCategory().getName()%></td>
				<td><%=item.getArticulo().getDescription()%></td>
				<td><%=item.getCantidad()%>

					<form action="updateQuantity.jsp" method="POST">
						<input type="number" name="cantidad" id="cantidad" min=1 max=<%=item.getCantidad()%>>
						<input type="hidden" value=<%=item.getArticulo().getCode()%>
							name="materialId">
						<button type="submit" name="modificar" id="modificar"
							value="modificar">Modificar Cantidad</button>
					</form></td>
				<td><%=Math.floor(item.getTotalPrice() * 100) / 100%></td>
				<td>
					<%
					if (item.getArticulo().getImg() == null) {
					%> <img src="images/noIMG.jpg" width="80px" height="80px"> <%
 					} else {
 					%> <%=item.getArticulo().getImg()%>
					<%
					}
					%>
				</td>
			</tr>
			<%
			price = price + item.getTotalPrice();
			%>
			<%
			}
			%>
			<tr>
				<td colspan="6">PRECIO TOTAL</td>
				<td><%=Math.floor(price * 100) / 100%>
					<form action="buy.jsp" method="post">
						<button type="submit">Comprar</button>
					</form></td>
			</tr>
		</table>
		<a href="clearCart.jsp"><button type="submit" name="clear" id='clear' class="button">Vaciar carrito</button></a>
		<form method="post" action="Login">
			<p>
				<button name="Back" value="back" type="submit" class="button">Volver
				</button>
			</p>

		</form>
		</div>
		
</body>
</html>
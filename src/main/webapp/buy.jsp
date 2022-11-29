<%@page import="com.jacaranda.models.CRUDPurchase"%>
<%@page import="com.jacaranda.models.CRUDMaterial"%>
<%@page import="com.jacaranda.models.Material"%>
<%@page import="com.jacaranda.models.User"%>
<%@page import="com.jacaranda.models.LoginUtils"%>
<%@page import="com.jacaranda.models.Purchase"%>
<%@page import="java.util.List"%>
<%@page import="com.jacaranda.models.ItemCarrito"%>
<%@page import="com.jacaranda.models.Carrito"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compra</title>
</head>
<body>

<%
	Carrito carrito = (Carrito) session.getAttribute("carrito");
	String usuario = (String) session.getAttribute("usuario");
	
	
	List<ItemCarrito> listCarrito = carrito.getArticulos();
	User user = LoginUtils.getUser(usuario);
	
	/*Por cada articulo del carrito:*/
	for(ItemCarrito item : listCarrito){
		/*Crea un objeto Purchase con el usuario, el material, el precio y la cantidad.
		Y un objeto material por cada item del carrito*/
		Purchase purchase = new Purchase(user, item.getArticulo(), item.getPrice(), item.getCantidad());
		Material mat = item.getArticulo();
		
		/*Definimos el stock final tras la compra y lo cambiamos al objeto mat por el metodo set
		Actualizamos el objeto(nuevo stock) en la base de datos con updateMAterial
		Guardamos la compra en base de datos*/
		int stock = mat.getStock() - item.getCantidad();
		mat.setStock(stock);
		CRUDMaterial.updateMaterial(mat);
		CRUDPurchase.savePurchase(purchase);
		
	}
	
	carrito.getArticulos().clear();

	%>
	<form method="post" action="Login">
		<p><button name="Back" value="back" type="submit" class="button">Volver </button></p>
	
	</form>	
	
	<jsp:forward page="Login" ></jsp:forward>

</body>
</html>
<%@page import="com.jacaranda.models.CRUDCategory"%>
<%@page import="com.jacaranda.models.Category"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista</title>
<link rel="stylesheet" type="text/css" href="CSS/generalStyle.css">
</head>
<body background="images/fondoBrick.jpg">
	<div id="header">
    	<img src="images/logo2.png" width="140px" height="100px" id="logo">
        <br>
        <hr>
    </div>
    <div id="contenido">
				<form action="addMaterialMethod.jsp" method="GET" id="annadirCarForm">
		<h1>Añadir Material a la venta: </h1>
					
		<!-- POR HACER -->		
		<fieldset style="width:fit-content" class="opacidad">
			<legend id="legends"><b>Rellene los siguientes datos: </b></legend>
					Nombre: <input type="text" name="nameMaterial" min=1800 required><br>
					<br>
					Descripcion: <input type="text" name="descriptionMaterial" min=1800 required><br>
					<br>
					Categoria:
					<select id="cat">
					<% ArrayList<Category> categoryList = CRUDCategory.getCategories(); 
						for(Category cate : categoryList){
							%>
							<option name="category" value="<%=cate.getCode()%>"><%=cate.getName()%></option>
						<%}%>
						
					</select>
					<br>
					<br>
					Precio: <input type="number" step="any" id="" name="price" min=1 max=300 required><br>
					<br>
					
					<input type="submit">
					
		
		</fieldset>
	</form>
	<form method="post" action="Login">
			<p><button name="Back" value="back" type="submit">Volver </button></p>
	
	</form>				
				
		
    </div>           
</body>
</html>
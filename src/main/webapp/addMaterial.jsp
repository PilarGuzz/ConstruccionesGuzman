<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista</title>
</head>
<body>
	<div id="header">
       
        <hr>
    </div>
    <div id="contenido">
				<form action="addCarMethod.jsp" method="GET" id="annadirCarForm">
		<h1>A�adir Material a la venta: </h1>
					
		<!-- POR HACER -->		
		<fieldset style="width:fit-content">
			<legend id="legends"><b>Rellene los siguientes datos: </b></legend>
					Nombre: <input type="text" name="nameMaterial" min=1800 required><br>
					<br>
					Descripcion: <input type="text" name="descriptionMaterial" min=1800 required><br>
					<br>
					Categoria:
					<option>
						<select></select>
					</option>
					<br>
					Precio: <input type="number" step="any" id="" name="price" min=1 max=500000 required><br>
					<br>
					
		
		</fieldset>
					</form>
			<p><a href="Login" ><button name="Back" id="addButton" value="back">Volver </button></a></p>
				
		
    </div>           
</body>
</html>
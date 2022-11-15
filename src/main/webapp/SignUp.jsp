<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/generalStyle.css">
</head>
<body>

	<div align="center">
		<form action="SignUp" method="POST" id="addUser">			
		
			<h3>Rellene los siguientes datos:</h3>
			<label for="username">Username: </label>
			<input type="text" name="username" id="username" required><br>
			
			<label for="password">Password: </label>
			<input type="password" name="password"  id="password" required minlength="6" maxlenght="12"><br>
					
			<label for="first_name">First name:</label>
			<input type="text" name="first_name" id="first_name" required><br>
						
			<label for="last_name">Last name:</label>
			<input type="text" name="last_name" id="last_name" required><br>
					
			<label for="date">Fecha de nacimiento: </label>
			<input type="date" name="date" required><br><br>
					
			<label for="gender">Género: </label>
			<label for="gender">Hombre </label>
			<input type="radio" name="gender" value="H" required>
			<label for="gender">Mujer </label> 
			<input type="radio" name="gender" value="M" required><br>
					
					
					
					<br>
					<button type="submit" id="loginButton" class="login_button">Enviar</button>
					<button type="reset" id="resetButton" class="login_button">Borrar</button>
					<button onclick="location.href='index.jsp'" value="Volver al Inicio" />Inicio</button>
		
		
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<form action="SignUp" method="POST" id="addUser">			
		
			<h3>Rellene los siguientes datos:</h3>
			
					Username: <input type="text" name="username" id="username" required><br>
					
					Password: <input type="password" name="password"  id="password" required><br>
					
					First name:<input type="text" name="first_name" id="first_name" required>
					
					
					Last name:<input type="text" name="last_name" id="last_name" required>
					
					Fecha de nacimiento: <input type="date" name="date" required><br>
					
					Género: Hombre<input type="radio" name="gender" value="H" required>
					Mujer <input type="radio" name="gender" value="M" required>
					
					
					
					<br>
					<button type="submit" id="loginButton" class="login_button">Enviar</button>
					<button type="reset" id="resetButton" class="login_button">Borrar</button>
					<button onclick="location.href='index.jsp'" value="Volver al Inicio" />Inicio</button>
		
		
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/generalStyle.css">
</head>
<body background="images/fondoBrick.jpg">
<div id="header">
    	<a href="index.jsp"><img src="images/logo2.png" width="140px" height="100px" id="logo"></a>
        <br>
        <hr>
    </div>

	<div align="center">
	<h1>Registrate</h1>
		<form action="SignUp" method="POST" id="addUser">
			<fieldset style="width: fit-content" class="opacidad">
				<legend id="legends">
					<b>Rellene los siguientes datos: </b>
				</legend>

				<label for="username">Username: </label> 
				<input type="text" name="username" id="username" required><br> <br> 
				<label for="password">Password: </label> 
				<input type="password" name="password" id="password" required minlength="6" maxlenght="12"><br><br> 
				<label for="first_name">First name:</label>
				<input type="text" name="first_name" id="first_name" required><br> <br> 
				<label for="last_name">Last name:</label> 
				<input type="text" name="last_name" id="last_name" required><br> <br> 
				<label for="date">Fecha de nacimiento: </label> 
				<input type="date" name="date" required><br><br> 
				<br> 
				<label for="gender">Género: </label> 
				<label for="gender">Hombre</label> 
				<input type="radio" name="gender" value="H" required> 
				<label for="gender">Mujer </label> 
				<input type="radio" name="gender" value="M" required><br> <br>
				<button type="submit" id="loginButton" class="login_button">Enviar</button>
				<button type="reset" id="resetButton" class="login_button">Borrar</button>
				<button onclick="location.href='index.jsp'" value="Volver al Inicio" />
				Inicio
				</button>

			</fieldset>
		</form>
	</div>

</body>
</html>
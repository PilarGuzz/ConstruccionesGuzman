<%@page import="com.jacaranda.models.LoginUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<%session.invalidate();%>
<body background="images/fondoBrick.jpg">

	<div id="container" class="grid-container">
		<div class="medio">
			<img src="images/logo2.png" width="180px" height="120px" id="logo">

			<div class="centroLogin">

				<form action="Login" method="post">
					<h1 id="titulo">Bienvenido</h1>
					<%
					//Se comprueba si existe la variable error que vendría true del checkLogin si algun campo fuese incorrecto
					String messageLog = request.getParameter("msg_user");
					String messageLogError = request.getParameter("msg_userError");
					if (messageLog != null) {
					%>
					<div>
						<span>El usuario ha sido creado correctamente</span>
					</div>
					<%}else if(messageLogError != null) {
					%>
					<div>
						<span>Ha ocurriedo un error al crear el usuario</span>
					</div>
					<%}%>
	
					<!--Formulario de login que enviará la información a checkLogin.jsp y hará las comprobaciones-->
	
					<label for="user" class="textoUser">Usuario: </label> <br>
						<br> <input type="text" required name="user" id="user"><br>
						<br>
						<br> <label for="password" class="textoContrasena">Contraseña:
						</label> <br>
						<br> <input type="password" required name="password" id="password"><br>
						<br>
	
						<p>
							<input type="submit" id="Enviar" value="Enviar">
						</p>
				</form>
				<hr>
				<div class="register">
					¿No tienes cuenta?, Registrate <br></br> 
					<a href='SignUp.jsp'><button id='SignUp'>Sign Up</button></a>
				</div>
	
			</div>
		</div>
	</div>


</body>
</html>
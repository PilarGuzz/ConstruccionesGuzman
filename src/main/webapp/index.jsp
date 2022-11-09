<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
</head>
<body>

<div id="container">
    
                     
         <div id="centroLogin">
     
         	<form action="Login"  method="post">
            	<h1 id="titulo">Bienvenido</h1>
            	<%
				//Se comprueba si existe la variable error que vendría true del checkLogin si algun campo fuese incorrecto
				String messageLog = request.getParameter("msg_error");
				if(messageLog!=null){
				%>
					<div>
						<span>El usuario o la contraseña son incorrectos</span>
					</div>
				<%}%>
					
		<!--Formulario de login que enviará la información a checkLogin.jsp y hará las comprobaciones-->
		
	            	<p class="textoUser">Usuario:
	                	<input type="text" required name="user" id="user">
	                </p>
	                <p class="textoContrasena">Contraseña: 
	                	<input type="password" required name="password" id="password">
	                </p>
                    <p><input type="submit" id="Enviar" value="Enviar"></p>
          	</form>
       	</div>
       	<div> <a href='SignUp.jsp'><button id='SignUp'>Sign Up</button></a> </div>
   	</div>


</body>
</html>
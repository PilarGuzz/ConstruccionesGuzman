<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<div id="container">
    
                     
         <div id="centroLogin">
     
         	<form action="Login"  method="post">
            	<h1 id="titulo">Bienvenido</h1>
            	<%
				//Se comprueba si existe la variable error que vendr�a true del checkLogin si algun campo fuese incorrecto
				String messageLog = request.getParameter("msg_error");
				if(messageLog!=null){
				%>
					<div>
						<span>El usuario o la contrase�a son incorrectos</span>
					</div>
				<%}%>
					
		<!--Formulario de login que enviar� la informaci�n a checkLogin.jsp y har� las comprobaciones-->
		
	            	<p class="textoUser">Usuario:
	                	<input type="text" required name="user" id="user">
	                </p>
	                <p class="textoContrasena">Contrase�a: 
	                	<input type="password" required name="password" id="password">
	                </p>
                    <p><input type="submit" id="Enviar" value="Enviar"></p>
          	</form>
       	</div>
   	</div>


</body>
</html>
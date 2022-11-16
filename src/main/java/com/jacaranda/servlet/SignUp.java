package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.models.LoginUtils;
import com.jacaranda.models.User;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(errorHTML("No se admiten peticiones GET"));
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		LocalDate date = null;
		String gender = request.getParameter("gender");
		try {
			date = LocalDate.parse(request.getParameter("date"));

		}catch(Exception e){
			response.sendRedirect("index.jsp?msg_userError=true");
		}
		
		PrintWriter out = response.getWriter();
		
		if(username!=null && password != null && first_name != null && last_name != null && date != null && gender != null){
			
			if((password.length()>=6 && password.length()<=12) && (gender.equalsIgnoreCase("H") || gender.equalsIgnoreCase("M"))) {
				
			
				if(LoginUtils.getUser(username)==null) {
					
					User u  = new User(username,LoginUtils.getMD5(password),first_name,last_name,date,gender);
					LoginUtils.saveUser(u);
					response.sendRedirect("index.jsp?msg_user=true");
				}
			}else{
				out.println( errorHTML("Algunos campos no son válidos"));
				
			}
			
		}else{
			out.println(errorHTML("El usuario<br> ya existe"));
			
		}
		
	}
	public static String errorHTML(String cadena) {
		String error = "<!DOCTYPE html>" 
				+ "<html>" 
				+ "<head>" 
				+ "<meta charset=\"UTF-8\">"
				+ "<title>Error</title>"
				+ "<link rel=\"stylesheet\" type=\"text/CSS\" href=\"CSS/styleError.css\">" + "</head>"
				+ "<body class=\"background\" background=\"images/error2.jpg\">"
				+ "	<p><a href=\"index\"><img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\"> </a></p>\n"
				+ "<div id=\"der\">" 
				+ "<h1 id=\"TextoGrande\">¡Vaya!</h1>"
				+ "<h3 id=\"TextoChico\">No hemos podido encontrar<br> la pagina que buscas.</FONT></h3>"
				+ "<h7 id=\"msg\">"+cadena+"</h7> <br>" 
			
				+ "</div>" 
				+ "</body>" 
				+ "</html>";
		return error;
	}

}

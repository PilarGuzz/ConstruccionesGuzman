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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
			
			if(LoginUtils.getUser(username)==null) {
				
				User u  = new User(username,LoginUtils.getMD5(password),first_name,last_name,date,gender);
				LoginUtils.saveUser(u);
				response.sendRedirect("index.jsp?msg_user=true");
			}
			
		}else{
			out.println("<!DOCTYPE html>" 
					+ "<html>" 
					+ "<head>" 
					+ "<meta charset=\"UTF-8\">"
					+ "<title>Error</title>"
					+ "<link rel=\"stylesheet\" type=\"text/CSS\" href=\"CSS/TablePage.css\">" + "</head>"
					+ "<body class=\"background\" background=\"images/error2.jpg\">"
					+"<form method=\"post\" action=\"Login\">\n"
					+ "	<p><button name=\"Back\" value=\"back\" type=\"submit\"><img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\"> </button></p>\n"
					+ "	</form>	"
					+ "<div id=\"der\">" 
					+ "<h1 id=\"TextoGrande\">¡Vaya!</h1>"
					+ "<h3 id=\"TextoChico\">El usuario<br> ya existe</FONT></h3>"
					+ "</div>" 
					+ "</body>" 
					+ "</html>");
			
		}
		
	}

}

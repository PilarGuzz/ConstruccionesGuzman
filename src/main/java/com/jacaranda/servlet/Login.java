package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.models.CRUDMaterial;
import com.jacaranda.models.Conn;
import com.jacaranda.models.LoginUtils;
import com.jacaranda.models.Material;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub
		
		
		
		String name = request.getParameter("user");
		String pass = request.getParameter("password");
		if(name !=null && pass !=null){

			if(LoginUtils.validate(name, pass)) {
				HttpSession userSession = request.getSession();
				userSession.setAttribute("login", "True");
				userSession.setAttribute("usuario", name);
				
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				try {
					out.println("<!DOCTYPE html>"
							+ "<html>"
							+ "<head>"
	    					+ "<meta charset=\"UTF-8\">"
	    					+ "<title>Materiales</title>"
	    					+ "</head>"
	    					+ "<body>");
					
					List<Material> listMaterial = null;
					listMaterial = CRUDMaterial.getMaterials();
				
					out.println("<div>"
	    					+ "<table>"
	    					+ "<tr>"
	    					+ "<th>Codigo</th>"
	    					+ "<th>Nombre</th>"
	    					+ "<th>Description</th>"
	    					+ "<th>Price</th>"
	    					+ "<th>CategoryCode</th>"
	    					+ "</tr>");
					
					Iterator<Material> iterator = listMaterial.iterator();
	    			while(iterator.hasNext()) { 
	    				//Itera cada linea de nuestra base datos y nos la muestra en la tabla correspondiente.
	    				
	    				Material material = new Material();
	    				material=iterator.next();
	    					Integer id = material.getCode();
	    					
	    					out.println("<tr>"
	    							+ "<td>"+material.getCode()+"</td>"
	    							+ "<td>"+material.getName()+"</td>"
	    							+ "<td>"+material.getDescription()+"</td>"
	    							+ "<td>"+material.getPrice()+"</td>"
	    							+ "<td>"+material.getCategory().getName()+"</td>");			
	    			}
	    			out.println("</table>"
	    					+ "</div>"
	    					+ "</body>"
	    					+ "</html>");
	    			
		
				} finally {
					out.close();
				}
	    		
			}else {
				response.sendRedirect("index.jsp?msg_error=true");
			}
			
		}else {
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?msg_error=true");
			rd.include(request, response);
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

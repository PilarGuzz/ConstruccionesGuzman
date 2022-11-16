package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.models.CRUDCategory;
import com.jacaranda.models.CRUDMaterial;
import com.jacaranda.models.Category;
import com.jacaranda.models.Material;

/**
 * Servlet implementation class AddMaterial
 */
@WebServlet("/AddMaterial")
public class AddMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMaterial() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = String.valueOf(request.getParameter("nameMaterial"));
		String description = String.valueOf(request.getParameter("descriptionMaterial"));
		int code = Integer.valueOf(request.getParameter("cat"));
		Double price = Double.valueOf(request.getParameter("price"));
		
		Category cat = CRUDCategory.getCategory(code);
		
		if(CRUDMaterial.getMaterialByName(name)== null) {
			
			Material mat = new Material(name, description, price, cat);
			CRUDMaterial.saveMaterial(mat);
			ServletContext context = this.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/Login");
			dispatcher.forward(request, response);
			
		}else {
			// response.sendRedirect("index.jsp?msg_error=true");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>" 
					+ "<html>" 
					+ "<head>" 
					+ "<meta charset=\"UTF-8\">"
					+ "<title>Materiales</title>"
					+ "<link rel=\"stylesheet\" type=\"text/CSS\" href=\"CSS/TablePage.css\">" + "</head>"
					+ "<body background=\"images/fondo2.jpg\">"
					+"<form method=\"post\" action=\"Login\">\n"
					+ "	<p><button name=\"Back\" value=\"back\" type=\"submit\"><img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\"> </button></p>\n"
					+ "	</form>	"
					+ "<hr>" 
					+ "<div id=\"izq\">" + "<img src=\"images/error.png\" id=\"iconoError\">" + "</div>"
					+ "<div id=\"der\">" 
					+ "<h1 id=\"TextoGrande\">¡Vaya!</h1>"
					+ "<h3 id=\"TextoChico\">No hemos podido encontrar<br> la pagina que buscas.</FONT></h3>"
					+ "<h7 id=\"msg\">Imposible añadir, el material ya existe</h7> <br>" 
					+ "<h7 id=\"codError\">Codigo de error: 404</h7>" 
					+ "</div>" 
					+ "</body>" 
					+ "</html>");

		}
		
		//response.sendRedirect(request.getContextPath()+"/Login");
	
	}

}

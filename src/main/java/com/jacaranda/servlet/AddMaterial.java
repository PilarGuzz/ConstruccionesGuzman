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
import com.jacaranda.models.LoginUtils;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(errorHTML("No se admiten peticiones GET"));
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = String.valueOf(request.getParameter("nameMaterial"));
		String description = String.valueOf(request.getParameter("descriptionMaterial"));
		Double price = -1.0;
		int code = -1;
		Category category = null;
		int stock = -1;
		
		try {
			price = Double.valueOf(request.getParameter("price"));
			code = Integer.valueOf(request.getParameter("cat"));
			category = CRUDCategory.getCategory(code);
			stock = Integer.valueOf(request.getParameter("stock"));
			
		}catch(Exception e) {
			out.println(errorHTML("Campos inválidos"));
			throw e;

		}
		
		if(name != null && description != null && price!=null && category != null) {
			
			if(CRUDMaterial.getMaterialByName(name)== null && price > 0  ) {
				
				Material mat = new Material(name, description, price, category, stock);
				CRUDMaterial.saveMaterial(mat);
				ServletContext context = this.getServletContext();
				RequestDispatcher dispatcher = context.getRequestDispatcher("/Login");
				dispatcher.forward(request, response);
				
			}else {
			
				
				out.println(errorHTML("Imposible añadir, el material ya existe o el precio es menor a 0"));
					
				
			}
			
		}else {
			out.println(errorHTML("Imposible añadir, campos nulos"));
	
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
				+"<form method=\"post\" action=\"Login\">\n"
				+ "	<p><button name=\"Back\" value=\"back\" type=\"submit\"><img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\"> </button></p>\n"
				+ "	</form>	"
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



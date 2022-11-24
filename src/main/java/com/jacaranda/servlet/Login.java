package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.models.CRUDMaterial;
import com.jacaranda.models.Carrito;
import com.jacaranda.models.LoginUtils;
import com.jacaranda.models.Material;
import com.jacaranda.models.User;

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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession userSession = request.getSession();

		String name = request.getParameter("user");
		String pass = request.getParameter("password");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Carrito carro = (Carrito) userSession.getAttribute("carrito");
		if(carro == null) {
			carro = new Carrito();
			userSession.setAttribute("carrito", carro);
		}
		
		if (name == null && pass == null) {
			 name = (String) userSession.getAttribute("usuario");
			 pass = (String) userSession.getAttribute("password");
		}
		if(name != null && pass != null) {
			
			if (LoginUtils.validate(name, pass)) {
				
				userSession.setAttribute("login", "True");
				userSession.setAttribute("usuario", name);
				userSession.setAttribute("password", pass);
				
				
				
				try {
					out.println("<!DOCTYPE html>" 
							+ "<html>" 
							+ "<head>" 
							+ "<meta charset=\"UTF-8\">"
							+ "<title>Materiales</title>"
							+ "<link rel=\"stylesheet\" type=\"text/CSS\" href=\"CSS/tablePage.css\">" + "</head>"
							+ "<body background=\"images/fondoBrick.jpg\">" + "<div id=\"header\"> </div>" 
							+ "<a href=\"index.jsp\"><img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\"><a>"
							+ "<a href=\"cart.jsp\"><img src=\"images/carrito.png\" width=\"30px\"></a>"
							+ "<hr>");
					User user = LoginUtils.getUser(name);
					if (user.isAdmin()) {
						out.println("</div>" 
								+ "<div id=\"botonadd\" align=\"right\">"
								+ "<a href=\"addMaterial.jsp\" ><button class=\"addbutton\" name=\"addMaterial\" id=\"addButton\" value=\"addMaterial\">Añadir Material</button></a>"
								+ "</div>" 
								+ "<br>");
					}
					out.println("<div>" 
							+ "<table>" 
							+ "<tr>" 
							+ "<th>Codigo</th>" 
							+ "<th>Nombre</th>"
							+ "<th>Description</th>" 
							+ "<th>Price</th>" 
							+ "<th>Category</th>" 
							+ "<th>Imagen</th>" 
							+ "<th>Stock</th>" 
							+ "<th>Compra</th>" 
							+ "<th>"+ carro.getArticulos().size() +"</th>" 
							+ "</tr>");
					
					List<Material> listMaterial = null;
					listMaterial = CRUDMaterial.getMaterials();
					
					for (Material material : listMaterial) {
						
						out.println("<tr>" 
								+ "<td>" + material.getCode() + "</td>" 
								+ "<td>" + material.getName() + "</td>" 
								+ "<td>" + material.getDescription() + "</td>" 
								+ "<td>" + material.getPrice() + "</td>" 
								+ "<td>" + material.getCategory().getName() + "</td>");
						if(material.getImg()!=null) {
							
							out.println("<td>" + material.getImg()+ "</td>");
						}else {
							out.println("<td><img src=\"images/noIMG.jpg\" width=\"80px\" height=\"80px\"></td>");
						}
						out.println( "<td>" + material.getStock()+ "</td>"
								+ "<td><form action=\"addCarrito.jsp\" method=\"POST\">"
								+ "Cantidad:<input type=\"number\" name = \"cantidad\" id=\"cantidad\"><br><br> "
								+ "<button type=\"submit\" name=\"materialCode\" id=\"materialCode\" value="+ material.getCode() +"><img src=\"images/carrito.png\" width=\"30px\"></button>"
								+ "</form></td>");
						
					}
					out.println("</table>" + "</div>" + "</body>" + "</html>");
					
				} catch (Exception e) {
					out.close();
				}
				
			} else {
				out.println(errorHTML("Usuario o contraseña erroneos"));
					
				
			}
		} else {
		
			out.println(errorHTML("Usuario nulo, rellene los campos"));
							
		}

		}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(errorHTML("No se admiten peticiones GET"));
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

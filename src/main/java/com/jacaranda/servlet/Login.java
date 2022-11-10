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
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession userSession = request.getSession();
		String name = (String) userSession.getAttribute("usuario");
		String pass = (String) userSession.getAttribute("password");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		if ((name == null && pass == null)) {
			name = request.getParameter("user");
			pass = request.getParameter("password");
		}

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
							+ "<body background=\"images/fondoBrick.jpg\">" + "<div id=\"header\"> </div>" + "<hr>");
					User user = LoginUtils.getUser(name);
					if (user.isAdmin()) {
						out.println("</div>" 
								+ "<div id=\"botonadd\" align=\"right\">"
						// POR HACER
								+ "<a href=\"addMaterial.jsp\" ><button name=\"addMaterial\" id=\"addButton\" value=\"addMaterial\">Añadir Material</button></a>"
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

					}
					out.println("</table>" + "</div>" + "</body>" + "</html>");

				} catch (Exception e) {
					out.close();
				}

			} else {
				// response.sendRedirect("index.jsp?msg_error=true");
				out.println("<!DOCTYPE html>" 
						+ "<html>" 
						+ "<head>" 
						+ "<meta charset=\"UTF-8\">"
						+ "<title>Materiales</title>"
						+ "<link rel=\"stylesheet\" type=\"text/CSS\" href=\"CSS/TablePage.css\">" + "</head>"
						+ "<body background=\"images/fondo2.jpg\">"
						+ "<img src=\"images/logo2.png\" width=\"140px\" height=\"100px\" id=\"logo\">"
						+ "<hr>" 
						+ "<div id=\"izq\">" + "<img src=\"images/error.png\" id=\"iconoError\">" + "</div>"
						+ "<div id=\"der\">" 
						+ "<h1 id=\"TextoGrande\">¡Vaya!</h1>"
						+ "<h3 id=\"TextoChico\">No hemos podido encontrar<br> la pagina que buscas.</FONT></h3>"
						+ "<h7 id=\"codError\">Codigo de error: 404</h7>" 
						+ "</div>" 
						+ "</body>" 
						+ "</html>");

			}

		}

	

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

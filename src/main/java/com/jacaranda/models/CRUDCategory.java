package com.jacaranda.models;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDCategory {

	public static Category getCategory(int code ) {
		Session session = Conn.getSession();
		Category cat = null;
		try {
			cat = (Category) session.get(Category.class,code);
		
			
		}catch(Exception e) {
			errorHTML("La categoría no existe");
		}
		return cat;
	}
	
	public static Category getCategoryName(String name ) {
		Session session = Conn.getSession();
		Query<Category> query = session.createQuery("SELECT p FROM com.jacaranda.models.Category p WHERE name = '" + name + "'");
		Category cat = query.getSingleResult();
	
		return cat;
	}
	
	public static ArrayList<Category> getCategories(){
		Session session = Conn.getSession();
		
		Query<Category> query = session.createQuery("SELECT p FROM com.jacaranda.models.Category p");
		ArrayList<Category> list = (ArrayList<Category>) query.getResultList();
		
		
		return list;
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

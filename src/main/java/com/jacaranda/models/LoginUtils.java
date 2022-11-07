package com.jacaranda.models;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;


public class LoginUtils {
	
	public static String getMD5(String input) {
		
		String pass = DigestUtils.md5Hex(input);
		return pass;
	}
	
	// Obtiene un usuario por su nombre.
	public static User getUser(String name ) {
		Session session = Conn.getSession();
				
		User user = (User) session.get(User.class,name);
		return user;
			
	}
		
	// Obtiene una lista con los usuarios
	public static ArrayList<User> getUsers(){
		Session session = Conn.getSession();
			
		Query<User> query = session.createQuery("SELECT p FROM com.jacaranda.java.User p");
		ArrayList<User> users = (ArrayList<User>) query.getResultList();
			
		return users;
	}
		
	 //Comprueba si el usuario es valido en la base de datos.
	public static boolean validate(String usurname, String password) {
		String passwordEncript= getMD5(password);
	    boolean valid = false;
		try {
		    Session session = Conn.getSession();
		    Query<User> query = session.createQuery("SELECT p FROM com.jacaranda.java.User p WHERE username='" + usurname + "'and password='"+passwordEncript+"'",User.class);
		    if(!query.getResultList().isEmpty()) {
		        valid = true;		    
		    }
		}catch(Exception e) {
		    System.out.println(e.getMessage());
		}
		return valid;
	}
		
		
	 //Cerrar sesion. Limpia parametros  y atributos de la session actual.
		
	public static void closeSession () {	
		 Session session = Conn.getSession();
		 session.clear();
	}

}

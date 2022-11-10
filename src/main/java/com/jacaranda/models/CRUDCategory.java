package com.jacaranda.models;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDCategory {

	public static Category getCategory(int code ) {
		Session session = Conn.getSession();
		Category cat = (Category) session.get(Category.class,code);
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
	

}

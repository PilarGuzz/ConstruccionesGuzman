package com.jacaranda.models;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;



public class CRUDMaterial {

	public static Material getMaterial(int code ) {
		Session session = Conn.getSession();
		Material material = (Material) session.get(Material.class,code);
		return material;
	}
	
	public static Material getMaterialByName(String name ) {
		Session session = Conn.getSession();
		Query<Material> query = session.createQuery("SELECT p FROM com.jacaranda.models.Material p where name='" + name+"'", Material.class);

		Material material =  query.getSingleResult();
		return material;
	}
	
	public static boolean saveMaterial( Material mat) {
		boolean resultado=false;
		Session session = Conn.getSession();
		
		try {
			
			session.getTransaction().begin();
			session.saveOrUpdate(mat);
			mat.getCategory().getMaterialList().add(mat);
			session.getTransaction().commit();

			resultado=true;			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	
	public static boolean updateMaterial( Material mat) {
		boolean resultado=false;
		Session session = Conn.getSession();
		
		try {
			session.getTransaction().begin();
			session.update(mat);
			session.getTransaction().commit();
			resultado=true;			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static ArrayList<Material> getMaterials(){
		Session session = Conn.getSession();
		
		Query<Material> query = session.createQuery("SELECT p FROM com.jacaranda.models.Material p");
		ArrayList<Material> list = (ArrayList<Material>) query.getResultList();
		
		
		return list;
	}
	

}

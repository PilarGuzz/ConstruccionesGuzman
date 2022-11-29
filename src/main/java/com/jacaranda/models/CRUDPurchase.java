package com.jacaranda.models;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class CRUDPurchase {

	public static boolean savePurchase(Purchase purchase) {
		boolean resultado=false;
		Session session = Conn.getSession();
		
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(purchase);		
			session.getTransaction().commit();
			resultado=true;			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			session.getTransaction().rollback();
		}
		return resultado;
	}
	
	public static ArrayList<Purchase> getListPurchase(String user) {
	   
		Session session = Conn.getSession();
		Query<Purchase> query = session.createQuery("SELECT p FROM com.jacaranda.models.Purchase p WHERE username='" + user+"' ORDER BY date DESC",Purchase.class);
		ArrayList<Purchase> purchase = (ArrayList<Purchase>) query.getResultList();
		return purchase;
	}
	
}

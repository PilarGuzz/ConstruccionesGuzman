package com.jacaranda.models;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity (name = "users")
public class User {
	
	@Id
	private String username;
	private String password;

	public User() {
		
	}

	public User(String usurname, String password) {

		this.username = usurname;
		this.password = password;
	}

}

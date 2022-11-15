package com.jacaranda.models;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity(name = "user")
public class User {
	
	@Id
	private String username;
	@Column(name = "pass")
	private String password;
	@Column(name = "first_name")
	private String name;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "birthday")
	private LocalDateTime birthday;
	@Column(name = "gender")
	private String gender;
	@Column(name = "admin")
	private boolean admin;

	public User() {
		
	}

	
	public User(String username, String password, String name, String lastName, LocalDateTime birthday, String gender) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.lastName = lastName;
		this.birthday = birthday;
		this.gender = gender;
		this.admin = false;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public LocalDateTime getBirthday() {
		return birthday;
	}


	public void setBirthday(LocalDateTime birthday) {
		this.birthday = birthday;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}


}

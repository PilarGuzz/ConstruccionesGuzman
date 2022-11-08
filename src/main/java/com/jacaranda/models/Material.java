package com.jacaranda.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="material")
public class Material {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int code;
	private String name;
	private String description;
	private double price;
	@ManyToOne
	@JoinColumn
	private Category category;
	
	public Material() {
		
	}
	public Material(String name, String description, double price, Category categoryName) {
		
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = categoryName;
	}

}

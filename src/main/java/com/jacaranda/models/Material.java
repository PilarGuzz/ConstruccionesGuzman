package com.jacaranda.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="material")
public class Material {
	
	@Id
	private int code;
	private String name;
	private String description;
	private double price;
	@ManyToOne
	@JoinColumn(name = "name")
	private Category categoryName;

}

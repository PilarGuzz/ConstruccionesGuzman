package com.jacaranda.models;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name="material")
public class Material {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int code;
	private String name;
	private String description;
	private double price;
	@ManyToOne
	@JoinColumn(name="category")
	private Category category;
	
	public Material() {
		
	}
	public Material(String name, String description, double price, Category categoryName) {
		
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = categoryName;
	}
	public int getCode() {
		return code;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public double getPrice() {
		return price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public int hashCode() {
		return Objects.hash(category, code, description, name, price);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Material other = (Material) obj;
		return Objects.equals(category, other.category) && code == other.code
				&& Objects.equals(description, other.description) && Objects.equals(name, other.name)
				&& Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price);
	}

}

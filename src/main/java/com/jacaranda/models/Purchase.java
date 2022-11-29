package com.jacaranda.models;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity(name="purchase")
@IdClass(IdVentas.class)
public class Purchase {
	
	@Id
	@ManyToOne
	@JoinColumn(
			name="username",
			insertable = false, updatable = false
			)
	private User username;
	
	@Id
	@ManyToOne
	@JoinColumn(
			name="materialCode",
			insertable = false, updatable = false
			)
	private Material material;
	@Id
	private LocalDateTime date;
	private Double price;
	private int quantity;

	public Purchase() {
		
	}

	public Purchase(User username, Material material, Double price, int quantity) {
		super();
		this.username = username;
		this.material = material;
		this.date = LocalDateTime.now();
		this.price = price;
		this.quantity = quantity;
	}

	public User getUsername() {
		return username;
	}

	public Material getMaterial() {
		return material;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public Double getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}
	public double getTotalPrice() {
		return price * quantity;
	}

	public void setUsername(User username) {
		this.username = username;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Purchase [username=" + username + ", material=" + material.getName() + ", date=" + date + ", price=" + price
				+ ", quantity=" + quantity + "]";
	}
	
	

}

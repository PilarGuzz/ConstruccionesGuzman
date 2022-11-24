package com.jacaranda.models;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
@IdClass(IdVentas.class)
public class Ventas {
	
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

	public Ventas() {
		
	}

}

package com.jacaranda.models;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class IdVentas implements Serializable {
	


	private String username;
	private LocalDateTime date;
	private int material;

	public IdVentas(String username, LocalDateTime date, int material) {
		super();
		this.username = username;
		this.date = date;
		this.material = material;
	}
	
	public IdVentas() {
	}

	@Override
	public int hashCode() {
		return Objects.hash(date, material, username);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		IdVentas other = (IdVentas) obj;
		return Objects.equals(date, other.date) && Objects.equals(material, other.material)
				&& Objects.equals(username, other.username);
	}
}

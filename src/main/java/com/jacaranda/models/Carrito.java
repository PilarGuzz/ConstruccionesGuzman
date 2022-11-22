package com.jacaranda.models;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Carrito {
	
	private List<ItemCarrito> articulos ;

	public Carrito() {
		
		this.articulos= new ArrayList<ItemCarrito>();
	}

	public List<ItemCarrito> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<ItemCarrito> articulos) {
		this.articulos = articulos;
	}
	
	public void addMaterial(ItemCarrito mat) {
		
		this.articulos.add(mat);
	}

	@Override
	public int hashCode() {
		return Objects.hash(articulos);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carrito other = (Carrito) obj;
		return Objects.equals(articulos, other.articulos);
	}

}

package com.jacaranda.models;

import java.util.List;

public class Carrito {
	
	private List<ItemCarrito> articulos;

	public Carrito() {
	}

	public List<ItemCarrito> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<ItemCarrito> articulos) {
		this.articulos = articulos;
	}

}

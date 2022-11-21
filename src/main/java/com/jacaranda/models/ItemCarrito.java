package com.jacaranda.models;

public class ItemCarrito {

	private Material articulo;
	private int cantidad;

	public ItemCarrito(Material articulo, int cantidad) {
		this.articulo = articulo;
		this.cantidad = cantidad;
	}
	

	public ItemCarrito() {
		
	}
	
	public Material getArticulo() {
		return articulo;
	}
	
	public void setArticulo(Material articulo) {
		this.articulo = articulo;
	}
	
	public int getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

}

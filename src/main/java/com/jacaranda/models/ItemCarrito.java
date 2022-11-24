package com.jacaranda.models;

import java.util.Objects;

public class ItemCarrito {


	private Material articulo;
	private int cantidad;
	private double totalPrice;

	public ItemCarrito(Material articulo, int cantidad) {
		this.articulo = articulo;
		this.cantidad = cantidad;
		this.totalPrice = cantidad * articulo.getPrice();
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
	public double getTotalPrice() {
		return totalPrice;
	}
	
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	@Override
	public int hashCode() {
		return Objects.hash(articulo);
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemCarrito other = (ItemCarrito) obj;
		return Objects.equals(articulo, other.articulo);
	}


	@Override
	public String toString() {
		return "ItemCarrito [articulo=" + articulo + ", cantidad=" + cantidad + ", totalPrice=" + totalPrice + "]";
	}
}

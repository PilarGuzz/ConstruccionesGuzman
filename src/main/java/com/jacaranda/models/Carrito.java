package com.jacaranda.models;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Carrito {

	private List<ItemCarrito> articulos;

	
	public Carrito() {

		this.articulos = new ArrayList<ItemCarrito>();
	}

	
	
	public List<ItemCarrito> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<ItemCarrito> articulos) {
		this.articulos = articulos;
	}

	public void addItem(ItemCarrito mat) throws Exception {
		//Si el item es nulo lanzo una excepcion
		if (mat == null) {
			throw new Exception("Material nulo");
		}
		//Si el carrito esta vacio, añado el item sin comprobaciones
		if (this.articulos.isEmpty()) {
			this.articulos.add(mat);
			
		//Si no esta vacio compruebo si existe el item en el carrito ya	
		} else {
			boolean different = true;
			for (ItemCarrito item : this.articulos) {
				//Si existe el item comprobandolo por su codigo unico se actualiza la cantidad
				if (item.getArticulo().getCode() == (mat.getArticulo().getCode())) {
					different = false;
					item.setCantidad(mat.getCantidad());

				}
			}
			//si el item es diferente a los del carrito se añade
			if (different) {
				this.articulos.add(mat);
			}
		}
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

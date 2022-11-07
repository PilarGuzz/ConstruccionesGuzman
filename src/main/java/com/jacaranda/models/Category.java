package com.jacaranda.models;

import java.util.ArrayList;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	
	@Id
	private int code;
	private String name;
	private String description;
	private ArrayList<Material> materialList;
	
	public Category() {
		
	}
	public Category(int code, String name, String description) {
		
		this.code = code;
		this.name = name;
		this.description = description;
		this.materialList = null;
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
	public ArrayList<Material> getMaterialList() {
		return materialList;
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
	public void setMaterialList(ArrayList<Material> materialList) {
		this.materialList = materialList;
	}
	@Override
	public int hashCode() {
		return Objects.hash(code, materialList, name);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return code == other.code && Objects.equals(materialList, other.materialList)
				&& Objects.equals(name, other.name);
	}
	@Override
	public String toString() {
		return "Category [code=" + code + ", name=" + name + ", description=" + description + ", materialList="
				+ materialList + "]";
	}
	

}

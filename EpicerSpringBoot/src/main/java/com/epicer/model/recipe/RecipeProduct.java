package com.epicer.model.recipe;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "recipeProduct")
@Component
public class RecipeProduct {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int recipeProductId;
	@Column(name = "recipeid")
	private int recipeId;
	@Column(name = "productid")
	private int productId;
	public int getRecipeProductId() {
		return recipeProductId;
	}
	public void setRecipeProductId(int recipeProductId) {
		this.recipeProductId = recipeProductId;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public RecipeProduct(int recipeId, int productId) {
		super();
		this.recipeId = recipeId;
		this.productId = productId;
	}
	public RecipeProduct() {
		super();
	}
	
	
	
}

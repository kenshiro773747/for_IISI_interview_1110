package com.epicer.model.recipe;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "recipeIngredients")
@Component
public class Ingredients implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ingredientid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer IngredientsId;
	@Column(name = "ingredient")
	@NotBlank(message = "食材不可為空")
	private String ingredient;
	@Column(name = "amount")
	@NotBlank(message = "份量不可為空")
	private String Amount;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "recipeid")
	@JsonBackReference
	private Recipe recipeBean;
	@Column(name = "productid")
	private Integer productIdInteger;
	
	
	public Ingredients(Integer ingredientsId, String ingredient, String amount, Recipe recipeBean) {
		super();
		IngredientsId = ingredientsId;
		this.ingredient = ingredient;
		Amount = amount;
		this.recipeBean = recipeBean;
	}
	
	public Ingredients(String ingredient, String amount, Recipe recipeBean, Integer productIdInteger) {
		super();
		this.ingredient = ingredient;
		Amount = amount;
		this.recipeBean = recipeBean;
		this.productIdInteger = productIdInteger;
	}

	public Ingredients() {
		super();
	}
	public Ingredients(String ingredient, String amount) {
		super();
		this.ingredient = ingredient;
		Amount = amount;
	}
	public Ingredients(String ingredient, String amount, Recipe recipeBean) {
		super();
		this.ingredient = ingredient;
		Amount = amount;
		this.recipeBean = recipeBean;
	}
	public Integer getIngredientsId() {
		return IngredientsId;
	}
	public void setIngredientsId(Integer ingredientsId) {
		IngredientsId = ingredientsId;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public Recipe getRecipeBean() {
		return recipeBean;
	}
	public void setRecipeBean(Recipe recipeBean) {
		this.recipeBean = recipeBean;
	}
	
	
	public Integer getProductIdInteger() {
		return productIdInteger;
	}

	public void setProductIdInteger(Integer productIdInteger) {
		this.productIdInteger = productIdInteger;
	}

	@Override
	public String toString() {
		return "IngredientsBean [IngredientsId=" + IngredientsId + ", ingredient=" + ingredient + ", Amount=" + Amount
				+ "]";
	}

}

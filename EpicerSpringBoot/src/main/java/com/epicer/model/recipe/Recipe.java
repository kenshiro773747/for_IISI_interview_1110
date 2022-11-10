package com.epicer.model.recipe;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "recipe")
@Component

public class Recipe implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "recipeid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer recipeId;
	@Column(name = "recipename") 
	@NotBlank(message = "標題不可為空")
	private String recipeName;
	@Column(name = "recipeimage")
	private String imgPath;
	@Column(name = "recipedescription")
	@NotBlank(message = "描述不可為空")
	
	private String recipeDescription;
	@Column(name = "recipecooktime")
	private String cookTime;
	@Column(name = "recipepeople")
	private String howManyPeople;
	@Column(name = "userid")
	private Integer userId;
	@Column(name = "recipelikes")
	private Integer recipeLikes;
	@Column(name = "categoryid")
	private Integer recipeCategoryId;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "recipeBean", cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<Ingredients> ingredients = new LinkedHashSet<Ingredients>();
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "recipeBean", cascade = CascadeType.ALL)
	private Set<Step> steps = new LinkedHashSet<Step>();
	
	public Recipe(Integer recipeId, String recipeName, String imgPath, String recipeDescription, String cookTime,
			String howManyPeople) {
		super();
		this.recipeId = recipeId;
		this.recipeName = recipeName;
		this.imgPath = imgPath;
		this.recipeDescription = recipeDescription;
		this.cookTime = cookTime;
		this.howManyPeople = howManyPeople;
	}

	public Recipe(String recipeName, String imgPath, String recipeDescription, String cookTime,
			String howManyPeople) {
		super();
		this.recipeName = recipeName;
		this.imgPath = imgPath;
		this.recipeDescription = recipeDescription;
		this.cookTime = cookTime;
		this.howManyPeople = howManyPeople;
	}

	public Recipe(String recipeName, String imgPath, String recipeDescription, String cookTime,
			String howManyPeople, Set<Ingredients> ingredients) {
		super();

		this.recipeName = recipeName;
		this.imgPath = imgPath;
		this.recipeDescription = recipeDescription;
		this.cookTime = cookTime;
		this.howManyPeople = howManyPeople;
		this.ingredients = ingredients;
	}

	public Recipe(Integer recipeId, String recipeName, String imgPath, String recipeDescription, String cookTime,
			String howManyPeople, Set<Ingredients> ingredients, Set<Step> steps, Integer userId, Integer recipeLikes) {
		super();
		this.recipeId = recipeId;
		this.recipeName = recipeName;
		this.imgPath = imgPath;
		this.recipeDescription = recipeDescription;
		this.cookTime = cookTime;
		this.howManyPeople = howManyPeople;
		this.ingredients = ingredients;
		this.steps = steps;
		this.userId = userId;
		this.recipeLikes = recipeLikes;
	}

	public Recipe(String recipeName, String imgPath, String recipeDescription, String cookTime, String howManyPeople,
			Set<Ingredients> ingredients, Set<Step> steps, Integer userId, Integer recipeLikes) {
		super();
		this.recipeName = recipeName;
		this.imgPath = imgPath;
		this.recipeDescription = recipeDescription;
		this.cookTime = cookTime;
		this.howManyPeople = howManyPeople;
		this.ingredients = ingredients;
		this.steps = steps;
		this.userId = userId;
		this.recipeLikes = recipeLikes;
	}

	public Recipe() {
		super();
	}

	public Integer getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getRecipeDescription() {
		return recipeDescription;
	}

	public void setRecipeDescription(String recipeDescription) {
		this.recipeDescription = recipeDescription;
	}

	public String getCookTime() {
		return cookTime;
	}

	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}

	public String getHowManyPeople() {
		return howManyPeople;
	}

	public void setHowManyPeople(String howManyPeople) {
		this.howManyPeople = howManyPeople;
	}

	public Set<Ingredients> getIngredients() {
		return ingredients;
	}

	public void setIngredients(Set<Ingredients> ingredients) {
		this.ingredients = ingredients;
	}

	public Set<Step> getSteps() {
		return steps;
	}

	public void setSteps(Set<Step> steps) {
		this.steps = steps;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRecipeLikes() {
		return recipeLikes;
	}

	public void setRecipeLikes(Integer recipeLikes) {
		this.recipeLikes = recipeLikes;
	}

	public Integer getRecipeCategoryId() {
		return recipeCategoryId;
	}

	public void setRecipeCategoryId(Integer recipeCategoryId) {
		this.recipeCategoryId = recipeCategoryId;
	}

	@Override
	public String toString() {
		return "Recipe [recipeId=" + recipeId + ", recipeName=" + recipeName + ", imgPath=" + imgPath
				+ ", recipeDescription=" + recipeDescription + ", cookTime=" + cookTime + ", howManyPeople="
				+ howManyPeople + ", userId=" + userId + ", recipeLikes=" + recipeLikes + ", recipeCategoryId="
				+ recipeCategoryId + ", ingredients=" + ingredients + ", steps=" + steps + "]";
	}

	

}

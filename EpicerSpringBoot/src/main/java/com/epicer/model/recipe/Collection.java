package com.epicer.model.recipe;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "recipeCollection")
@Component
public class Collection {
	
	@Id @Column(name = "collectionid") @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int collectionId;
	@Column(name = "userid")
	private int userId;
	@Column(name = "recipeid")
	private int recipeId;
	public int getCollectionId() {
		return collectionId;
	}
	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public Collection(int userId, int recipeId) {
		super();
		this.userId = userId;
		this.recipeId = recipeId;
	}
	public Collection() {
		super();
	}
}

package com.epicer.model.recipe;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "recipeCategories")
@Component
public class Category {
	@Id
	@Column(name = "categoryid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categoryId;
	@Column(name = "categoryname")
	private String categoryName;
	@Column(name = "categorydescription")
	private String categoryDescriptionString;
	@Column(name = "categoryimage")
	private String categoryImg;
	
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDescriptionString() {
		return categoryDescriptionString;
	}
	public void setCategoryDescriptionString(String categoryDescriptionString) {
		this.categoryDescriptionString = categoryDescriptionString;
	}
	public Category(String categoryName, String categoryDescriptionString) {
		super();
		this.categoryName = categoryName;
		this.categoryDescriptionString = categoryDescriptionString;
	}
	public Category() {
		super();
	}
	public String getCategoryImg() {
		return categoryImg;
	}
	public void setCategoryImg(String categoryImg) {
		this.categoryImg = categoryImg;
	}
	
	
	
	
	
}

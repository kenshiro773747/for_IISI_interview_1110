package com.epicer.service.recipe;

import org.springframework.data.jpa.repository.JpaRepository;

import com.epicer.model.recipe.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{

	public Category queryByCategoryId(Integer categoryId);
	
}

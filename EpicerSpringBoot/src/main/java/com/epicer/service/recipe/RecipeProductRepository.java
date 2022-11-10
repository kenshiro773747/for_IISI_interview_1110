package com.epicer.service.recipe;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Recipe;
import com.epicer.model.recipe.RecipeProduct;

public interface RecipeProductRepository  extends JpaRepository<RecipeProduct, Integer>{
	@Query(value = "select * from recipe_product where recipeid  = :id",nativeQuery = true)
	public List<RecipeProduct> findList(@Param("id")Integer recipeId);
}

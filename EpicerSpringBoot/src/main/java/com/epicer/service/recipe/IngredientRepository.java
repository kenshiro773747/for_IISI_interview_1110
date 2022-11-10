package com.epicer.service.recipe;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Ingredients;

public interface IngredientRepository extends JpaRepository<Ingredients, Integer>{
	@Query(value = "select * from recipe_Ingredients where recipeid  = :id",nativeQuery = true)
	public List<Ingredients> queryIngredientsByRecipeId (@Param("id")Integer id);
}

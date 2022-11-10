package com.epicer.service.recipe;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Category;
import com.epicer.model.recipe.Recipe;


public interface RecipeRepository extends JpaRepository<Recipe, Integer>{
	public List<Recipe> findByRecipeName(String recipeName);
//	@Query( value = "select * from recipe where userid  = :id",nativeQuery = true)
	public List<Recipe> findListByUserId( Integer userId);
	
	public List<Recipe> findListByRecipeCategoryId(Integer categoryId);
	@Query(value = "from Recipe where recipename like concat('%',?1,'%')")
	public List<Recipe> findListByKeyword(String recipeName);
	

}

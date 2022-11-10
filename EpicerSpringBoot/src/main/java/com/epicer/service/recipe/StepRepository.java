package com.epicer.service.recipe;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Step;

public interface StepRepository extends JpaRepository<Step, Integer>{

	@Query( value = "select * from recipe_step where recipeid  = :id",nativeQuery = true)
	public List<Step> queryStepsByRecipeId(@Param("id") Integer id);
}

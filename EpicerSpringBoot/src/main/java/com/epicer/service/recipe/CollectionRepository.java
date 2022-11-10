package com.epicer.service.recipe;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Collection;

public interface CollectionRepository extends JpaRepository<Collection, Integer> {
@Query(value = "select * from recipe_collection where userid=:userid AND recipeid=:recipeid",nativeQuery = true)
public  Optional<Collection> queryCollection(@Param("userid")Integer userId,@Param("recipeid") Integer recipeId);

@Query(value = "select * from recipe_collection where userid=:userid ",nativeQuery = true)
public List<Collection> queryUserCollection(@Param("userid")Integer userId);
}

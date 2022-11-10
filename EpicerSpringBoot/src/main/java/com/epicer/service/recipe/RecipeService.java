package com.epicer.service.recipe;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.html.HTMLTableColElement;

import com.epicer.model.recipe.Category;
import com.epicer.model.recipe.Collection;
import com.epicer.model.recipe.Ingredients;
import com.epicer.model.recipe.Recipe;
import com.epicer.model.recipe.RecipeProduct;
import com.epicer.model.recipe.Step;


@Service @Transactional
public class RecipeService {
	@Autowired
	private RecipeRepository recipeRepository;
	@Autowired
	private IngredientRepository ingredientRepository;
	@Autowired
	private StepRepository stepRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CollectionRepository collectionRepository;
	@Autowired
	private RecipeProductRepository recipeProductRepository;
	
	public List<RecipeProduct> findRecommandList(Integer recipeId){
		List<RecipeProduct> recommandList = recipeProductRepository.findList(recipeId);
		return recommandList;
	}
	
	public List<Collection> queryUserCollections(Integer userId){
		List<Collection> collection = collectionRepository.queryUserCollection(userId);
		return collection;
		
	}
	public void deleteSteps(List<Step> step) {
		stepRepository.deleteAll(step);
	}
	public void deleteIngredient(List<Ingredients>ingredientsSet) {
		ingredientRepository.deleteAll(ingredientsSet);
	}
	
	public void deleteCollection(Collection collection) {
		collectionRepository.delete(collection);
	}
	
	public void insertCollection(Collection collection) {
		collectionRepository.save(collection);
	}
	public boolean addCollection(Integer userId,Integer recipeId) {
		Optional<Collection> collection = collectionRepository.queryCollection(userId, recipeId);
		return collection.isPresent();
	}
	public Optional<Collection> queryCollection(Integer userId,Integer recipeId){
		Optional<Collection> queryCollection = collectionRepository.queryCollection(userId, recipeId);
		return queryCollection;
	}
	
	public void addRecipe(Recipe recipeBean,Set<Ingredients> ingredientsSet, Set<Step> stepSet) {
		Iterator<Ingredients> iterator = ingredientsSet.iterator();
		while(iterator.hasNext()) {
			Ingredients ingredientsBean = iterator.next();
			ingredientsBean.setRecipeBean(recipeBean);
		}
		Iterator<Step> stepIterator = stepSet.iterator();
		while(stepIterator.hasNext()) {
			Step step = stepIterator.next();
			step.setRecipeBean(recipeBean);
		}
		recipeBean.setIngredients(ingredientsSet);
		recipeBean.setSteps(stepSet);
		recipeRepository.save(recipeBean);
	}
	public void deleteRecipe(Integer id) {
		recipeRepository.deleteById(id);
	}
	
	public List<Recipe> queryAll(){
		return recipeRepository.findAll();
	}
	
	public List<Recipe> queryByName(String name){
		System.out.println(name);
		List<Recipe> queryByRecipeName = recipeRepository.findListByKeyword(name);
		System.out.println(queryByRecipeName.size());
		return queryByRecipeName;
	}
	
	public Recipe queryById(Integer id) {
		return recipeRepository.getReferenceById(id);
	}
	public List<Ingredients> queryIngredientsByRecipeId(Integer id){
		return	ingredientRepository.queryIngredientsByRecipeId(id);
	}
	public List<Step> queryStepsByRecipeId(Integer id){
		return stepRepository.queryStepsByRecipeId(id);
	}
	
	public List<Recipe> queryByUserId(Integer userId){
		return recipeRepository.findListByUserId(userId);
	}
	
	public List<Recipe> queryByCategoryId(Integer categoryId){
		return recipeRepository.findListByRecipeCategoryId(categoryId);
	}
	public Category queryCategory(Integer categoryId) {
		return categoryRepository.queryByCategoryId(categoryId);
	}
	
	public void addStep(Step step) {
		stepRepository.save(step);
	}
	public void addIngredient(Ingredients infIngredients) {
		ingredientRepository.save(infIngredients);
	}
	public void insertRecipe(Recipe recipe) {
		recipeRepository.save(recipe);
	}
	}
	
	


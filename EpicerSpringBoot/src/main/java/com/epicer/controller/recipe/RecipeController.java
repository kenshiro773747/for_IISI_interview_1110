package com.epicer.controller.recipe;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.validation.Valid;

import org.apache.jasper.compiler.NewlineReductionServletWriter;
import org.hibernate.dialect.MyISAMStorageEngine;
import org.hibernate.usertype.UserCollectionType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.product.Product;
import com.epicer.model.recipe.Category;
import com.epicer.model.recipe.Collection;
import com.epicer.model.recipe.Ingredients;
import com.epicer.model.recipe.Recipe;
import com.epicer.model.recipe.RecipeProduct;
import com.epicer.model.recipe.Step;
import com.epicer.service.product.ProductService;
import com.epicer.service.recipe.RecipeService;

import freemarker.ext.beans._EnumModels;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private ProductService productService;
	
	@GetMapping(path = "/front")
	public String frontString () {
		
		return "recipe/NewCategories";
	}
	@GetMapping(path = "/frontpartial")
	public String front () {
		return "frontframeblankpgs/recipeUserRecipe";
	}
	@GetMapping(path = "/coll")
	public String collection () {
		return "frontframeblankpgs/recipeUserCollection";
	}
	@GetMapping(path = "/front1")
	public String front1 () {
		return "recipe/FrontAdd";
	} 
	@GetMapping(path = "/userCollection/{userId}")
	public String userCollection(@PathVariable("userId") Integer userId,Model model) {
		List<Collection> collections = recipeService.queryUserCollections(userId);
		List<Recipe> userCollections = new LinkedList<Recipe>(); 
		for(Collection collection:collections) {
			int recipeId = collection.getRecipeId();
			Recipe recipe = recipeService.queryById(recipeId);
			userCollections.add(recipe);
		}
		model.addAttribute("userCollections",userCollections);
		return "frontframeblankpgs/recipeUserCollection";
	}
	
	
	@PostMapping(path = "/like") @ResponseBody
	public String like (Integer userId,Integer recipeId) {
		System.out.println(userId+"recipeID"+recipeId);
		Collection collection = new Collection(userId, recipeId);
		recipeService.insertCollection(collection);
		return "0";
	}
	@PostMapping(path = "/unlike") @ResponseBody
	public String unlike (Integer userId,Integer recipeId) {
		System.out.println(userId+"recipeID"+recipeId);
		Optional<Collection> queryCollection = recipeService.queryCollection(userId, recipeId);
		Collection collection = queryCollection.get();
		recipeService.deleteCollection(collection);
		return "1";
	}
	@PostMapping(path = "/checkCollection") @ResponseBody
	public String checkCollection (Integer userId,Integer recipeId) {
		System.out.println(userId+"recipeID"+recipeId);
		boolean collectionResult = recipeService.addCollection(userId, recipeId);
		System.out.println(collectionResult);
		if (collectionResult) {
			//代表存在所以要取消收藏
			return "0";
		}
		return "1";
	}
	
	

	@PostMapping(path = "/addByBinding")
	public String addRecipeByBinding(@Valid Recipe recipe ,BindingResult bindingResult ,Model model,@RequestParam("file1") MultipartFile mf) throws IllegalStateException, IOException {
		System.out.println(recipe);
		if (bindingResult.hasErrors()) {
			FieldError nameError = bindingResult.getFieldError("recipeName");
			FieldError descriptionError = bindingResult.getFieldError("recipeDescription");
			model.addAttribute("nameError",nameError);
			model.addAttribute("descriptionError",descriptionError);
			return "recipe/NewAdd";
		}
		String filenameString = mf.getOriginalFilename();
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir=path +"webapp/WEB-INF/resources/images";

		String fileLocalPathString = "images/"+filenameString;
		File filePath = new File(saveFileDir, filenameString);
		mf.transferTo(filePath);
		return "redirect:/recipe";
	}
	@GetMapping(path = "/gooAdd")
	public String newAddPage() {
		return "recipe/FrontAdd";
	}
	
	
 	@GetMapping(path = "/userrecipe/{userId}") @ResponseBody
	public List<Recipe> queryByUserId(@PathVariable("userId") Integer userId ,Model model) {
		List<Recipe> queryAlList = recipeService.queryByUserId(userId);
	 return	queryAlList;
	}
  @GetMapping(path = "/categories/{categoryId}") @ResponseBody
  	public Object [] queryByCategoryId(@PathVariable("categoryId") Integer categoryId,Model model){
  		List<Recipe> queryByCate = recipeService.queryByCategoryId(categoryId);
  		Category category = recipeService.queryCategory(categoryId);
  		Object []  all= {queryByCate,category};
  		return all ;
  	}
  @GetMapping(path = "/categories")
  	public String showCategory() {
  		return "recipe/Category";
  	}
  
  
  @GetMapping(path = "/userrecipe")
  public String showUserRecipe() {
	  return "recipe/UserRecipeResult";
  }
  @GetMapping(path = "/recipeA")
  public String allRecipe() {
	  return "recipe/SearchAllByAjax";
  }
	
  @GetMapping(path = "/recipeAjax" ) @ResponseBody
	public List<Recipe> queryAllByAjax() {
		List<Recipe> queryAll = recipeService.queryAll();
		return queryAll;
	}
	
	@GetMapping(path = "/recipe" )
	public String queryAll(Model model) {
		List<Recipe> queryAll = recipeService.queryAll();
		model.addAttribute("searchAll", queryAll);
		return "recipe/SearchAllByAjax";
	}
	
	@GetMapping(path = "/recipelist" ) @ResponseBody
	public List<Recipe> queryList(@RequestParam(value="keyword")String keyword ) {
		List<Recipe> queryList = recipeService.queryByName(keyword);
		return queryList;
	}
	
	@GetMapping(path = "/reciperesult/{id}")
	public String queryForId(@PathVariable("id") Integer id,Model model) {
		Recipe recipe = recipeService.queryById(id);
		List<Ingredients> ingredients = recipeService.queryIngredientsByRecipeId(id);
		List<Step> steps=recipeService.queryStepsByRecipeId(id);
		model.addAttribute("recipe",recipe);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("step", steps);
		List<RecipeProduct> allProduct = recipeService.findRecommandList(id);
		List<Product> productList = new LinkedList<Product>();
		for(RecipeProduct recipeProduct: allProduct) {
			Product product = productService.getById(recipeProduct.getProductId());
			productList.add(product);
		}
		model.addAttribute("product",productList);
		return "recipe/FrontRecipeRecsult";
	}
	
	@PostMapping(path = "/recipe")
	public String addRecipe(@Valid Recipe recipe,BindingResult bindingResult,
			@RequestParam(required = false) MultipartFile file1,@RequestParam("ingredient") String[] ingredients,
			@RequestParam("amount") String[]amounts,@RequestParam(required = false)MultipartFile [] stepimage
			,@RequestParam("step") String[] steps,Model model) throws  IOException {
		
		
		
		if (bindingResult.hasErrors()) {
			FieldError nameError = bindingResult.getFieldError("recipeName");
			FieldError descriptionError = bindingResult.getFieldError("recipeDescription");
			System.out.println(descriptionError);
			model.addAttribute("nameError",nameError);
			model.addAttribute("descriptionError",descriptionError);
			return "recipe/FrontAdd";
		}
		String filenameString = file1.getOriginalFilename();
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir=path +"webapp/WEB-INF/resources/images";		
		String fileLocalPathString = "images/"+filenameString;
		File filePath = new File(saveFileDir, filenameString);
		recipe.setImgPath(fileLocalPathString);
		file1.transferTo(filePath);
		List<String> stepsImg =new ArrayList<String>();
		for(MultipartFile smf: stepimage) {
			String stepFileName = smf.getOriginalFilename();
			String stepSaveFileDirString = path +"webapp/WEB-INF/resources/images/recipeSteps";
			String stepFileLocalPathString = "images/recipeSteps/"+stepFileName;
			File stepFilePath = new File(stepSaveFileDirString, stepFileName);
			smf.transferTo(stepFilePath);
			stepsImg.add(stepFileLocalPathString);
		}
		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
		for(int i=0;i<ingredients.length;i++) {
			Ingredients ingredientsBean = new Ingredients();
			ingredientsBean.setIngredient(ingredients[i]);
			ingredientsBean.setAmount(amounts[i]);
			ingredientsSet.add(ingredientsBean);
		}
		Set<Step> stepSet=new LinkedHashSet<Step>();
		for(int i=0;i<steps.length;i++) {
			Step step = new Step();
			step.setStep(steps[i]);
			step.setStepImage(stepsImg.get(i));
			stepSet.add(step);
		}
		recipeService.addRecipe(recipe, ingredientsSet, stepSet);
		
		return "redirect:/frontpartial";
	}

	
	
	@GetMapping(path = "/recipeForUpdate/{id}")
	public String beforeUpdate(@PathVariable("id") Integer id, Model model) {
		Recipe recipe = recipeService.queryById(id);
		List<Ingredients> ingredients = recipeService.queryIngredientsByRecipeId(id);
		List<Step> steps = recipeService.queryStepsByRecipeId(id);
		model.addAttribute("recipe", recipe);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("step", steps);
		
		return "recipe/NewUpdate";
	}
	@GetMapping(path = "/recipeOneClick")
	public String oneClick (Model model) {
		Recipe recipe = recipeService.queryById(1034);
		List<Ingredients> ingredients = recipeService.queryIngredientsByRecipeId(1034);
		List<Step> steps = recipeService.queryStepsByRecipeId(1034);
		model.addAttribute("recipe", recipe);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("step", steps);
		
		return "recipe/OneClick";
	}
	@PostMapping(path = "/recipeOneClickAdd")
	public String recipeOneClickAdd(Recipe recipe,@RequestParam(required = false) MultipartFile file1,@RequestParam("ingredient") String[] ingredients,
			@RequestParam("amount") String[]amounts,@RequestParam(required = false)MultipartFile [] stepimage
			,@RequestParam("step") String[] steps,@RequestParam("stepIndex")String[] index,Model model) {
		Recipe queryRecipe = recipeService.queryById(1034);
		List<Step> stepSets = recipeService.queryStepsByRecipeId(1034);
		List<Ingredients> ingredientsList = recipeService.queryIngredientsByRecipeId(1034);
		recipe.setImgPath(queryRecipe.getImgPath());
		List<String> stepsImg =new ArrayList<String>();
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		for(Step smf: stepSets) {
			stepsImg.add(smf.getStepImage());
		}
		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
		for(int i=0;i<ingredients.length;i++) {
			Ingredients ingredientsBean = new Ingredients();
			ingredientsBean.setIngredient(ingredients[i]);
			ingredientsBean.setAmount(amounts[i]);
			ingredientsSet.add(ingredientsBean);
		}
		Set<Step> stepSet=new LinkedHashSet<Step>();
		for(int i=0;i<steps.length;i++) {
			Step step = new Step();
			step.setStep(steps[i]);
			step.setStepImage(stepsImg.get(i));
			stepSet.add(step);
		}
		recipeService.deleteRecipe(1034);
		recipeService.addRecipe(recipe, ingredientsSet, stepSet);
		return "redirect:/frontpartial";
	}
//	@RequestParam("file1") MultipartFile mf
//	@PostMapping(path = "/recipeupdate")
//	public String update(@Valid Recipe recipe,BindingResult bindingResult,
//			@RequestParam(required = false) MultipartFile file1,@RequestParam("ingredient") String[] ingredients,
//			@RequestParam("amount") String[]amounts,@RequestParam(required = false)MultipartFile [] stepimage
//			,@RequestParam("step") String[] steps,Model model) throws IllegalStateException, IOException {
//		String filenameString = file1.getOriginalFilename();
//		System.out.println(filenameString);
//		String localString = this.getClass().getClassLoader().getResource("").getPath();
//		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
//		String saveFileDir=path +"webapp/WEB-INF/resources/images";
//
//		String fileLocalPathString = "images/" + filenameString;
//		System.out.println(fileLocalPathString);
//		File filePath = new File(saveFileDir, filenameString);
//		file1.transferTo(filePath);
//		recipeService.deleteRecipe(id);
//		Recipe recipeBean = new Recipe(name, fileLocalPathString, description, time, howMany);
//		recipeBean.setUserId(userId);
//		recipeBean.setRecipeLikes(18);
//		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
//		for (int i = 0; i < ingredients.length; i++) {
//			Ingredients ingredientsBean = new Ingredients();
//			ingredientsBean.setIngredient(ingredients[i]);
//			ingredientsBean.setAmount(amounts[i]);
//			ingredientsBean.setRecipeBean(recipeBean);
//			ingredientsSet.add(ingredientsBean);
//		}
//		Set<Step> stepSet = new LinkedHashSet<Step>();
//		for (int i = 0; i < steps.length; i++) {
//			Step step = new Step();
//			step.setStep(steps[i]);
//			step.setRecipeBean(recipeBean);
//			stepSet.add(step);
//		}
//		recipeBean.setIngredients(ingredientsSet);
//		recipeBean.setSteps(stepSet);
//		recipeService.addRecipe(recipeBean, ingredientsSet, stepSet);
//		return "redirect:/recipe";
//	}
	
	@PostMapping(path = "/recipeupdate")
	public String update(@Valid Recipe recipe,BindingResult bindingResult,
			@RequestParam(required = false) MultipartFile file1,@RequestParam("ingredient") String[] ingredients,
			@RequestParam("amount") String[]amounts,@RequestParam(required = false)MultipartFile [] stepimage
			,@RequestParam("step") String[] steps,@RequestParam("stepIndex")String[] index,Model model) throws IllegalStateException, IOException {
		
		
		if (bindingResult.hasErrors()) {
			FieldError nameError = bindingResult.getFieldError("recipeName");
			FieldError descriptionError = bindingResult.getFieldError("recipeDescription");
			System.out.println(descriptionError);
			model.addAttribute("nameError",nameError);
			model.addAttribute("descriptionError",descriptionError);
			return "recipe/NewUpdate";
		}
		List<String> strList = new ArrayList<String>();
		for(String str: index) {
			if (!str.isEmpty()) {
				strList.add(str);
			}
		}
		List<MultipartFile> mfList =  new ArrayList<MultipartFile>();
		for(MultipartFile mf:stepimage) {
			if (!mf.isEmpty()) {
				System.out.println("stepimage");
				mfList.add(mf);
			}
		}
		List<String> stepsImg =new ArrayList<String>();
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		Recipe queryRecipe = recipeService.queryById(recipe.getRecipeId());
		List<Step> stepSets = recipeService.queryStepsByRecipeId(recipe.getRecipeId());
		List<Ingredients> ingredientsList = recipeService.queryIngredientsByRecipeId(recipe.getRecipeId());
		Integer y =0;
		if(file1.isEmpty() && strList.size()<steps.length ) {
			
			System.out.println("step1");
			///////////////////如果照片都沒動///////////////////////////
			if(strList.size()==0) {
				System.out.println("step2");
				recipe.setImgPath(queryRecipe.getImgPath());
				for(Step smf: stepSets) {
					stepsImg.add(smf.getStepImage());
				}
				Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
				for(int i=0;i<ingredients.length;i++) {
					Ingredients ingredientsBean = new Ingredients();
					ingredientsBean.setIngredient(ingredients[i]);
					ingredientsBean.setAmount(amounts[i]);
					ingredientsSet.add(ingredientsBean);
				}
				Set<Step> stepSet=new LinkedHashSet<Step>();
				for(int i=0;i<steps.length;i++) {
					Step step = new Step();
					step.setStep(steps[i]);
					step.setStepImage(stepsImg.get(i));
					stepSet.add(step);
				}
				recipeService.deleteSteps(stepSets);
				recipeService.deleteIngredient(ingredientsList);
				recipeService.addRecipe(recipe, ingredientsSet, stepSet);
				return "redirect:/frontpartial";
			}
			////////////如果步驟照片有動//////////
			System.out.println("step3");
			recipe.setImgPath(queryRecipe.getImgPath());
			
			for(Step smf: stepSets) {
				stepsImg.add(smf.getStepImage());
			}
			
			for(String string :strList) {
				
					Integer x=Integer.parseInt(string);
					String originalFilename = mfList.get(y).getOriginalFilename();
					
					String stepFileLocalPathString = "images/recipeSteps/"+originalFilename;
					String stepSaveFileDirString = path +"webapp/WEB-INF/resources/images/recipeSteps";	
					File stepFile = new File(stepSaveFileDirString,originalFilename);
					System.out.println(y);
					System.out.println(stepSaveFileDirString);
					System.out.println(originalFilename);
					mfList.get(y).transferTo(stepFile);
					System.out.println("456");
					stepsImg.set((x-1), stepFileLocalPathString);
					y++;
					
				
			}
			Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
			for(int i=0;i<ingredients.length;i++) {
				Ingredients ingredientsBean = new Ingredients();
				ingredientsBean.setIngredient(ingredients[i]);
				ingredientsBean.setAmount(amounts[i]);
				ingredientsSet.add(ingredientsBean);
			}
			Set<Step> stepSet=new LinkedHashSet<Step>();
			for(int i=0;i<steps.length;i++) {
				Step step = new Step();
				step.setStep(steps[i]);
				step.setStepImage(stepsImg.get(i));
				stepSet.add(step);
			}
			recipeService.deleteSteps(stepSets);
			recipeService.deleteIngredient(ingredientsList);
			recipeService.addRecipe(recipe, ingredientsSet, stepSet);
			return "redirect:/frontpartial";
	}
		if(strList.size()==0) {
			System.out.println("step4");
			////////////////如果食譜照片換了但步驟沒換/////////////////
			String filenameString = file1.getOriginalFilename();
			String saveFileDir=path +"webapp/WEB-INF/resources/images";		
			String fileLocalPathString = "images/"+filenameString;
			File filePath = new File(saveFileDir, filenameString);
			recipe.setImgPath(fileLocalPathString);
			file1.transferTo(filePath);
			Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
			
			for(Step smf: stepSets) {
				stepsImg.add(smf.getStepImage());
			}
			
			for(int i=0;i<ingredients.length;i++) {
				Ingredients ingredientsBean = new Ingredients();
				ingredientsBean.setIngredient(ingredients[i]);
				ingredientsBean.setAmount(amounts[i]);
				ingredientsSet.add(ingredientsBean);
			}
			Set<Step> stepSet=new LinkedHashSet<Step>();
			for(int i=0;i<steps.length;i++) {
				Step step = new Step();
				step.setStep(steps[i]);
				step.setStepImage(stepsImg.get(i));
				stepSet.add(step);
			}
			recipeService.deleteSteps(stepSets);
			recipeService.deleteIngredient(ingredientsList);
			recipeService.addRecipe(recipe, ingredientsSet, stepSet);
			return "redirect:/frontpartial";
		}
		/////////如果都換//////////////////
		System.out.println("step5");
		String filenameString = file1.getOriginalFilename();
		String saveFileDir=path +"webapp/WEB-INF/resources/images";		
		String fileLocalPathString = "images/"+filenameString;
		File filePath = new File(saveFileDir, filenameString);
		recipe.setImgPath(fileLocalPathString);
		file1.transferTo(filePath);
		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
		
		for(Step smf: stepSets) {
			stepsImg.add(smf.getStepImage());
		}
		
		for(String string :strList) {
			Integer x=Integer.parseInt(string);
			String originalFilename = mfList.get(y).getOriginalFilename();
			String stepFileLocalPathString = "images/recipeSteps/"+originalFilename;
			String stepSaveFileDirString = path +"webapp/WEB-INF/resources/images/recipeSteps";	
			File stepFile = new File(stepSaveFileDirString,originalFilename);
			mfList.get(y).transferTo(stepFile);
			stepsImg.set((x-1), stepFileLocalPathString);
			y++;
			
		}
		for(int i=0;i<ingredients.length;i++) {
			Ingredients ingredientsBean = new Ingredients();
			ingredientsBean.setIngredient(ingredients[i]);
			ingredientsBean.setAmount(amounts[i]);
			ingredientsSet.add(ingredientsBean);
		}
		Set<Step> stepSet=new LinkedHashSet<Step>();
		for(int i=0;i<steps.length;i++) {
			Step step = new Step();
			step.setStep(steps[i]);
			step.setStepImage(stepsImg.get(i));
			stepSet.add(step);
		}
		recipeService.deleteSteps(stepSets);
		recipeService.deleteIngredient(ingredientsList);
		recipeService.addRecipe(recipe, ingredientsSet, stepSet);
		
		
		return "redirect:/frontpartial";
		}
//		String filenameString = file1.getOriginalFilename();
//		String saveFileDir=path +"webapp/WEB-INF/resources/images";		
//		String fileLocalPathString = "images/"+filenameString;
//		File filePath = new File(saveFileDir, filenameString);
//		recipe.setImgPath(fileLocalPathString);
//		file1.transferTo(filePath);
//		
//		for(MultipartFile smf: stepimage) {
//			String stepFileName = smf.getOriginalFilename();
//			String stepSaveFileDirString = path +"webapp/WEB-INF/resources/images/recipeSteps";
//			String stepFileLocalPathString = "images/recipeSteps/"+stepFileName;
//			File stepFilePath = new File(stepSaveFileDirString, stepFileName);
//			smf.transferTo(stepFilePath);
//			stepsImg.add(stepFileLocalPathString);
//		}
//		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
//		for(int i=0;i<ingredients.length;i++) {
//			Ingredients ingredientsBean = new Ingredients();
//			ingredientsBean.setIngredient(ingredients[i]);
//			ingredientsBean.setAmount(amounts[i]);
//			ingredientsSet.add(ingredientsBean);
//		}
//		Set<Step> stepSet=new LinkedHashSet<Step>();
//		for(int i=0;i<steps.length;i++) {
//			Step step = new Step();
//			step.setStep(steps[i]);
//			step.setStepImage(stepsImg.get(i));
//			stepSet.add(step);
//		}
//		recipeService.addRecipe(recipe, ingredientsSet, stepSet);
//		
//		return "redirect:/recipe";
//	}
	
	@PostMapping("/recipedelete/{id}")
	public String remove(@PathVariable("id") Integer id) {
		
		recipeService.deleteRecipe(id);
		
		return "redirect:/frontpartial";
	}
	 
	
	
}

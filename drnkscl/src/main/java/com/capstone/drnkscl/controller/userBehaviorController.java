package com.capstone.drnkscl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.drnkscl.dao.IngredientDAO;
import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.Recipe_IngredientDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.dao.UserRoleDAO;
import com.capstone.drnkscl.entity.Ingredient;
import com.capstone.drnkscl.entity.Recipe;
import com.capstone.drnkscl.entity.Recipe_ingredient;
import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.form.NewDrinkForm;
import com.capstone.drnkscl.security.AuthenticatedUserService;
import com.capstone.drnkscl.util.AddIngredientUtil;

@Controller
public class userBehaviorController {
	
	@Autowired
	private AddIngredientUtil addIngredientUtil;
	
	@Autowired
	private AuthenticatedUserService authService;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private Recipe_IngredientDAO recipeIngredientDAO;
	
	@Autowired 
	private RecipeDAO recipeDAO;
	
	@Autowired
	private IngredientDAO ingredientDAO;
	
	@RequestMapping(value = {"/user/newDrink"}, method = RequestMethod.GET)
	public ModelAndView addNewRecipe(NewDrinkForm newDrink) {
		ModelAndView response = new ModelAndView();
		response.setViewName("/drnks/newDrink");
		return response;
	}
	
	@RequestMapping(value = {"/user/newDrink"}, method = RequestMethod.POST)
	public ModelAndView addNewRecipeSubmit(NewDrinkForm newDrink) {
		ModelAndView response = new ModelAndView();
		response.setViewName("/drnks/newDrink");
		
		User user = authService.getCurrentUser();
		
		Recipe recipe = new Recipe();
		
		ArrayList<String> ingredients = addIngredientUtil.ejectNullValues(newDrink.getIngredientName());
		ArrayList<String> units = addIngredientUtil.ejectNullValues(newDrink.getUnit());
		ArrayList<Integer> amounts = addIngredientUtil.ejectNullValuesInt(newDrink.getAmount());
		
		recipe.setAuthor(user.getId());
		recipe.setName(newDrink.getName());
		recipe.setAvatar("/img/default.png");
		recipeDAO.save(recipe);
		
		for (int i = 0 ; i < ingredients.size(); i++) {
			boolean duplicate = addIngredientUtil.checkForDuplicateIngredients(ingredients.get(i));
			if (!duplicate) {
				Ingredient ingredient = new Ingredient();
				ingredient.setName(ingredients.get(i));
				ingredientDAO.save(ingredient);
			}
		}
		
		for (int i = 0; i < amounts.size(); i ++) {
			Recipe_ingredient entry = new Recipe_ingredient();
			List<Ingredient> y = ingredientDAO.findByNameIgnoreCase(ingredients.get(i));
			int ingredientId = y.get(0).getId();
			int a = amounts.get(i);
			String u = units.get(i);
			entry.setIngredientId(ingredientId);
			entry.setAmount(a);
			entry.setUnit(u);
			entry.setRecipeId(recipe.getId());
			
			recipeIngredientDAO.save(entry);			
		}

		System.out.println(user.toString());
		System.out.println(recipe.toString());
		
		return response;
	}
	
	@RequestMapping(value = {"/browse"}, method = RequestMethod.GET)
	public ModelAndView browseDrinks(@RequestParam(required=false) String searchDrink) {
		ModelAndView response = new ModelAndView();
		response.setViewName("browse");
		if (searchDrink == null) {
			List<Recipe> drinks = recipeDAO.getAllRecipes();
			ArrayList<HashMap<String, String>> drnks = addIngredientUtil.getMapListOfDrinksAndAuthors(drinks);
			response.addObject("drnks", drnks);
		} else {
			List<Recipe> drinks = recipeDAO.findByNameContainingIgnoreCase(searchDrink);
			ArrayList<HashMap<String, String>> drnks = addIngredientUtil.getMapListOfDrinksAndAuthors(drinks);
			response.addObject("drnks", drnks);
		}

		return response;
	}
	
	@RequestMapping(value = {"/replaceThisUrl"}, method = RequestMethod.GET)
	public ModelAndView showUserProfile() {
		ModelAndView response = new ModelAndView();
		List<User> users = userDAO.getUsersById();
		
		String fullName = users.get(0).getFirstName() + " " + users.get(0).getLastName();
		response.addObject("users", users);
		response.addObject("fullName", fullName);
		
		return response;
		
	}
	
	@RequestMapping(value = {"/drinkcard"}, method = RequestMethod.GET)
	public ModelAndView getDrinkCard(@RequestParam(required=true) String id) {
		ModelAndView response = new ModelAndView();
		response.setViewName("drinkcard");
		Integer integerId = Integer.parseInt(id);
		Recipe selectedDrink = addIngredientUtil.getDrinkObject(integerId);
		String ingredientList = addIngredientUtil.getFormattedIngredients(selectedDrink);
		response.addObject("selectedDrink", selectedDrink);
		response.addObject("ingredientList", ingredientList);
		
		return response;
	}
	

	
	@RequestMapping(value = {"/userProfilePicUpload"}, method = RequestMethod.GET)
	public ModelAndView uploadProfilePic() {
		ModelAndView response = new ModelAndView();
		response.setViewName("uploadProfilePic");
		return response;
	}
	
	
	@RequestMapping(value = {"/userProfilePicUploadSubmit"}, method = RequestMethod.POST)
	public ModelAndView uploadProfilePicSubmit(@RequestParam MultipartFile file) throws IOException {
		ModelAndView response = new ModelAndView();
		response.setViewName("/uploadProfilePic");
		User user = authService.getCurrentUser();
		File targetFile = new File("./src/main/resources/static/img/" + file.getOriginalFilename());
		FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
		String avatar = "/img/" + file.getOriginalFilename();
		user.setAvatar(avatar);
		userDAO.save(user);
		response.addObject("user", user);
		return response;
	}
}

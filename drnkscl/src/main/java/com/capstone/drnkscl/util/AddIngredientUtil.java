package com.capstone.drnkscl.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.capstone.drnkscl.dao.FavoriteDAO;
import com.capstone.drnkscl.dao.IngredientDAO;
import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.Recipe_IngredientDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.entity.Favorite;
import com.capstone.drnkscl.entity.Ingredient;
import com.capstone.drnkscl.entity.Recipe;
import com.capstone.drnkscl.entity.Recipe_ingredient;
import com.capstone.drnkscl.entity.User;


@Component
public class AddIngredientUtil {
	
	@Autowired
	private IngredientDAO ingredientDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private Recipe_IngredientDAO recipeIngredientDAO;
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private FavoriteDAO favoriteDAO;

	
	public ArrayList<String> ejectNullValues(String[] array){
		ArrayList<String> list = new ArrayList<String>();
		if (array.length < 1) {
			return list;
		} else {
			for (String s : array) {
				if (s != null && s.length() > 0) {
					list.add(s);
				}
			}
		}
		return list;
	}
	
	public ArrayList<Integer> ejectNullValuesInt(Integer[] array){
		ArrayList<Integer> list = new ArrayList<Integer>();
		if (array.length < 1) {
			return list;
		} else { 
			for (Integer s : array) {
				if (s != null ) {
					list.add(s);
				}
			}
		}
		return list;
	}
	
	public boolean checkForDuplicateIngredients(String name) {
		// get all 
		List<Ingredient> current = ingredientDAO.findByNameIgnoreCase(name);
		if (current.size() < 1) {
			return false;
		} else {
			for (Ingredient i : current) {
				String x = i.getName();
				if (x.toUpperCase().equals(name.toUpperCase())) {
					return true;
				}
			}
		}
		return false;
	}
	
	
	
	public String getUserName(Recipe drink){
		User user = userDAO.findById(drink.getAuthor());
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String fullName = "" + firstName + " " + lastName;
		return fullName;
	}
	
	public ArrayList <String> getUserNameListFromRecipes(List<Recipe> drinks){
		ArrayList<String> names = new ArrayList<String> ();
		for (Recipe drink : drinks) {
			String name = getUserName(drink);
			names.add(name);
		}
		return names;
	}
	
	public ArrayList <String> getDrinkNames(List<Recipe> drinks){
		ArrayList<String> names = new ArrayList<String> ();
		for (Recipe drink : drinks) {
			String name = drink.getName();
			names.add(name);
		}
		return names;
	}
	
	public ArrayList <String> getDrinkAvatar(List<Recipe> drinks){
		ArrayList<String> names = new ArrayList<String> ();
		for (Recipe drink : drinks) {
			String name = drink.getAvatar();
			names.add(name);
		}
		return names;
	}
	
	public ArrayList <String> getRecipeIds(List<Recipe> drinks){
		ArrayList<String> drinkIds = new ArrayList<String>();
		for (Recipe drink: drinks) {
			String drinkId = drink.getId().toString();
			drinkIds.add(drinkId);
		}
		return drinkIds;
	}
	
	public ArrayList<HashMap<String, String>> getMapListOfDrinksAndAuthors(List<Recipe> drinks){
		ArrayList<HashMap<String, String>> listOfMaps = new ArrayList<HashMap<String, String>>();
		ArrayList<String> drinkNames = getDrinkNames(drinks);
		ArrayList<String> authors = getUserNameListFromRecipes(drinks);
		ArrayList<String> avatars = getDrinkAvatar(drinks);
		ArrayList<String> drinkIds = getRecipeIds(drinks);
		for (int i = 0; i < drinks.size(); i ++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", drinkNames.get(i));
			map.put("author", authors.get(i));
			map.put("avatar", avatars.get(i));
			map.put("id", drinkIds.get(i));
			listOfMaps.add(map);
		}
		return listOfMaps;
	}
	
	
	public ArrayList<HashMap<String, String>> getMapListOfDrinks(Integer userId){
		ArrayList<HashMap<String, String>> listOfMaps = new ArrayList<HashMap<String, String>>();
		List<Recipe> userDrinks = recipeDAO.findRecipeByAuthor(userId);
		for (Recipe drink : userDrinks) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", drink.getName());
			map.put("id", drink.getId().toString());
			listOfMaps.add(map);
		}
		return listOfMaps;
	}

	
	public String getIngredientName (Recipe_ingredient drinkIng) {
		Ingredient ing = ingredientDAO.findById(drinkIng.getIngredientId());
		String name = ing.getName();
		return name;
	}
	
	public String getFormattedIngredients(Recipe drink) {
		List <Recipe_ingredient> ings = recipeIngredientDAO.findByRecipeId(drink.getId());
		String output = "";
		for (Recipe_ingredient ing: ings) {
			String ingredientName = getIngredientName(ing);
			output += "  |  " + ing.getAmount()  + " " + ing.getUnit() + " " + ingredientName;
		}
		
		return output;
	}
	
	public Recipe getDrinkObject(Integer id) {
		System.out.println(id);
		List<Recipe> drinks = recipeDAO.findById(id);
		return drinks.get(0);
	}
	
	public Integer getNumberOfUserDrinks(User user) {
		List<Recipe> userDrinks = recipeDAO.findRecipeByAuthor(user.getId());
		return userDrinks.size();
	}
	
	public Integer getNumberOfUserFansies(User user) {
		List<Recipe> userDrinks = recipeDAO.findRecipeByAuthor(user.getId());
		ArrayList<Favorite> userLikes = new ArrayList<Favorite>();
		for (Recipe drink : userDrinks) {
			List<Favorite> drinkLikes = favoriteDAO.findByDrinkId(drink.getId());
			for (Favorite like : drinkLikes) {
				userLikes.add(like);
			}
		}
		return userLikes.size();
	}
	
}























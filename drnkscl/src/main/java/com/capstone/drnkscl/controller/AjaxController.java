package com.capstone.drnkscl.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.drnkscl.dao.FavoriteDAO;
import com.capstone.drnkscl.dao.IngredientDAO;
import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.Recipe_IngredientDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.entity.Favorite;
import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.form.EditUserForm;
import com.capstone.drnkscl.security.AuthenticatedUserService;
import com.capstone.drnkscl.util.AddIngredientUtil;
import com.capstone.drnkscl.util.LikeUtil;

@Controller
public class AjaxController {
	
	@Autowired
	private LikeUtil likeUtil;
	@Autowired
	private FavoriteDAO favoriteDAO;
	@Autowired
	private IngredientDAO ingredientDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private Recipe_IngredientDAO recipeIngredientDAO;
	@Autowired
	private AuthenticatedUserService authService;
	@Autowired
	private AddIngredientUtil addIngredientUtil;
	
	@RequestMapping(value = {"/ajax"}, method = RequestMethod.GET)
	public ModelAndView ajax() {
		ModelAndView response = new ModelAndView();
		response.setViewName("ajax");
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/ajaxCall"}, method = RequestMethod.GET)
	public String ajaxCall(@RequestParam String clickedValue) {
		User user = authService.getCurrentUser();
		return user.getFirstName() + " has selected " + clickedValue;
	
	}
	
	@ResponseBody
	@RequestMapping(value = {"/likeDrink"}, method = RequestMethod.GET)
	public void likeADrink(@RequestParam int drinkId) {
		User user = authService.getCurrentUser();
		boolean duplicate = likeUtil.isDuplicateLike(user, drinkId);
		if (!duplicate) {
			Favorite userLike = new Favorite();
			userLike.setDrinkId(drinkId);
			userLike.setUserId(user.getId());
			favoriteDAO.save(userLike);
		}
	}
	
	
	@RequestMapping(value = {"/editUser"}, method = RequestMethod.GET)
	public ModelAndView editUser(EditUserForm form) {
		ModelAndView response = new ModelAndView();
		response.setViewName("editUser");
		
		User currentUser = authService.getCurrentUser();
		
		String firstName = currentUser.getFirstName();
		String lastName = currentUser.getLastName();
		String email = currentUser.getEmail();
		String password = currentUser.getPassword();
		String alias = currentUser.getAlias();
		
		response.addObject("firstName", firstName);
		response.addObject("lastName", lastName);
		response.addObject("email", email);
		response.addObject("password", password);
		response.addObject("alias", alias);
		
		return response;
	}
	@RequestMapping(value = {"/editUserPost"}, method = RequestMethod.POST)
	public ModelAndView editUserSubmit(EditUserForm form) {
		ModelAndView response = new ModelAndView();
		response.setViewName("profile");
		User currentUser = authService.getCurrentUser();
		if (!StringUtils.isBlank(form.getFirstName())) {
			currentUser.setFirstName(form.getFirstName());
		}
		if (!StringUtils.isBlank(form.getLastName())) {
			currentUser.setLastName(form.getLastName());
		}
		if (!StringUtils.isBlank(form.getAlias())) {
			String newAlias = "@" + form.getAlias();
			currentUser.setAlias(newAlias);
		}
		if (!StringUtils.isBlank(form.getEmail())) {
			currentUser.setEmail(form.getEmail());
		}
	
		String fullName = currentUser.getFirstName() + " " + currentUser.getLastName();
		
		Integer numberOfUserDrinks = addIngredientUtil.getNumberOfUserDrinks(currentUser);
		Integer numberOfUserFancies = addIngredientUtil.getNumberOfUserFansies(currentUser);
		
		ArrayList<HashMap<String, String>> userDrinks = addIngredientUtil.getMapListOfDrinks(currentUser.getId());
		
		response.addObject("fullName", fullName);
		
		response.addObject("user", currentUser);
		
		response.addObject("userDrinks", userDrinks);
		
		response.addObject("numberOfUserDrinks", numberOfUserDrinks);
		
		response.addObject("numberOfUserFansies", numberOfUserFancies);
		                                                      
		return response;
	}

	
}

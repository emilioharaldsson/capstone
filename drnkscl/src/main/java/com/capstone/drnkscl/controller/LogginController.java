package com.capstone.drnkscl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.dao.UserRoleDAO;
import com.capstone.drnkscl.entity.Recipe;
import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.entity.UserRole;
import com.capstone.drnkscl.form.CreateRecipeForm;
import com.capstone.drnkscl.form.CreateUserForm;
import com.capstone.drnkscl.security.AuthenticatedUserService;
import com.capstone.drnkscl.security.UserDetailsServiceImpl;
import com.capstone.drnkscl.service.loginService;
import com.capstone.drnkscl.util.AddIngredientUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LogginController {
	
	
	@Autowired
	@Qualifier("passwordEncoder")
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AddIngredientUtil addIngredientUtil;
	
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private AuthenticatedUserService authService;
	
	@RequestMapping(value = {"/signup"}, method = RequestMethod.GET)
	public ModelAndView createUser(CreateUserForm form) {
		ModelAndView response = new ModelAndView();
		response.setViewName("signup");
		return response;
	}
	
	@RequestMapping(value = {"/signup"}, method = RequestMethod.POST)
	public ModelAndView createUserSubmit(@Valid CreateUserForm form, BindingResult bindingResult) {
		ModelAndView response = new ModelAndView();
		response.setViewName("signup");
		
		for(ObjectError e : bindingResult.getAllErrors()) {
			log.debug(e.getDefaultMessage());
		}
		
		if (!bindingResult.hasErrors()) {
			
		User user = new User();
		
		String encodedPassword = passwordEncoder.encode(form.getPassword());
		
		String aliasWithAmpersand = "@" + form.getAlias();

		user.setEmail(form.getEmail());
		user.setPassword(encodedPassword);
		user.setFirstName(form.getFirstName());
		user.setLastName(form.getLastName());
		user.setAlias(aliasWithAmpersand);
		user.setAvatar("/img/spock.png");
		userDAO.save(user);
		
		UserRole ur = new UserRole();
		ur.setRoleName("USER");
		ur.setUserId(user.getId());
		
		userRoleDAO.save(ur);
		
		} else {
			response.addObject("bindingResult", bindingResult);
			response.addObject("form", form);
		}
		return response;
	}
	



	
	@RequestMapping(value = {"/createRecipe"}, method = RequestMethod.GET)
	public ModelAndView createUserRecipes(CreateRecipeForm recipeForm) {
		ModelAndView response = new ModelAndView();
		response.setViewName("login_pages/create_recipe");
		return response;
		
	}
	
	@RequestMapping(value = {"/createRecipe"}, method = RequestMethod.POST)
	public ModelAndView createUserRecipesSubmit(CreateRecipeForm recipeForm) {
		ModelAndView response = new ModelAndView();
		response.setViewName("login_pages/create_recipe");
		
		Recipe recipe = new Recipe();
		recipe.setName(recipeForm.getName());
		recipe.setAuthor(recipeForm.getId());
		
		recipeDAO.save(recipe);
		return response;
	}
	
	@RequestMapping(value = {"/user/login"}, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView response = new ModelAndView();
		response.setViewName("logIn");
		return response;
	}
	
	@RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
	public ModelAndView seeProfile() {
		ModelAndView response = new ModelAndView();
		response.setViewName("profile");
		User currentUser = authService.getCurrentUser();
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

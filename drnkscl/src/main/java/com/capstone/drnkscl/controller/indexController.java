package com.capstone.drnkscl.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.entity.Recipe;
import com.capstone.drnkscl.security.AuthenticatedUserService;


@Controller
public class indexController {
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private AuthenticatedUserService authService;
	
	
	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public ModelAndView showHomePage() {
		ModelAndView response = new ModelAndView();
		response.setViewName("home");
		return response;
	}
	
	@RequestMapping(value = {"/index"}, method = RequestMethod.GET)
	public ModelAndView slash(@RequestParam(required=false) String search) {
		ModelAndView response = new ModelAndView();
		List<Recipe> recipes = recipeDAO.findByNameContainingIgnoreCase(search);
		response.setViewName("index");
		response.addObject("recipes", recipes);
		
		if (authService.isAuthenticated()) {
			boolean isAdmin = authService.isUserInRole("ADMIN");
			System.out.println( "CURRENT USER: " + authService.getCurrentUsername() + "\nAdmin User: " + isAdmin) ;
		}
		return response;
	}
	
	@RequestMapping(value = {"/recipe/getIngedrients"}, method = RequestMethod.GET)
	public ModelAndView getIngredients(@RequestParam(required=false) String drinkName) {
		ModelAndView response = new ModelAndView();
		
	
		Integer drinkId = recipeDAO.getIdFromName(drinkName);
		List<Map<String, Object>> recipeIngredients = recipeDAO.getIngredientListByRecipeId(drinkId);
		for (Map<String, Object> map : recipeIngredients){
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				
			}
		}
		
		
		response.setViewName("getIng");
		response.addObject("recipeIngredients", recipeIngredients);
//		response.addObject("drinkIngredients", drinkIngredients);
		return response;
	}
	
	@RequestMapping(value = {"/recipe/test"}, method = RequestMethod.GET)
	public ModelAndView getRecipeIdFromName(@RequestParam(required=false) String drinkName) {
		ModelAndView response = new ModelAndView();
		
		List<Recipe> recipes = recipeDAO.findByRecipeNameIgnoreCase(drinkName);
	
		response.setViewName("recipeTest");
		response.addObject("recipes", recipes);
		return response;
	}
	
	
	@RequestMapping(value = {"/fileupload"}, method = RequestMethod.GET)
	public ModelAndView fileUpload() {
		ModelAndView response = new ModelAndView();
		response.setViewName("fu");
		return response;
	}
	
	
	
	@RequestMapping(value = {"/fileuploadSubmit"}, method = RequestMethod.POST)
	public ModelAndView fileUploadSubmit(@RequestParam MultipartFile file) throws IOException {
		ModelAndView response = new ModelAndView();
		response.setViewName("fu");
		
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize() + " bytes");
		
		File targetFile = new File("./src/main/resources/static/img/" + file.getOriginalFilename());
		FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
		
		return response;
	}

}

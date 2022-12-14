package com.capstone.drnkscl.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.capstone.drnkscl.entity.Recipe;

public interface RecipeDAO extends JpaRepository<Recipe, Long>{
	public List<Recipe> findByNameContainingIgnoreCase(String name);
	
	@Query(value = "select ing.name, ri.amount, ri.unit from ingredient ing JOIN recipe_ingredient ri ON ing.id = ri.ingredient_id JOIN recipe r ON r.id = ri.recipe_id\n"
			+ "WHERE r.id = :recipeId", nativeQuery= true)
	public List<Map<String, Object>>getIngredientListByRecipeId(Integer recipeId);
	
	@Query("SELECT r FROM Recipe r where r.name= :recipeName")
	public List<Recipe> findByRecipeNameIgnoreCase(String recipeName);
	
	@Query("SELECT r.id FROM Recipe r where r.name= :recipeName")
	public Integer getIdFromName(String recipeName);
	
	@Query("SELECT r FROM Recipe r")
	public List<Recipe> getAllRecipes(); 
	
	public List<Recipe> findById(Integer id);
	
	@Query("SELECT r FROM Recipe r WHERE r.author = :authorId")
	public List<Recipe> findRecipeByAuthor(Integer authorId);
	
	
}
package com.capstone.drnkscl.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.capstone.drnkscl.entity.Recipe_ingredient;

public interface Recipe_IngredientDAO extends JpaRepository<Recipe_ingredient, Long>{
	@Query("SELECT ri FROM Recipe_ingredient ri where ri.recipeId = :recipeId")
	public List <Recipe_ingredient> findByRecipeId(int recipeId);
	
	
	
}

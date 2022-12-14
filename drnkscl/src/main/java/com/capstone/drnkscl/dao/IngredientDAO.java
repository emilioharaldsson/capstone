package com.capstone.drnkscl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.capstone.drnkscl.entity.Ingredient;

public interface IngredientDAO extends JpaRepository<Ingredient, Long>{
	public List<Ingredient> findByNameIgnoreCase(String name);
	
	@Query("SELECT i FROM Ingredient i WHERE i.id = :id")
	public Ingredient findById(Integer id);

}

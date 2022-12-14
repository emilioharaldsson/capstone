package com.capstone.drnkscl;

import org.hamcrest.collection.IsIterableContainingInOrder;
import org.junit.Assert;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.capstone.drnkscl.dao.IngredientDAO;
import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.Recipe_IngredientDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.entity.Recipe;
import com.capstone.drnkscl.entity.Recipe_ingredient;
import com.capstone.drnkscl.entity.User;
import java.util.List;
import java.util.Set;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.HashSet;

@RunWith(SpringRunner.class)
@SpringBootTest
class DrnksclApplicationTests {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private Recipe_IngredientDAO recipeIngredientDAO;
	
	
	@Test
	public void findByIdTest() {
		User expected = new User();
		expected.setId(3);
		expected.setAlias("@p_p_p_pokerFace");
		expected.setAvatar("/img/emilio.png");
		expected.setEmail("stephanh@vt.edu");
		expected.setFirstName("Emilio");
		expected.setLastName("Haraldsson");
		expected.setPassword("$2a$12$V9Kdn3mSzTNCN0G/OqqWbuq57g9JPsN/AUW6fhiYUeY/KHY9Etb2q");
		
		User actual = userDAO.findById(3);
		
		Assertions.assertEquals(expected, actual);
		Assertions.assertEquals(expected.getEmail(), actual.getEmail());
		Assertions.assertEquals(expected.getPassword(), actual.getPassword());
		Assertions.assertEquals(expected.getFirstName(), actual.getFirstName());
		Assertions.assertEquals(expected.getLastName(), actual.getLastName());
		Assertions.assertEquals(expected.getAlias(), actual.getAlias());
		Assertions.assertEquals(expected.getAvatar(), actual.getAvatar());
	}
	
	
	@SuppressWarnings("deprecation")
	@Test 
	public void findByRecipeAuthorTest() {
	
		Recipe r1 = new Recipe();
		Recipe r2 = new Recipe();
		
		r1.setAuthor(34);
		r1.setAvatar("/img/default.png");
		r1.setName("southern sour");
		r1.setId(73);
		
		r2.setAuthor(34);
		r2.setAvatar("/img/default.png");
		r2.setName("tipsy texas tea");
		r2.setId(72);

		
		
		List<Recipe> query = recipeDAO.findRecipeByAuthor(34);

		assertTrue(query.contains(r1));
		assertTrue(query.contains(r2));

		
	}

	@Test
	public void findByRecipeId() {
		List<Recipe_ingredient> expected = new ArrayList<Recipe_ingredient> ();
		Recipe_ingredient ri1 = new Recipe_ingredient();
		Recipe_ingredient ri2 = new Recipe_ingredient();
		
		ri1.setId(36);
		ri1.setRecipeId(52);
		ri1.setIngredientId(29);
		ri1.setAmount(6);
		ri1.setUnit("oz");
		
		ri2.setId(37);
		ri2.setRecipeId(52);
		ri2.setIngredientId(30);
		ri2.setAmount(6);
		ri2.setUnit("oz");
		
		expected.add(ri1);
		expected.add(ri2);
		
		List<Recipe_ingredient> actual = new ArrayList<Recipe_ingredient> ();
		List<Recipe_ingredient> query = recipeIngredientDAO.findByRecipeId(52);
		
		query.stream().forEach(q -> {
			actual.add(q);
		});
		
		Assert.assertArrayEquals(expected.toArray(), actual.toArray());
	}
}

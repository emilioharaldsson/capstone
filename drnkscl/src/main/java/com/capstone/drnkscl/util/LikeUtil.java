package com.capstone.drnkscl.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.capstone.drnkscl.dao.FavoriteDAO;
import com.capstone.drnkscl.dao.IngredientDAO;
import com.capstone.drnkscl.dao.RecipeDAO;
import com.capstone.drnkscl.dao.Recipe_IngredientDAO;
import com.capstone.drnkscl.dao.UserDAO;
import com.capstone.drnkscl.entity.Favorite;
import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.security.AuthenticatedUserService;

@Component
public class LikeUtil {
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
	
	public boolean isDuplicateLike(User user, Integer drinkId) {
		List<Favorite> currentDrinkLikes = favoriteDAO.findByUserId(user.getId());
		if (currentDrinkLikes.size() < 1) {
			return false;
		}
		for (Favorite like : currentDrinkLikes) {
			if(like.getDrinkId() == drinkId) {
				return true;
			}
		}
		return false;
	}
}



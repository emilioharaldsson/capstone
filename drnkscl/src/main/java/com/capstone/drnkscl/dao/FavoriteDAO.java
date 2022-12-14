package com.capstone.drnkscl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.capstone.drnkscl.entity.Favorite;

public interface FavoriteDAO extends JpaRepository<Favorite, Long> {
	@Query("SELECT f FROM Favorite f WHERE f.userId = :id")
	public List<Favorite> findByUserId(Integer id);
	
	@Query("SELECT f FROM Favorite f WHERE f.drinkId = :id")
	public List<Favorite> findByDrinkId(Integer id);
}

package com.capstone.drnkscl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.capstone.drnkscl.entity.User;

public interface UserDAO extends JpaRepository <User, Long>{
	
	@Query("SELECT u FROM User u WHERE u.id = :id")
	public User findById(Integer id);
	
	public User findByEmail(String email);
	
	@Query("SELECT u FROM User u")
	public List<User> getAllUsers();
	
	@Query("SELECT u FROM User u WHERE u.id = :id")
	List<User> getUsersById();
}

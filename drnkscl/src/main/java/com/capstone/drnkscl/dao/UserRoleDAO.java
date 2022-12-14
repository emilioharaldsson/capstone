package com.capstone.drnkscl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.capstone.drnkscl.entity.UserRole;

public interface UserRoleDAO extends JpaRepository<UserRole, Long>{
	
	public List<UserRole> findByUserId(Integer userId);
}

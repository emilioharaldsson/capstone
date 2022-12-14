package com.capstone.drnkscl.service;


import org.springframework.stereotype.Service;


import com.capstone.drnkscl.entity.User;
import com.capstone.drnkscl.form.CreateUserForm;

@Service("userService")
public class loginService{

	
	public User saveUser(User user, CreateUserForm form) {
		user.setEmail(form.getEmail());
		user.setPassword(form.getPassword());
		user.setFirstName(form.getFirstName());
		user.setLastName(form.getLastName());
		return user;
	}
	
}

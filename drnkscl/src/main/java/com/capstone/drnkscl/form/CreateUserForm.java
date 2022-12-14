package com.capstone.drnkscl.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreateUserForm {
	
	
	@NotEmpty(message = "Email is required")
	@Length(max = 200, message = "Email must be less than 200 characters")
	private String email;
	
	
	@Pattern(regexp = "^[a-zA-Z0-9!@#]+$", message = "Password can only contain lowercase, uppercase, and special caracters")
	@Length(min = 8, message = "Password must be longer than 8 characters.")
	@Length(max = 25, message = "password must be less than 25 characters")
	private String password;

	
	@Length(max = 45, message = "first name must be less than 45 characters")
	private String firstName;
	
	
	@Length(max = 45, message = "last name must be less than 45 characters")
	private String lastName;
	
	@Length(max = 50, message = "alias must be less than 50 characters")
	private String alias;
	
}

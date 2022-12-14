package com.capstone.drnkscl.form;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EditUserForm {
	private String email;
	private String firstName;
	private String lastName;
	private String alias;
}

package com.capstone.drnkscl.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NewDrinkForm {
	private String name;
	String [] ingredientName;
	Integer [] amount;
	String [] unit;
}

package com.capstone.drnkscl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@EqualsAndHashCode
@Table(name="recipe")
public class Recipe {
	@Id
	@Column(name = "id")
	@ToString.Include
	@GeneratedValue( strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="name")
	@ToString.Include
	private String name;
	
	@Column(name="author")
	@ToString.Include
	private Integer author;
	
	@Column(name="avatar")
	@ToString.Include
	private String avatar;


}

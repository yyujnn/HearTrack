package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Users {
	
	private String id;
	private String pw;
	private String user_name;
	private int age;

}

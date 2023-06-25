package com.project.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Hospital {
	
	private String hospital_name;
	private String hospital_num;
	private String hospital_location;
	private String users_fk_id;

}

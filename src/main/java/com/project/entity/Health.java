package com.project.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor 
@Data
public class Health {
	
	private int health_num;
	private int blood_pressure_high;
	private int blood_pressure_low;
	private int blood_sugar;
	private float weight;
	private float height;
	private float BMI;
	private Date input_date;
	private String users_fk_id;

}
